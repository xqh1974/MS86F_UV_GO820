/**********************************************************
*文件名:MS86F_PWM1_HALF.c
*功能:MS86Fxx02的PWM1半桥互补输出功能演示
*器件型号:MS86F1602
*振荡器:内部RC 16MHz 2T
*引脚定义:
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
*说明:该例程是设置PWM1模块输出一个互补带死区,周期为10KHz,
*     占空比为75%PWM.
*注意:1.PWM1模块可以输出3路同周期,不同占空比的PWM,即P1A、P1B和P1C
*     2.这3路PWM可以有软件设置开启或者不开启.该例程没有开启P1B和
*       P1C,仅开启了P1A
*     3.每一路PWM都有映射到某几个引脚的功能,且可以由软件设置映射.
*       比如P1B可以映射到PA4脚或者PA5脚;又比如P1A可以映射到PC5、
*       PC3和PC1.
*     4.P1A是可以输出另一路与P1A互补的PWM,我们称之为:P1AN,体现在
*       引脚图上是:P1A0N、P1A1N和P1A2N.并且这个互补输出PWM也是跟
*       P1A一样具有映射到某几个管脚上(PC4、PC2和PC0)
*     5.P1A的各路波形逻辑如下:
*       a.P1A0=P1A1=P1A2,P1A0N=P1A2N=P1A2N
*       b.P1A0与P1A0N互补
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
*函数名:DEVICE_INIT
*功能:上电器件初始化
*输入参数:无
*返回参数:无
====================================================*/
void DEVICE_INIT(void)
{
	OSCCON = 0B01110001;	//Bit7,LFMOD=0,WDT振荡器频率=32KHz
							//Bit6:4,IRCF[2:0]=101,内部RC频率=4MHz
							//Bit0,SCS=1,系统时钟选择为内部振荡器
	INTCON = 0B00000000;	//暂禁止所有中断
	OPTION = 0B00001000;	//Bit4=1 WDT MODE,PS=000=1:1 WDT RATE
    
	PORTA = 0B01010000;
	TRISA  = 0B10100111;		//PORTA口RA3,RA4,R6为出，其他PORTA口为输入
    WPUA  = 0B10100111;		//开启PORTA口内部上拉
    
	PORTC 	= 0B00000000;
	TRISC 	= 0B11101111;		//PORTC,RC4为输出，其余口为输入
	WPUC 	= 0B11101111;		//PORTC口开启上拉
    
    PSRCA  = 0B11111111;	//源电流设置最大
    PSRCC  = 0B11111111;
    PSINKA = 0B11111111;	//灌电流设置最大
    PSINKC = 0B11111111;
    MSCON  = 0B00110000;
        
    //BIT5:PSRCAH4和PSRCA[4]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT4:PSRCAH3和PSRCA[3]共同决定源电流.00:4mA; 11:33mA; 01、10:8mA
    //BIT3:UCFG1<1:0>为01时此位有意义.0:禁止LVR; 1:打开LVR
    //BIT2:快时钟测量慢周期的平均模式.0:关闭平均模式; 1:打开平均模式
    //BIT1:0:关闭快时钟测量慢周期:1:打开快时钟测量慢周期
    //BIT0:0:睡眠时停止工作:1:睡眠时保持工作.当T2时钟不是选择指令时钟的时候
}
/*====================================================
*函数名:PWM1_INIT
*功能:上电器件初始化
*输入参数:无
*返回参数:无
====================================================*/
void PWM1_INIT( )
{
    TRISA |= 0B00010000;		//关闭RA4输出,设置为输入
    //TRISC |= 0B00100000;		//关闭RC5输出,设置为输入

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
	TMR2IF =	0;						//清Timer2匹配标志位
	TMR2ON = 1;					//开启Timer2
	while(TMR2IF==0) CLRWDT();	//等待一个新的TMR2周期来临
    TRISA &= 0B11101111;		//关闭RA4输出,设置为输入
    //TRISC &= 0B11011111;		//关闭RC5输出,设置为输入
}
/******PWM1输出互补PWM功能说明******
A.周期=(PR2+1)*Tt2ck*TMR2预分频比
  1.(PR2+1)=((PR2H:PR2L)+1)=199+1=200
  2.计算Timer2时钟源时间(Tt2ck)=(1/时钟源频率)*机器周期=(1/16MHz)*2T=0.125us
  3.TMR2预分频比由T2CON0的bit1和bit0决定,此例程是1:4
  4.算出周期=200*0.125us*4=100us,因此频率=1/周期=10KHz
B.占空比=P1ADT/(PR2+1)
  1.P1ADT=(P1ADTH:P1ADTL)=150
  2.(PR2+1)由前面算出等于200
  3.算出占空比=150/200=75%
C.PWM1生成说明
  1.P1OE是决定各路PWM是否要输出的寄存器,例程中BIT5和BIT4被置1,也就是使能
    了P1A2和P1A2N输出;
  2.P1POL是设置各路PWM的电平有效情况,也就是PWM的极性
  3.P1CON在此例程中是设置死区,bit7再此例程无效,因为无用到故障刹车功能
    死区时间=Tt2ck*P1DC[6:0]=0.125us*0b0001000=1us
D.Tt2ck(即Timer2时钟周期)的值,由T2CON2的[bit2:bit0]决定
  1.=000,指令时钟=单周期指令周期=(1/系统频率)*机器周期
  2.=001,系统时钟=(1/系统频率)
  3.=010,HIRC的2倍频.这里不支持高速时钟2倍频
  4.=100,HIRC=(1/16MHz)=0.0625us
  5.=100,LIRC=(1/32KHz)=31.25us
******PWM1输出互补PWM功能说明******/

