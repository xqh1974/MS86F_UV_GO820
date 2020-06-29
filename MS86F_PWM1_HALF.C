/**********************************************************
*�ļ���:MS86F_PWM1_HALF.c
*����:MS86Fxx02��PWM1���Ż������������ʾ
*�����ͺ�:MS86F1602
*����:�ڲ�RC 16MHz 2T
*���Ŷ���:
*                 ----------------
*  VDD-----------|1(VDD)   (GND)16|------------GND
*  NC------------|2(RA7)   (PA0)15|-------------NC
*  NC------------|3(PA6)   (PA1)14|-------------NC
*  NC------------|4(PA5)   (PA2)13|-------------NC
*  NC------------|5(PA4)   (PA3)12|-------------NC
*  NC------------|6(PC5)   (PC0)11|----------P1A2N
*  NC------------|7(PC4)   (PC1)10|-----------P1A2
*  NC------------|8(PC3)   (PC2)09|-------------NC
*                 ----------------
*                 MS86F1602 SOP16
*˵��:������������PWM1ģ�����һ������������,����Ϊ10KHz,
*     ռ�ձ�Ϊ75%PWM.
*ע��:1.PWM1ģ��������3·ͬ����,��ͬռ�ձȵ�PWM,��P1A��P1B��P1C
*     2.��3·PWM�������������ÿ������߲�����.������û�п���P1B��
*       P1C,��������P1A
*     3.ÿһ·PWM����ӳ�䵽ĳ�������ŵĹ���,�ҿ�������������ӳ��.
*       ����P1B����ӳ�䵽PA4�Ż���PA5��;�ֱ���P1A����ӳ�䵽PC5��
*       PC3��PC1.
*     4.P1A�ǿ��������һ·��P1A������PWM,���ǳ�֮Ϊ:P1AN,������
*       ����ͼ����:P1A0N��P1A1N��P1A2N.��������������PWMҲ�Ǹ�
*       P1Aһ������ӳ�䵽ĳ�����ܽ���(PC4��PC2��PC0)
*     5.P1A�ĸ�·�����߼�����:
*       a.P1A0=P1A1=P1A2,P1A0N=P1A2N=P1A2N
*       b.P1A0��P1A0N����
**********************************************************/
#include "SYSCFG.h";
#include "MS86Fxx01.h";
////////////////////////////PIN//////////////////////////////////////////////
/*
	VDD				1					14	VSS
    PA7				2					13	PA0/ICSPCLK
    PA6				3					12	PA1/ICSPDAT
    [P1B]/PA5	4					11	PA2/[P1C]
    P1B/PA4		5					10	PA3/P1C
    P1A0/PC5		6					9		PC0/[P1A2N]
    P1A0N/PC4	7					8		PC1/[P1A2]				  
*/
/////////////////////////////////////////////////////////////////////
//											VCC
#define PIN_CHRG_DET		RA7
#define PIN_UV_EN 				PA6
//For LVD								//RA5/[P1B]
#define PIN_UV_LED				RA4//P1B
//									 		PC5/P1A0
#define PIN_O3_EN				PC4//P1A0N	
/*-------------------------------------------*/
//											PC1//[P1A2]
#define PIN_CHRG_FULL		PC0//[P1A2N]
#define PIN_ION_EN			PA3///P1C
#define PIN_KEY_DET			PA2//[P1C]
//											PA1/ICSPDAT
//											PA0/ICSPCLK
//											VSS
////////////////////////////PIN////////////////////////////////////

#define PIN_INT_USED