/*====================================================
*函数名:WDT_INIT
*功能:看门狗初始化
*输入参数:无
*返回参数:无
====================================================*/
void WDT_INIT(void)
{
	SWDTEN = 0;		//软件暂时关闭看门狗
								//看门狗可以被设置为一直开启无法软件关闭,也可以为软件开启or关闭
								//如果配置位选项WDTE被设置为Enable,则看门狗一直开启无法软件关闭
								//如果配置位选项WDTE被设置为Disable,则看门狗可以被软件开启or关闭
	CLRWDT();
	OPTION = 0B00001000;		//Bit4=1 WDT MODE,PS=010=1:4 WDT RATE
	WDTCON = 0B00010101;		//WDTPS=1010=1:32768
								//超时时间=(1/32KHz)*32768*4=4s
								//bit0=1 开启看门狗
    SWDTEN = 1;
}
/*====================================================
*函数名称:DELAY_MS
*功能:短延时函数
*输入参数:Time延时时间长度,延时时长Time ms
*返回参数:无 
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
		INTF = 0;          //清标志位
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
*函数名:TIMER0_INIT
*功能:Timer0初始化
*输入参数:无
*返回参数:无
====================================================*/
void TIMER0_INIT(void)
{
	T0CON0 = 0B00000000;
	OPTION = 0B00000111;           //Bit4=0 TIMER0 MODE,PS=011=1:256 TIMER0 RATE												
}

/*====================================================
*函数名:ENABLE_INTERRUPT
*功能:开启所需中断
*输入参数:无
*返回参数:无
====================================================*/
void ENABLE_INTERRUPT(void)
{
	T0IF = 0;                       //清TIMER0中断标志位
	T0IE = 1;                       //使能TIMER0中断
	T0ON = 1;						//开启Timer0
#ifdef PIN_INT_USED   
	INTEDG = 0;					//下降沿触发中断
	INTF = 0;
	INTE = 1;
#endif    
	GIE = 1;                        //开启总中断
}
void DISABLE_INTERRUPT(void)
{
    INTE = 0;
    
	T0IF = 0;                       //清TIMER0中断标志位
	T0IE = 0;                       //使能TIMER0中断
	T0ON = 0;						//开启Timer0

	GIE = 0;                        //开启总中断
}
/*====================================================
*函数名:LVD_INIT
*功能:低电压检测初始化
*输入参数:无
*返回参数:无
====================================================*/
void LVD_INIT(void)
{
 	//PCON = 0B11100011; //3.6
       PCON = 0B11010011; //3.0   
    //BIT7 LVD模块检测电压源选择 1:检测外部管脚PA5, 0:检测内部电压  
	//bit6~bit4 低电压侦测选择位. 110:3.6V
    //bit3 低电压侦测使能. 1:开启LVD侦测功能, 0:关闭
    //bit2 低电压标志位,只读. 1:VDD掉了设置电压以下, 0:VDD正常
    //bit1 上电复位标志,低有效. 0:发生了上电复位,1:没有发生
    //bit0 低电压复位标志,低有效. 0:发生了低
    LVDEN = 1;		//开启低电压检测
}
#ifdef PIN_INT_USED 
void SYS_SLEEP(void)
{
 #if 0
	GIE = 0;			//如果程序中有开启中断,在休眠前暂时关闭总中断
	CLRWDT();
	SWDTEN = 0; 		//软件关闭看门狗
						//看门狗可以被设置为一直开启无法软件关闭,也可以为软件开启or关闭
						//如果配置位选项WDTE被设置为Enable,则看门狗一直开启无法软件关闭
						//如果配置位选项WDTE被设置为Disable,则看门狗可以被软件开启or关闭
	SLVREN = 0; 		//关闭低电压复位,低电压复位功耗大概是20uA
						//SLVREN在寄存器MSCKCON的bit4
						//同时如果配置位选项的LVREN被设置为SLVREN(软件控制低电压复位开关)
						//当SLVREN=0,低电压复位关闭
						//当SLVREN=1,低电压复位开启
	INTEDG = 0;			//下降沿触发中断
	INTF = 0;
	INTE = 1;
	SLEEP();
	NOP();
	INTE = 0;			//关闭INT中断
	INTF = 0;			//清外部中断标志位
	SLVREN = 1;			//软件开启低电压复位
	SWDTEN = 1;			//软件开启看门狗
	CLRWDT();
	GIE = 1;			//如果程序中有开启中断,恢复开启总中断
#else
	GIE = 0;			//如果程序中有开启中断,在休眠前暂时关闭总中断
	CLRWDT();
	//SWDTEN = 0; 		//软件关闭看门狗
						//看门狗可以被设置为一直开启无法软件关闭,也可以为软件开启or关闭
						//如果配置位选项WDTE被设置为Enable,则看门狗一直开启无法软件关闭
						//如果配置位选项WDTE被设置为Disable,则看门狗可以被软件开启or关闭
	SLVREN = 0; 		//关闭低电压复位,低电压复位功耗大概是20uA
						//SLVREN在寄存器MSCKCON的bit4
						//同时如果配置位选项的LVREN被设置为SLVREN(软件控制低电压复位开关)
						//当SLVREN=0,低电压复位关闭
						//当SLVREN=1,低电压复位开启
	INTEDG = 0;			//下降沿触发中断
	INTF = 0;
	INTE = 1;                   
	SLEEP();
	NOP();
	INTE = 0;			//关闭INT中断
	INTF = 0;			//清外部中断标志位
	SLVREN = 1;			//软件开启低电压复位
	SWDTEN = 1;			//软件开启看门狗
	CLRWDT();
	GIE = 1;			//如果程序中有开启中断,恢复开启总中断
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
	//开始消毒，打开紫外，臭氧，风扇，消毒灯开始闪  
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
	//消毒结束，关闭紫外，臭氧
	PIN_UV_EN=1;
    PIN_ION_EN=0;
    PIN_O3_EN=0;  
    working_timer=-1;
    work_sta=STATE_CHARGED;
    led_on();
}
void SetUvIdle(void)
{
	//消毒结束，关闭紫外，臭氧
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
*函数名:main
*功能:主函数
*输入参数:无
*返回参数:无
====================================================*/

void main(void)
{
    POWER_STAT pwr_sta=POWER_NORMAL;
    unsigned char keycode=0; 
    
	DEVICE_INIT();	   //器件初始化
    
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