typedef enum	
{
    STATE_SLEEPING=0,
    STATE_IDLE,
    STATE_WORKING,
    STATE_WARNING,
    STATE_BREAKING,
    STATE_CHARGING,
    STATE_CHARGED,
}WORK_STATE; 
WORK_STATE work_sta=STATE_IDLE;
typedef enum
{
    POWER_NORMAL=0,
    POWER_CHARGING,
    POWER_FULL,
    POWER_LOW,
}POWER_STAT;                                          
#define BRIGHTNESS_MIN 5
#define BRIGHTNESS_MAX 200
#define WORING_TIME (100*59*5)
//unsigned int working_timer=0;
volatile unsigned int working_timer=0;
volatile unsigned char second_cnt=0;
volatile unsigned short brigtness = BRIGHTNESS_MIN;
volatile unsigned char keytime=0;
/*====================================================
*������:DEVICE_INIT
*����:�ϵ�������ʼ��
*�������:��
*���ز���:��
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT����Ƶ��=32KHz
							//Bit6:4,IRCF[2:0]=101,�ڲ�RCƵ��=4MHz
							//Bit0,SCS=1,ϵͳʱ��ѡ��Ϊ�ڲ�����
	INTCON = 0B00000000;	//�ݽ�ֹ�����ж�
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
    
	PORTA = 0B01010000;
	TRISA  = 0B10100111;		//PORTA��RA3,RA4,R6Ϊ��������PORTA��Ϊ����
    WPUA  = 0B10100111;		//����PORTA���ڲ�����
    
	PORTC 	= 0B00000000;
	TRISC 	= 0B11101111;		//PORTC,RC4Ϊ����������Ϊ����
	WPUC 	= 0B11101111;		//PORTC�ڿ�������
    
    PSRCA  = 0B11111111;	//Դ�����������
    PSRCC  = 0B11111111;
    PSINKA = 0B11111111;	//������������
    PSINKC = 0B11111111;
    MSCON  = 0B00110000;
        
    //BIT5:PSRCAH4��PSRCA[4]��ͬ����Դ����.00:4mA; 11:33mA; 01��10:8mA
    //BIT4:PSRCAH3��PSRCA[3]��ͬ����Դ����.00:4mA; 11:33mA; 01��10:8mA
    //BIT3:UCFG1<1:0>Ϊ01ʱ��λ������.0:��ֹLVR; 1:��LVR
    //BIT2:��ʱ�Ӳ��������ڵ�ƽ��ģʽ.0:�ر�ƽ��ģʽ; 1:��ƽ��ģʽ
    //BIT1:0:�رտ�ʱ�Ӳ���������:1:�򿪿�ʱ�Ӳ���������
    //BIT0:0:˯��ʱֹͣ����:1:˯��ʱ���ֹ���.��T2ʱ�Ӳ���ѡ��ָ��ʱ�ӵ�ʱ��
}
/*====================================================
*������:PWM1_INIT
*����:�ϵ�������ʼ��
*�������:��
*���ز���:��
====================================================*/
void PWM1_INIT( )
{
    TRISA |= 0B00010000;		//�ر�RA4���,����Ϊ����
    //TRISC |= 0B00100000;		//�ر�RC5���,����Ϊ����

	T2CON0 = 0B00000001;
	T2CON1 = 0B00000000;
	PR2H = 0;
	PR2L = BRIGHTNESS_MAX-1;
	
    P1BDTH = 0;
	P1BDTL = BRIGHTNESS_MAX-BRIGHTNESS_MIN;
    //P1ADTH = 0;
	//P1ADTL = 150;
    
	P1OE  =	0B01000000;	//P1B
  	//P1OE |=   0B00000001;	//P1A0
    
	P1POL =	0B00000000;
	P1CON =	0B00001000;
	TMR2H =	0;
	TMR2L =	0;
	TMR2IF =	0;						//��Timer2ƥ���־λ
	TMR2ON = 1;					//����Timer2
	while(TMR2IF==0) CLRWDT();	//�ȴ�һ���µ�TMR2��������
    TRISA &= 0B11101111;		//�ر�RA4���,����Ϊ����
    //TRISC &= 0B11011111;		//�ر�RC5���,����Ϊ����
}
/******PWM1�������PWM����˵��******
A.����=(PR2+1)*Tt2ck*TMR2Ԥ��Ƶ��
  1.(PR2+1)=((PR2H:PR2L)+1)=199+1=200
  2.����Timer2ʱ��Դʱ��(Tt2ck)=(1/ʱ��ԴƵ��)*��������=(1/16MHz)*2T=0.125us
  3.TMR2Ԥ��Ƶ����T2CON0��bit1��bit0����,��������1:4
  4.�������=200*0.125us*4=100us,���Ƶ��=1/����=10KHz
B.ռ�ձ�=P1ADT/(PR2+1)
  1.P1ADT=(P1ADTH:P1ADTL)=150
  2.(PR2+1)��ǰ���������200
  3.���ռ�ձ�=150/200=75%
C.PWM1����˵��
  1.P1OE�Ǿ�����·PWM�Ƿ�Ҫ����ļĴ���,������BIT5��BIT4����1,Ҳ����ʹ��
    ��P1A2��P1A2N���;
  2.P1POL�����ø�·PWM�ĵ�ƽ��Ч���,Ҳ����PWM�ļ���
  3.P1CON�ڴ�����������������,bit7�ٴ�������Ч,��Ϊ���õ�����ɲ������
    ����ʱ��=Tt2ck*P1DC[6:0]=0.125us*0b0001000=1us
D.Tt2ck(��Timer2ʱ������)��ֵ,��T2CON2��[bit2:bit0]����
  1.=000,ָ��ʱ��=������ָ������=(1/ϵͳƵ��)*��������
  2.=001,ϵͳʱ��=(1/ϵͳƵ��)
  3.=010,HIRC��2��Ƶ.���ﲻ֧�ָ���ʱ��2��Ƶ
  4.=100,HIRC=(1/16MHz)=0.0625us
  5.=100,LIRC=(1/32KHz)=31.25us
******PWM1�������PWM����˵��******/

/*====================================================
*������:WDT_INIT
*����:���Ź���ʼ��
*�������:��
*���ز���:��
====================================================*/
void WDT_INIT(void)
{
	SWDTEN = 0;		//������ʱ�رտ��Ź�
								//���Ź����Ա�����Ϊһֱ�����޷������ر�,Ҳ����Ϊ��������or�ر�
								//�������λѡ��WDTE������ΪEnable,���Ź�һֱ�����޷������ر�
								//�������λѡ��WDTE������ΪDisable,���Ź����Ա���������or�ر�
	CLRWDT();
	OPTION = 0B00001000;		//Bit4=1 WDT MODE,PS=010=1:4 WDT RATE
	WDTCON = 0B00010101;		//WDTPS=1010=1:32768
								//��ʱʱ��=(1/32KHz)*32768*4=4s
								//bit0=1 �������Ź�
    SWDTEN = 1;
}
/*====================================================
*��������:DELAY_MS
*����:����ʱ����
*�������:Time��ʱʱ�䳤��,��ʱʱ��Time ms
*���ز���:�� 
====================================================*/
void DELAY_125US(void)
{
	unsigned char a;

	for(a=0;a<125;a++)
	{
		CLRWDT();
	}
}
void DELAY_MS(unsigned short Time)
{
	unsigned short a;
    
	Time<<=3;

	for(a=0;a<Time;a++)
	{
		DELAY_125US();
	}
}
volatile unsigned short T0_seconds=0;
volatile unsigned char T0_cnt=0;
volatile  unsigned char brightness=0;
volatile  unsigned char delay=0;
volatile  char dir=1;
volatile  char LED_SPEED=8;
volatile  char led_stat = 0;
void interrupt ISR(void)
{
#ifdef PIN_INT_USED
    if(INTE&&INTF)
	{
		INTF = 0;          //���־λ
	}
#endif    
	if(T0IE&&T0IF)
	{
		T0IF = 0;
		TMR0 = 6;
        T0_cnt++;
        if(T0_cnt>=125)
        {
            //if(working_timer)working_timer--;
            T0_cnt=0;
        }
                   
		if(work_sta==STATE_WARNING || work_sta==STATE_WORKING || work_sta==STATE_CHARGING)//led blink slowly or fastly or quickly
        {
            delay++;
            if(work_sta==STATE_CHARGING)delay++;//led blink fastly
            else if(work_sta==STATE_WARNING)delay++;//led blink quickly

            if(delay>LED_SPEED)
			{
				delay=0;
			   
				if(dir) 
				{            
					if(brightness<BRIGHTNESS_MAX)brightness++;
					else  dir=0;
				}
				else
				{
					if(brightness>BRIGHTNESS_MIN)brightness--;
					else  dir=1;
				}
		/*				
				if(brightness<(BRIGHTNESS_MAX/6))LED_SPEED=10;
				else if(brightness<(BRIGHTNESS_MAX/4))LED_SPEED=5;
				else if(brightness<(BRIGHTNESS_MAX/2))LED_SPEED=3;
				else LED_SPEED=1;

				if(brightness<BRIGHTNESS_MIN)P1BDTL = BRIGHTNESS_MIN;
				else P1BDTL = BRIGHTNESS_MAX-brightness; 
       */
				P1BDTL = BRIGHTNESS_MAX-brightness;
			}
        }
    }
}

/*====================================================
*������:TIMER0_INIT
*����:Timer0��ʼ��
*�������:��
*���ز���:��
====================================================*/
void TIMER0_INIT(void)
{
	T0CON0 = 0B00000000;
	OPTION = 0B00000111;           //Bit4=0 TIMER0 MODE,PS=011=1:256 TIMER0 RATE												
}

/*====================================================
*������:ENABLE_INTERRUPT
*����:���������ж�
*�������:��
*���ز���:��
====================================================*/
void ENABLE_INTERRUPT(void)
{
	T0IF = 0;                       //��TIMER0�жϱ�־λ
	T0IE = 1;                       //ʹ��TIMER0�ж�
	T0ON = 1;						//����Timer0
#ifdef PIN_INT_USED   
	INTEDG = 0;					//�½��ش����ж�
	INTF = 0;
	INTE = 1;
#endif    
	GIE = 1;                        //�������ж�
}
void DISABLE_INTERRUPT(void)
{
    INTE = 0;
    
	T0IF = 0;                       //��TIMER0�жϱ�־λ
	T0IE = 0;                       //ʹ��TIMER0�ж�
	T0ON = 0;						//����Timer0

	GIE = 0;                        //�������ж�
}
/*====================================================
*������:LVD_INIT
*����:�͵�ѹ����ʼ��
*�������:��
*���ز���:��
====================================================*/
void LVD_INIT(void)
{
 	//PCON = 0B11100011; //3.6
       PCON = 0B11010011; //3.0   
    //BIT7 LVDģ�����ѹԴѡ�� 1:����ⲿ�ܽ�PA5, 0:����ڲ���ѹ  
	//bit6~bit4 �͵�ѹ���ѡ��λ. 110:3.6V
    //bit3 �͵�ѹ���ʹ��. 1:����LVD��⹦��, 0:�ر�
    //bit2 �͵�ѹ��־λ,ֻ��. 1:VDD�������õ�ѹ����, 0:VDD����
    //bit1 �ϵ縴λ��־,����Ч. 0:�������ϵ縴λ,1:û�з���
    //bit0 �͵�ѹ��λ��־,����Ч. 0:�����˵�
    LVDEN = 1;		//�����͵�ѹ���
}
#ifdef PIN_INT_USED 
void SYS_SLEEP(void)
{
 #if 0
	GIE = 0;			//����������п����ж�,������ǰ��ʱ�ر����ж�
	CLRWDT();
	SWDTEN = 0; 		//�����رտ��Ź�
						//���Ź����Ա�����Ϊһֱ�����޷������ر�,Ҳ����Ϊ��������or�ر�
						//�������λѡ��WDTE������ΪEnable,���Ź�һֱ�����޷������ر�
						//�������λѡ��WDTE������ΪDisable,���Ź����Ա���������or�ر�
	SLVREN = 0; 		//�رյ͵�ѹ��λ,�͵�ѹ��λ���Ĵ����20uA
						//SLVREN�ڼĴ���MSCKCON��bit4
						//ͬʱ�������λѡ���LVREN������ΪSLVREN(�������Ƶ͵�ѹ��λ����)
						//��SLVREN=0,�͵�ѹ��λ�ر�
						//��SLVREN=1,�͵�ѹ��λ����
	INTEDG = 0;			//�½��ش����ж�
	INTF = 0;
	INTE = 1;
	SLEEP();
	NOP();
	INTE = 0;			//�ر�INT�ж�
	INTF = 0;			//���ⲿ�жϱ�־λ
	SLVREN = 1;			//���������͵�ѹ��λ
	SWDTEN = 1;			//�����������Ź�
	CLRWDT();
	GIE = 1;			//����������п����ж�,�ָ��������ж�
#else
	GIE = 0;			//����������п����ж�,������ǰ��ʱ�ر����ж�
	CLRWDT();
	//SWDTEN = 0; 		//�����رտ��Ź�
						//���Ź����Ա�����Ϊһֱ�����޷������ر�,Ҳ����Ϊ��������or�ر�
						//�������λѡ��WDTE������ΪEnable,���Ź�һֱ�����޷������ر�
						//�������λѡ��WDTE������ΪDisable,���Ź����Ա���������or�ر�
	SLVREN = 0; 		//�رյ͵�ѹ��λ,�͵�ѹ��λ���Ĵ����20uA
						//SLVREN�ڼĴ���MSCKCON��bit4
						//ͬʱ�������λѡ���LVREN������ΪSLVREN(�������Ƶ͵�ѹ��λ����)
						//��SLVREN=0,�͵�ѹ��λ�ر�
						//��SLVREN=1,�͵�ѹ��λ����
	INTEDG = 0;			//�½��ش����ж�
	INTF = 0;
	INTE = 1;                   
	SLEEP();
	NOP();
	INTE = 0;			//�ر�INT�ж�
	INTF = 0;			//���ⲿ�жϱ�־λ
	SLVREN = 1;			//���������͵�ѹ��λ
	SWDTEN = 1;			//�����������Ź�
	CLRWDT();
	GIE = 1;			//����������п����ж�,�ָ��������ж�
#endif
}
#endif
void led_on()
{
    DISABLE_INTERRUPT();
    P1BOE =	0;
    PIN_UV_LED=0;
}
void led_off()
{
    DISABLE_INTERRUPT();
    P1BOE =	0;
    PIN_UV_LED=1;
}
void led_blink()
{  
    brigtness=BRIGHTNESS_MIN;
    dir=1;
    P1BDTL=BRIGHTNESS_MAX-brigtness;
    P1BOE =	1;
    //ENABLE_INTERRUPT();
}

void SetUvWorking(void)
{    
	//��ʼ�����������⣬���������ȣ������ƿ�ʼ��  
	PIN_UV_EN=0;
    PIN_ION_EN=1;
    PIN_O3_EN=1;
	//working_timer=20*60*100;
    second_cnt=0;
    working_timer=20*59;
    
    work_sta=STATE_WORKING;
    led_blink();
}
void SetUvBreaking(void)
{
    PIN_UV_EN=1;
    PIN_ION_EN=0;
    PIN_O3_EN=0;
    
	//working_timer=10*60*100;
    second_cnt=0;
    working_timer=10*59;
    
    work_sta=STATE_BREAKING;
    led_on();
}
void SetUvWarning(void)
{
    PIN_UV_EN=1;
    PIN_ION_EN=0;
    PIN_O3_EN=0;
    
    //working_timer=2*100;
    second_cnt=0;
    working_timer=2;
    
    work_sta=STATE_WARNING;
    led_blink();
}
void SetUvCharging(void)
{
    PIN_UV_EN=1;
    PIN_ION_EN=0;
    PIN_O3_EN=0;
    work_sta=STATE_CHARGING;
    working_timer=-1;
    led_blink();
}
void SetUvCharged(void)
{
	//�����������ر����⣬����
	PIN_UV_EN=1;
    PIN_ION_EN=0;
    PIN_O3_EN=0;  
    working_timer=-1;
    work_sta=STATE_CHARGED;
    led_on();
}
void SetUvIdle(void)
{
	//�����������ر����⣬����
	PIN_UV_EN=1;
    PIN_ION_EN=0;
    PIN_O3_EN=0;  
    //working_timer=12*100;
     second_cnt=0;
     working_timer=12;
     
    work_sta=STATE_IDLE;
    led_on();
}
void SetUvSleep(void)
{  
    PIN_UV_EN=1;
    PIN_ION_EN=0;
    PIN_O3_EN=0;  
    working_timer=0;
    work_sta=STATE_SLEEPING;
    led_off();
#ifdef PIN_INT_USED 
	SYS_SLEEP();
    keytime=0;
#endif
}

char GetKeyEvent(void)
{
	//static unsigned char keytime=0;
    unsigned char key_event=0;
    if(PIN_KEY_DET==0)
    {
        if(keytime<200)
        {
			keytime++;
			if(keytime>=200)key_event = 2;
        }
    }
    else
    {
        if(keytime>10 && keytime<200)key_event=1;
        keytime=0;
    }
    return key_event;
}
POWER_STAT GetPwrSta()
{
      if(PIN_CHRG_FULL==0)return POWER_FULL;
      else if(PIN_CHRG_DET==0)return POWER_CHARGING;
      else if(LVDW)return POWER_LOW;
      else return POWER_NORMAL;
}
/*====================================================
*������:main
*����:������
*�������:��
*���ز���:��
====================================================*/

void main(void)
{
    POWER_STAT pwr_sta=POWER_NORMAL;
    unsigned char keycode=0; 
    
	DEVICE_INIT();	   //������ʼ��
    
	while(0)
    {
        PIN_UV_LED=PIN_KEY_DET;
        PIN_UV_EN=PIN_KEY_DET;
    }

	PWM1_INIT(); 
#ifdef PIN_INT_USED 
    ENABLE_INTERRUPT();
#endif
    LVD_INIT();

    SetUvIdle();
    WDT_INIT();
	 
	while(1)
    {
        keycode=GetKeyEvent();
        pwr_sta=GetPwrSta();
       
		if(pwr_sta==POWER_LOW)
        {
            if(work_sta==STATE_WORKING || work_sta==STATE_BREAKING || keycode)SetUvWarning();
        }
        else
        {
            switch(work_sta)
            {
             case STATE_SLEEPING:
				if(keycode==2)SetUvIdle();
                else if(pwr_sta==POWER_CHARGING)SetUvCharging();
				break;
			case STATE_IDLE:
				if(keycode==2)SetUvSleep();
                else if(keycode==1)SetUvWorking();
                else if(pwr_sta==POWER_CHARGING)SetUvCharging();
				break;
            case STATE_WORKING:
            case STATE_BREAKING:
				if(keycode==2)SetUvSleep();
				break;
            case STATE_WARNING:
				break;
            case STATE_CHARGING:
				if(keycode==1)SetUvWorking();
				else if(pwr_sta==POWER_FULL)SetUvCharged();
				else if(pwr_sta==POWER_NORMAL)SetUvSleep();
				break;
			case STATE_CHARGED:
				if(keycode==1)SetUvWorking();
				else if(keycode==2)SetUvSleep();
				else if(pwr_sta==POWER_CHARGING)SetUvCharging();
				else if(pwr_sta==POWER_NORMAL)SetUvSleep();
				break;
            }
        }
        
		if(working_timer>0)
        {
            if(working_timer!=-1)
            {
                second_cnt++;
                if(second_cnt>=100)
                {
					second_cnt=0;
					working_timer--;
                }
            }
            if(working_timer==0)
            {
                if(work_sta==STATE_WORKING)SetUvBreaking();
                else if(work_sta==STATE_BREAKING) SetUvWorking();
                else if(work_sta==STATE_WARNING || work_sta==STATE_IDLE)SetUvSleep();
            }
            else
            {
                brigtness++;
                if(work_sta==STATE_CHARGING)brigtness+=3;
                else  if(work_sta==STATE_WARNING)brigtness+=15;
                if(brigtness<=BRIGHTNESS_MAX)P1BDTL=(unsigned char)(BRIGHTNESS_MAX-brigtness);
				else if(brigtness<(BRIGHTNESS_MAX*2))P1BDTL=(unsigned char)(brigtness-BRIGHTNESS_MAX);
				else brigtness=BRIGHTNESS_MIN;
            }
        }
               
		DELAY_MS(10);
    }
}

