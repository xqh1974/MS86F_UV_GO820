opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16F685
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_DEVICE_INIT
	FNCALL	_main,_TIMER0_INIT
	FNCALL	_main,_ENABLE_INTERRUPT
	FNCALL	_main,_SetUvIdle
	FNCALL	_main,_GetKeyEvent
	FNCALL	_main,_SetUvWorking
	FNCALL	_main,_SetUvSleep
	FNCALL	_main,_DELAY_MS
	FNCALL	_DELAY_MS,_DELAY_125US
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_LED_SPEED
	global	_dir
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"MS86F_PWM1_HALF.C"
	line	202

;initializer for _LED_SPEED
	retlw	08h
	line	201

;initializer for _dir
	retlw	01h
	global	_T0_seconds
	global	GetKeyEvent@keytime
	global	_T0_cnt
	global	_brightness
	global	_delay
	global	_machine_state
	global	_ANSEL
_ANSEL	set	286
	DABS	1,286,1	;_ANSEL

	global	_ANSELH
_ANSELH	set	287
	DABS	1,287,1	;_ANSELH

	global	_CM1CON0
_CM1CON0	set	281
	DABS	1,281,1	;_CM1CON0

	global	_CM2CON0
_CM2CON0	set	282
	DABS	1,282,1	;_CM2CON0

	global	_CM2CON1
_CM2CON1	set	283
	DABS	1,283,1	;_CM2CON1

	global	_EEADRH
_EEADRH	set	271
	DABS	1,271,1	;_EEADRH

	global	_EEDATH
_EEDATH	set	270
	DABS	1,270,1	;_EEDATH

	global	_IOCB
_IOCB	set	278
	DABS	1,278,1	;_IOCB

	global	_PSTRCON
_PSTRCON	set	413
	DABS	1,413,1	;_PSTRCON

	global	_SRCON
_SRCON	set	414
	DABS	1,414,1	;_SRCON

	global	_VRCON
_VRCON	set	280
	DABS	1,280,1	;_VRCON

	global	_WPUB
_WPUB	set	277
	DABS	1,277,1	;_WPUB

	global	_ANS0
_ANS0	set	2288
	DABS	1,286,1	;_ANS0

	global	_ANS1
_ANS1	set	2289
	DABS	1,286,1	;_ANS1

	global	_ANS10
_ANS10	set	2298
	DABS	1,287,1	;_ANS10

	global	_ANS11
_ANS11	set	2299
	DABS	1,287,1	;_ANS11

	global	_ANS2
_ANS2	set	2290
	DABS	1,286,1	;_ANS2

	global	_ANS3
_ANS3	set	2291
	DABS	1,286,1	;_ANS3

	global	_ANS4
_ANS4	set	2292
	DABS	1,286,1	;_ANS4

	global	_ANS5
_ANS5	set	2293
	DABS	1,286,1	;_ANS5

	global	_ANS6
_ANS6	set	2294
	DABS	1,286,1	;_ANS6

	global	_ANS7
_ANS7	set	2295
	DABS	1,286,1	;_ANS7

	global	_ANS8
_ANS8	set	2296
	DABS	1,287,1	;_ANS8

	global	_ANS9
_ANS9	set	2297
	DABS	1,287,1	;_ANS9

	global	_C1CH0
_C1CH0	set	2248
	DABS	1,281,1	;_C1CH0

	global	_C1CH1
_C1CH1	set	2249
	DABS	1,281,1	;_C1CH1

	global	_C1OE
_C1OE	set	2253
	DABS	1,281,1	;_C1OE

	global	_C1ON
_C1ON	set	2255
	DABS	1,281,1	;_C1ON

	global	_C1OUT
_C1OUT	set	2254
	DABS	1,281,1	;_C1OUT

	global	_C1POL
_C1POL	set	2252
	DABS	1,281,1	;_C1POL

	global	_C1R
_C1R	set	2250
	DABS	1,281,1	;_C1R

	global	_C1SEN
_C1SEN	set	3317
	DABS	1,414,1	;_C1SEN

	global	_C1VREN
_C1VREN	set	2247
	DABS	1,280,1	;_C1VREN

	global	_C2CH0
_C2CH0	set	2256
	DABS	1,282,1	;_C2CH0

	global	_C2CH1
_C2CH1	set	2257
	DABS	1,282,1	;_C2CH1

	global	_C2OE
_C2OE	set	2261
	DABS	1,282,1	;_C2OE

	global	_C2ON
_C2ON	set	2263
	DABS	1,282,1	;_C2ON

	global	_C2OUT
_C2OUT	set	2262
	DABS	1,282,1	;_C2OUT

	global	_C2POL
_C2POL	set	2260
	DABS	1,282,1	;_C2POL

	global	_C2R
_C2R	set	2258
	DABS	1,282,1	;_C2R

	global	_C2REN
_C2REN	set	3316
	DABS	1,414,1	;_C2REN

	global	_C2SYNC
_C2SYNC	set	2264
	DABS	1,283,1	;_C2SYNC

	global	_C2VREN
_C2VREN	set	2246
	DABS	1,280,1	;_C2VREN

	global	_EEPGD
_EEPGD	set	3175
	DABS	1,396,1	;_EEPGD

	global	_IOCB4
_IOCB4	set	2228
	DABS	1,278,1	;_IOCB4

	global	_IOCB5
_IOCB5	set	2229
	DABS	1,278,1	;_IOCB5

	global	_IOCB6
_IOCB6	set	2230
	DABS	1,278,1	;_IOCB6

	global	_IOCB7
_IOCB7	set	2231
	DABS	1,278,1	;_IOCB7

	global	_MC1OUT
_MC1OUT	set	2271
	DABS	1,283,1	;_MC1OUT

	global	_MC2OUT
_MC2OUT	set	2270
	DABS	1,283,1	;_MC2OUT

	global	_PULSR
_PULSR	set	3314
	DABS	1,414,1	;_PULSR

	global	_PULSS
_PULSS	set	3315
	DABS	1,414,1	;_PULSS

	global	_SR0
_SR0	set	3318
	DABS	1,414,1	;_SR0

	global	_SR1
_SR1	set	3319
	DABS	1,414,1	;_SR1

	global	_STRA
_STRA	set	3304
	DABS	1,413,1	;_STRA

	global	_STRB
_STRB	set	3305
	DABS	1,413,1	;_STRB

	global	_STRC
_STRC	set	3306
	DABS	1,413,1	;_STRC

	global	_STRD
_STRD	set	3307
	DABS	1,413,1	;_STRD

	global	_STRSYNC
_STRSYNC	set	3308
	DABS	1,413,1	;_STRSYNC

	global	_T1GSS
_T1GSS	set	2265
	DABS	1,283,1	;_T1GSS

	global	_VP6EN
_VP6EN	set	2244
	DABS	1,280,1	;_VP6EN

	global	_VR0
_VR0	set	2240
	DABS	1,280,1	;_VR0

	global	_VR1
_VR1	set	2241
	DABS	1,280,1	;_VR1

	global	_VR2
_VR2	set	2242
	DABS	1,280,1	;_VR2

	global	_VR3
_VR3	set	2243
	DABS	1,280,1	;_VR3

	global	_VRR
_VRR	set	2245
	DABS	1,280,1	;_VRR

	global	_WPUB4
_WPUB4	set	2220
	DABS	1,277,1	;_WPUB4

	global	_WPUB5
_WPUB5	set	2221
	DABS	1,277,1	;_WPUB5

	global	_WPUB6
_WPUB6	set	2222
	DABS	1,277,1	;_WPUB6

	global	_WPUB7
_WPUB7	set	2223
	DABS	1,277,1	;_WPUB7

	global	_WREN
_WREN	set	3170
	DABS	1,396,1	;_WREN

	global	_working_timer
psect	nvBANK0,class=BANK0,space=1
global __pnvBANK0
__pnvBANK0:
_working_timer:
       ds      2

	global	_led_stat
psect	nvCOMMON,class=COMMON,space=1
global __pnvCOMMON
__pnvCOMMON:
_led_stat:
       ds      1

	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T0CON0
_T0CON0	set	31
	global	_TMR0
_TMR0	set	1
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PA2
_PA2	set	42
	global	_PA6
_PA6	set	46
	global	_PC1
_PC1	set	57
	global	_PC4
_PC4	set	60
	global	_PC5
_PC5	set	61
	global	_RA4
_RA4	set	44
	global	_RA7
_RA7	set	47
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_T0ON
_T0ON	set	251
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_PSINKA
_PSINKA	set	151
	global	_PSINKC
_PSINKC	set	159
	global	_PSRCA
_PSRCA	set	136
	global	_PSRCC
_PSRCC	set	148
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_WPUA
_WPUA	set	149
	global	_WPUC
_WPUC	set	147
	global	_INTEDG
_INTEDG	set	1038
	file	"ms86_uv_d6.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
GetKeyEvent@keytime:
       ds      1

_T0_cnt:
       ds      1

_brightness:
       ds      1

_delay:
       ds      1

_machine_state:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_T0_seconds:
       ds      2

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"MS86F_PWM1_HALF.C"
	line	202
_LED_SPEED:
       ds      1

psect	dataBANK0
	file	"MS86F_PWM1_HALF.C"
	line	201
_dir:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_DEVICE_INIT
?_DEVICE_INIT:	; 0 bytes @ 0x0
	global	?_DELAY_125US
?_DELAY_125US:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_TIMER0_INIT
?_TIMER0_INIT:	; 0 bytes @ 0x0
	global	?_ENABLE_INTERRUPT
?_ENABLE_INTERRUPT:	; 0 bytes @ 0x0
	global	?_SetUvWorking
?_SetUvWorking:	; 0 bytes @ 0x0
	global	?_SetUvIdle
?_SetUvIdle:	; 0 bytes @ 0x0
	global	?_SetUvSleep
?_SetUvSleep:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_GetKeyEvent
?_GetKeyEvent:	; 1 bytes @ 0x0
	ds	2
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x2
	global	??_DELAY_125US
??_DELAY_125US:	; 0 bytes @ 0x2
	global	??_TIMER0_INIT
??_TIMER0_INIT:	; 0 bytes @ 0x2
	global	??_ENABLE_INTERRUPT
??_ENABLE_INTERRUPT:	; 0 bytes @ 0x2
	global	??_SetUvWorking
??_SetUvWorking:	; 0 bytes @ 0x2
	global	??_SetUvIdle
??_SetUvIdle:	; 0 bytes @ 0x2
	global	??_SetUvSleep
??_SetUvSleep:	; 0 bytes @ 0x2
	global	??_GetKeyEvent
??_GetKeyEvent:	; 0 bytes @ 0x2
	global	DELAY_125US@a
DELAY_125US@a:	; 1 bytes @ 0x2
	global	GetKeyEvent@key_event
GetKeyEvent@key_event:	; 1 bytes @ 0x2
	ds	1
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x3
	global	DELAY_MS@Time
DELAY_MS@Time:	; 2 bytes @ 0x3
	ds	2
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x5
	global	??_main
??_main:	; 0 bytes @ 0x5
	global	main@keycode
main@keycode:	; 1 bytes @ 0x5
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	DELAY_MS@a
DELAY_MS@a:	; 2 bytes @ 0x0
	ds	2
;;Data sizes: Strings 0, constant 0, data 2, bss 7, persistent 3 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           48      2       8

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DELAY_MS
;;   _DELAY_MS->_DELAY_125US
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_DELAY_MS
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 1     1      0     232
;;                                              5 COMMON     1     1      0
;;                        _DEVICE_INIT
;;                        _TIMER0_INIT
;;                   _ENABLE_INTERRUPT
;;                          _SetUvIdle
;;                        _GetKeyEvent
;;                       _SetUvWorking
;;                         _SetUvSleep
;;                           _DELAY_MS
;; ---------------------------------------------------------------------------------
;; (1) _DELAY_MS                                             4     2      2     139
;;                                              3 COMMON     2     0      2
;;                                              0 BANK0      2     2      0
;;                        _DELAY_125US
;; ---------------------------------------------------------------------------------
;; (1) _GetKeyEvent                                          1     1      0      25
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _SetUvSleep                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _SetUvIdle                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _SetUvWorking                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE_INTERRUPT                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _TIMER0_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_125US                                          1     1      0      68
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _TIMER0_INIT
;;   _ENABLE_INTERRUPT
;;   _SetUvIdle
;;   _GetKeyEvent
;;   _SetUvWorking
;;   _SetUvSleep
;;   _DELAY_MS
;;     _DELAY_125US
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      16       3        0.0%
;;ABS                  0      0      14       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               30      2       8       5       16.7%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 431 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  keycode         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 20/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_DEVICE_INIT
;;		_TIMER0_INIT
;;		_ENABLE_INTERRUPT
;;		_SetUvIdle
;;		_GetKeyEvent
;;		_SetUvWorking
;;		_SetUvSleep
;;		_DELAY_MS
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MS86F_PWM1_HALF.C"
	line	431
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	432
	
l2348:	
	line	433
	
l2350:	
;MS86F_PWM1_HALF.C: 433: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	436
	
l2352:	
;MS86F_PWM1_HALF.C: 436: TIMER0_INIT();
	fcall	_TIMER0_INIT
	line	437
	
l2354:	
;MS86F_PWM1_HALF.C: 437: ENABLE_INTERRUPT();
	fcall	_ENABLE_INTERRUPT
	line	440
	
l2356:	
;MS86F_PWM1_HALF.C: 440: SetUvIdle();
	fcall	_SetUvIdle
	line	441
	
l2358:	
;MS86F_PWM1_HALF.C: 441: working_timer=10;
	movlw	0Ah
	movwf	(_working_timer)
	clrf	(_working_timer+1)
	line	462
	
l2360:	
;MS86F_PWM1_HALF.C: 461: {
;MS86F_PWM1_HALF.C: 462: keycode=GetKeyEvent();
	fcall	_GetKeyEvent
	movwf	(main@keycode)
	line	463
	
l2362:	
;MS86F_PWM1_HALF.C: 463: if(keycode==1)
	decf	(main@keycode),w
	skipz
	goto	u591
	goto	u590
u591:
	goto	l2368
u590:
	line	465
	
l2364:	
;MS86F_PWM1_HALF.C: 464: {
;MS86F_PWM1_HALF.C: 465: if(machine_state == STATE_IDL)
	movf	(_machine_state),f
	skipz
	goto	u601
	goto	u600
u601:
	goto	l2380
u600:
	line	476
	
l2366:	
;MS86F_PWM1_HALF.C: 466: {
;MS86F_PWM1_HALF.C: 475: {
;MS86F_PWM1_HALF.C: 476: led_stat=4;
	movlw	(04h)
	movwf	(_led_stat)	;volatile
	line	477
;MS86F_PWM1_HALF.C: 477: working_timer=10;
	movlw	0Ah
	movwf	(_working_timer)
	clrf	(_working_timer+1)
	goto	l2380
	line	481
	
l2368:	
;MS86F_PWM1_HALF.C: 481: else if(keycode==2)
	movf	(main@keycode),w
	xorlw	02h
	skipz
	goto	u611
	goto	u610
u611:
	goto	l2380
u610:
	line	483
	
l2370:	
;MS86F_PWM1_HALF.C: 482: {
;MS86F_PWM1_HALF.C: 483: if(machine_state == STATE_IDL)
	movf	(_machine_state),f
	skipz
	goto	u621
	goto	u620
u621:
	goto	l2378
u620:
	line	485
	
l2372:	
;MS86F_PWM1_HALF.C: 484: {
;MS86F_PWM1_HALF.C: 485: machine_state = STATE_WORKING;
	clrf	(_machine_state)
	incf	(_machine_state),f
	line	486
	
l2374:	
;MS86F_PWM1_HALF.C: 486: SetUvWorking();
	fcall	_SetUvWorking
	line	487
	
l2376:	
;MS86F_PWM1_HALF.C: 487: working_timer=(60*25);
	movlw	low(05DCh)
	movwf	(_working_timer)
	movlw	high(05DCh)
	movwf	((_working_timer))+1
	line	488
;MS86F_PWM1_HALF.C: 488: }
	goto	l2380
	line	491
	
l2378:	
;MS86F_PWM1_HALF.C: 489: else
;MS86F_PWM1_HALF.C: 490: {
;MS86F_PWM1_HALF.C: 491: machine_state = STATE_IDL;
	clrf	(_machine_state)
	line	492
;MS86F_PWM1_HALF.C: 492: working_timer=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	line	506
	
l2380:	
;MS86F_PWM1_HALF.C: 493: }
;MS86F_PWM1_HALF.C: 494: }
;MS86F_PWM1_HALF.C: 506: if(working_timer==0)
	movf	((_working_timer+1)),w
	iorwf	((_working_timer)),w
	skipz
	goto	u631
	goto	u630
u631:
	goto	l2404
u630:
	line	508
	
l2382:	
;MS86F_PWM1_HALF.C: 507: {
;MS86F_PWM1_HALF.C: 508: if(machine_state==STATE_BRAEK)
	movf	(_machine_state),w
	xorlw	02h
	skipz
	goto	u641
	goto	u640
u641:
	goto	l2390
u640:
	line	510
	
l2384:	
;MS86F_PWM1_HALF.C: 509: {
;MS86F_PWM1_HALF.C: 510: machine_state = STATE_WORKING;
	clrf	(_machine_state)
	incf	(_machine_state),f
	line	511
	
l2386:	
;MS86F_PWM1_HALF.C: 511: SetUvWorking();
	fcall	_SetUvWorking
	line	512
	
l2388:	
;MS86F_PWM1_HALF.C: 512: working_timer=(60*25);
	movlw	low(05DCh)
	movwf	(_working_timer)
	movlw	high(05DCh)
	movwf	((_working_timer))+1
	line	513
;MS86F_PWM1_HALF.C: 513: }
	goto	l2404
	line	514
	
l2390:	
;MS86F_PWM1_HALF.C: 514: else if(machine_state==STATE_WORKING)
	decf	(_machine_state),w
	skipz
	goto	u651
	goto	u650
u651:
	goto	l891
u650:
	line	516
	
l2392:	
;MS86F_PWM1_HALF.C: 515: {
;MS86F_PWM1_HALF.C: 516: machine_state = STATE_BRAEK;
	movlw	(02h)
	movwf	(_machine_state)
	line	517
	
l2394:	
;MS86F_PWM1_HALF.C: 517: SetUvIdle();
	fcall	_SetUvIdle
	line	518
	
l2396:	
;MS86F_PWM1_HALF.C: 518: working_timer=(60*10);
	movlw	low(0258h)
	movwf	(_working_timer)
	movlw	high(0258h)
	movwf	((_working_timer))+1
	line	519
;MS86F_PWM1_HALF.C: 519: }
	goto	l2404
	line	520
	
l891:	
	line	522
;MS86F_PWM1_HALF.C: 520: else
;MS86F_PWM1_HALF.C: 521: {
;MS86F_PWM1_HALF.C: 522: if(!PC5) led_stat=2;
	btfsc	(61/8),(61)&7
	goto	u661
	goto	u660
u661:
	goto	l893
u660:
	
l2398:	
	movlw	(02h)
	movwf	(_led_stat)	;volatile
	goto	l2404
	line	523
	
l893:	
;MS86F_PWM1_HALF.C: 523: else if(!PC4) led_stat=4;
	btfsc	(60/8),(60)&7
	goto	u671
	goto	u670
u671:
	goto	l2402
u670:
	
l2400:	
	movlw	(04h)
	movwf	(_led_stat)	;volatile
	goto	l2404
	line	524
	
l2402:	
;MS86F_PWM1_HALF.C: 524: else SetUvSleep();
	fcall	_SetUvSleep
	line	528
	
l2404:	
;MS86F_PWM1_HALF.C: 525: }
;MS86F_PWM1_HALF.C: 526: }
;MS86F_PWM1_HALF.C: 528: DELAY_MS(10);
	movlw	0Ah
	movwf	(?_DELAY_MS)
	clrf	(?_DELAY_MS+1)
	fcall	_DELAY_MS
	goto	l2360
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	530
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DELAY_MS
psect	text349,local,class=CODE,delta=2
global __ptext349
__ptext349:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 187 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  Time            2    3[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  a               2    0[BANK0 ] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         2       0
;;      Locals:         0       2
;;      Temps:          0       0
;;      Totals:         2       2
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY_125US
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text349
	file	"MS86F_PWM1_HALF.C"
	line	187
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 5
; Regs used in _DELAY_MS: [wreg+status,2+status,0+pclath+cstack]
	line	190
	
l2338:	
;MS86F_PWM1_HALF.C: 188: unsigned short a;
;MS86F_PWM1_HALF.C: 190: Time<<=3;
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	line	192
	
l2340:	
;MS86F_PWM1_HALF.C: 192: for(a=0;a<Time;a++)
	clrf	(DELAY_MS@a)
	clrf	(DELAY_MS@a+1)
	goto	l2346
	line	194
	
l2342:	
;MS86F_PWM1_HALF.C: 193: {
;MS86F_PWM1_HALF.C: 194: DELAY_125US();
	fcall	_DELAY_125US
	line	192
	
l2344:	
	bcf	status, 5	;RP0=0, select bank0
	incf	(DELAY_MS@a),f
	skipnz
	incf	(DELAY_MS@a+1),f
	
l2346:	
	movf	(DELAY_MS@Time+1),w
	subwf	(DELAY_MS@a+1),w
	skipz
	goto	u585
	movf	(DELAY_MS@Time),w
	subwf	(DELAY_MS@a),w
u585:
	skipc
	goto	u581
	goto	u580
u581:
	goto	l2342
u580:
	line	196
	
l826:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_GetKeyEvent
psect	text350,local,class=CODE,delta=2
global __ptext350
__ptext350:

;; *************** function _GetKeyEvent *****************
;; Defined at:
;;		line 406 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key_event       1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text350
	file	"MS86F_PWM1_HALF.C"
	line	406
	global	__size_of_GetKeyEvent
	__size_of_GetKeyEvent	equ	__end_of_GetKeyEvent-_GetKeyEvent
	
_GetKeyEvent:	
	opt	stack 6
; Regs used in _GetKeyEvent: [wreg+status,2+status,0]
	line	408
	
l2236:	
;MS86F_PWM1_HALF.C: 407: static unsigned char keytime=0;
;MS86F_PWM1_HALF.C: 408: unsigned char key_event=0;
	clrf	(GetKeyEvent@key_event)
	line	409
	
l2238:	
;MS86F_PWM1_HALF.C: 409: if(PA2==0)
	btfsc	(42/8),(42)&7
	goto	u421
	goto	u420
u421:
	goto	l2248
u420:
	line	411
	
l2240:	
;MS86F_PWM1_HALF.C: 410: {
;MS86F_PWM1_HALF.C: 411: if(keytime<200)
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipnc
	goto	u431
	goto	u430
u431:
	goto	l2256
u430:
	line	413
	
l2242:	
;MS86F_PWM1_HALF.C: 412: {
;MS86F_PWM1_HALF.C: 413: keytime++;
	incf	(GetKeyEvent@keytime),f
	line	414
	
l2244:	
;MS86F_PWM1_HALF.C: 414: if(keytime>=200)key_event = 2;
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipc
	goto	u441
	goto	u440
u441:
	goto	l2256
u440:
	
l2246:	
	movlw	(02h)
	movwf	(GetKeyEvent@key_event)
	goto	l2256
	line	419
	
l2248:	
;MS86F_PWM1_HALF.C: 417: else
;MS86F_PWM1_HALF.C: 418: {
;MS86F_PWM1_HALF.C: 419: if(keytime>10 && keytime<200)key_event=1;
	movlw	(0Bh)
	subwf	(GetKeyEvent@keytime),w
	skipc
	goto	u451
	goto	u450
u451:
	goto	l2254
u450:
	
l2250:	
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipnc
	goto	u461
	goto	u460
u461:
	goto	l2254
u460:
	
l2252:	
	clrf	(GetKeyEvent@key_event)
	incf	(GetKeyEvent@key_event),f
	line	420
	
l2254:	
;MS86F_PWM1_HALF.C: 420: keytime=0;
	clrf	(GetKeyEvent@keytime)
	line	422
	
l2256:	
;MS86F_PWM1_HALF.C: 421: }
;MS86F_PWM1_HALF.C: 422: return key_event;
	movf	(GetKeyEvent@key_event),w
	line	423
	
l878:	
	return
	opt stack 0
GLOBAL	__end_of_GetKeyEvent
	__end_of_GetKeyEvent:
;; =============== function _GetKeyEvent ends ============

	signat	_GetKeyEvent,89
	global	_SetUvSleep
psect	text351,local,class=CODE,delta=2
global __ptext351
__ptext351:

;; *************** function _SetUvSleep *****************
;; Defined at:
;;		line 393 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text351
	file	"MS86F_PWM1_HALF.C"
	line	393
	global	__size_of_SetUvSleep
	__size_of_SetUvSleep	equ	__end_of_SetUvSleep-_SetUvSleep
	
_SetUvSleep:	
	opt	stack 6
; Regs used in _SetUvSleep: [status,2]
	line	394
	
l2228:	
;MS86F_PWM1_HALF.C: 394: led_stat = 0;
	clrf	(_led_stat)	;volatile
	line	396
	
l2230:	
;MS86F_PWM1_HALF.C: 396: RA4=1;
	bsf	(44/8),(44)&7
	line	397
	
l2232:	
;MS86F_PWM1_HALF.C: 397: RA7=0;
	bcf	(47/8),(47)&7
	line	398
	
l2234:	
;MS86F_PWM1_HALF.C: 398: PA6=0;
	bcf	(46/8),(46)&7
	line	399
;MS86F_PWM1_HALF.C: 403: keytime=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	line	404
	
l868:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvSleep
	__end_of_SetUvSleep:
;; =============== function _SetUvSleep ends ============

	signat	_SetUvSleep,88
	global	_SetUvIdle
psect	text352,local,class=CODE,delta=2
global __ptext352
__ptext352:

;; *************** function _SetUvIdle *****************
;; Defined at:
;;		line 382 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/20
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text352
	file	"MS86F_PWM1_HALF.C"
	line	382
	global	__size_of_SetUvIdle
	__size_of_SetUvIdle	equ	__end_of_SetUvIdle-_SetUvIdle
	
_SetUvIdle:	
	opt	stack 6
; Regs used in _SetUvIdle: [wreg]
	line	384
	
l2224:	
;MS86F_PWM1_HALF.C: 384: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(44/8),(44)&7
	line	385
;MS86F_PWM1_HALF.C: 385: RA7=0;
	bcf	(47/8),(47)&7
	line	386
;MS86F_PWM1_HALF.C: 386: PA6=0;
	bcf	(46/8),(46)&7
	line	388
	
l2226:	
;MS86F_PWM1_HALF.C: 388: led_stat = 4;
	movlw	(04h)
	movwf	(_led_stat)	;volatile
	line	389
	
l865:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvIdle
	__end_of_SetUvIdle:
;; =============== function _SetUvIdle ends ============

	signat	_SetUvIdle,88
	global	_SetUvWorking
psect	text353,local,class=CODE,delta=2
global __ptext353
__ptext353:

;; *************** function _SetUvWorking *****************
;; Defined at:
;;		line 373 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text353
	file	"MS86F_PWM1_HALF.C"
	line	373
	global	__size_of_SetUvWorking
	__size_of_SetUvWorking	equ	__end_of_SetUvWorking-_SetUvWorking
	
_SetUvWorking:	
	opt	stack 6
; Regs used in _SetUvWorking: []
	line	376
	
l2222:	
;MS86F_PWM1_HALF.C: 376: RA4=0;
	bcf	(44/8),(44)&7
	line	377
;MS86F_PWM1_HALF.C: 377: RA7=1;
	bsf	(47/8),(47)&7
	line	378
;MS86F_PWM1_HALF.C: 378: PA6=1;
	bsf	(46/8),(46)&7
	line	379
;MS86F_PWM1_HALF.C: 379: led_stat = 1;
	clrf	(_led_stat)	;volatile
	incf	(_led_stat),f	;volatile
	line	380
	
l862:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvWorking
	__end_of_SetUvWorking:
;; =============== function _SetUvWorking ends ============

	signat	_SetUvWorking,88
	global	_ENABLE_INTERRUPT
psect	text354,local,class=CODE,delta=2
global __ptext354
__ptext354:

;; *************** function _ENABLE_INTERRUPT *****************
;; Defined at:
;;		line 309 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text354
	file	"MS86F_PWM1_HALF.C"
	line	309
	global	__size_of_ENABLE_INTERRUPT
	__size_of_ENABLE_INTERRUPT	equ	__end_of_ENABLE_INTERRUPT-_ENABLE_INTERRUPT
	
_ENABLE_INTERRUPT:	
	opt	stack 6
; Regs used in _ENABLE_INTERRUPT: []
	line	310
	
l2220:	
;MS86F_PWM1_HALF.C: 310: T0IF = 0;
	bcf	(90/8),(90)&7
	line	311
;MS86F_PWM1_HALF.C: 311: T0IE = 1;
	bsf	(93/8),(93)&7
	line	312
;MS86F_PWM1_HALF.C: 312: T0ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(251/8),(251)&7
	line	314
;MS86F_PWM1_HALF.C: 314: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	315
;MS86F_PWM1_HALF.C: 315: INTF = 0;
	bcf	(89/8),(89)&7
	line	316
;MS86F_PWM1_HALF.C: 316: INTE = 1;
	bsf	(92/8),(92)&7
	line	318
;MS86F_PWM1_HALF.C: 318: GIE = 1;
	bsf	(95/8),(95)&7
	line	319
	
l850:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE_INTERRUPT
	__end_of_ENABLE_INTERRUPT:
;; =============== function _ENABLE_INTERRUPT ends ============

	signat	_ENABLE_INTERRUPT,88
	global	_TIMER0_INIT
psect	text355,local,class=CODE,delta=2
global __ptext355
__ptext355:

;; *************** function _TIMER0_INIT *****************
;; Defined at:
;;		line 297 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text355
	file	"MS86F_PWM1_HALF.C"
	line	297
	global	__size_of_TIMER0_INIT
	__size_of_TIMER0_INIT	equ	__end_of_TIMER0_INIT-_TIMER0_INIT
	
_TIMER0_INIT:	
	opt	stack 6
; Regs used in _TIMER0_INIT: [wreg+status,2]
	line	298
	
l2216:	
;MS86F_PWM1_HALF.C: 298: T0CON0 = 0B00000000;
	clrf	(31)	;volatile
	line	299
	
l2218:	
;MS86F_PWM1_HALF.C: 299: OPTION = 0B00000111;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	300
	
l847:	
	return
	opt stack 0
GLOBAL	__end_of_TIMER0_INIT
	__end_of_TIMER0_INIT:
;; =============== function _TIMER0_INIT ends ============

	signat	_TIMER0_INIT,88
	global	_DELAY_125US
psect	text356,local,class=CODE,delta=2
global __ptext356
__ptext356:

;; *************** function _DELAY_125US *****************
;; Defined at:
;;		line 178 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DELAY_MS
;; This function uses a non-reentrant model
;;
psect	text356
	file	"MS86F_PWM1_HALF.C"
	line	178
	global	__size_of_DELAY_125US
	__size_of_DELAY_125US	equ	__end_of_DELAY_125US-_DELAY_125US
	
_DELAY_125US:	
	opt	stack 5
; Regs used in _DELAY_125US: [wreg+status,2+status,0]
	line	181
	
l2328:	
;MS86F_PWM1_HALF.C: 179: unsigned char a;
;MS86F_PWM1_HALF.C: 181: for(a=0;a<125;a++)
	clrf	(DELAY_125US@a)
	line	182
	
l818:	
	line	183
# 183 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text356
	line	181
	
l2334:	
	incf	(DELAY_125US@a),f
	
l2336:	
	movlw	(07Dh)
	subwf	(DELAY_125US@a),w
	skipc
	goto	u571
	goto	u570
u571:
	goto	l818
u570:
	line	185
	
l820:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_125US
	__end_of_DELAY_125US:
;; =============== function _DELAY_125US ends ============

	signat	_DELAY_125US,88
	global	_DEVICE_INIT
psect	text357,local,class=CODE,delta=2
global __ptext357
__ptext357:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 80 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text357
	file	"MS86F_PWM1_HALF.C"
	line	80
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 6
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	81
	
l2130:	
;MS86F_PWM1_HALF.C: 81: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	84
	
l2132:	
;MS86F_PWM1_HALF.C: 84: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	85
	
l2134:	
;MS86F_PWM1_HALF.C: 85: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	87
	
l2136:	
;MS86F_PWM1_HALF.C: 87: PORTA = 0B00010000;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	88
	
l2138:	
;MS86F_PWM1_HALF.C: 88: TRISA = 0B00101111;
	movlw	(02Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	89
	
l2140:	
;MS86F_PWM1_HALF.C: 89: WPUA = 0B00101111;
	movlw	(02Fh)
	movwf	(149)^080h	;volatile
	line	91
	
l2142:	
;MS86F_PWM1_HALF.C: 91: PORTC = 0B00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	92
	
l2144:	
;MS86F_PWM1_HALF.C: 92: TRISC = 0B11111101;
	movlw	(0FDh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	93
	
l2146:	
;MS86F_PWM1_HALF.C: 93: WPUC = 0B11111101;
	movlw	(0FDh)
	movwf	(147)^080h	;volatile
	line	95
	
l2148:	
;MS86F_PWM1_HALF.C: 95: PSRCA = 0B11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	96
	
l2150:	
;MS86F_PWM1_HALF.C: 96: PSRCC = 0B11111111;
	movlw	(0FFh)
	movwf	(148)^080h	;volatile
	line	97
	
l2152:	
;MS86F_PWM1_HALF.C: 97: PSINKA = 0B11111111;
	movlw	(0FFh)
	movwf	(151)^080h	;volatile
	line	98
	
l2154:	
;MS86F_PWM1_HALF.C: 98: PSINKC = 0B11111111;
	movlw	(0FFh)
	movwf	(159)^080h	;volatile
	line	99
	
l2156:	
;MS86F_PWM1_HALF.C: 99: MSCON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	107
	
l809:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
	global	_ISR
psect	text358,local,class=CODE,delta=2
global __ptext358
__ptext358:

;; *************** function _ISR *****************
;; Defined at:
;;		line 205 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          2       0
;;      Totals:         2       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text358
	file	"MS86F_PWM1_HALF.C"
	line	205
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 5
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text358
	line	206
	
i1l2168:	
;MS86F_PWM1_HALF.C: 206: if(INTE&&INTF)
	btfss	(92/8),(92)&7
	goto	u30_21
	goto	u30_20
u30_21:
	goto	i1l829
u30_20:
	
i1l2170:	
	btfss	(89/8),(89)&7
	goto	u31_21
	goto	u31_20
u31_21:
	goto	i1l829
u31_20:
	line	208
	
i1l2172:	
;MS86F_PWM1_HALF.C: 207: {
;MS86F_PWM1_HALF.C: 208: INTF = 0;
	bcf	(89/8),(89)&7
	line	209
	
i1l829:	
	line	211
;MS86F_PWM1_HALF.C: 209: }
;MS86F_PWM1_HALF.C: 211: if(T0IE&&T0IF)
	btfss	(93/8),(93)&7
	goto	u32_21
	goto	u32_20
u32_21:
	goto	i1l844
u32_20:
	
i1l2174:	
	btfss	(90/8),(90)&7
	goto	u33_21
	goto	u33_20
u33_21:
	goto	i1l844
u33_20:
	line	213
	
i1l2176:	
;MS86F_PWM1_HALF.C: 212: {
;MS86F_PWM1_HALF.C: 213: T0IF = 0;
	bcf	(90/8),(90)&7
	line	214
	
i1l2178:	
;MS86F_PWM1_HALF.C: 214: TMR0 = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	215
	
i1l2180:	
;MS86F_PWM1_HALF.C: 215: T0_cnt++;
	incf	(_T0_cnt),f	;volatile
	line	216
	
i1l2182:	
;MS86F_PWM1_HALF.C: 216: if(T0_cnt>=125)
	movlw	(07Dh)
	subwf	(_T0_cnt),w	;volatile
	skipc
	goto	u34_21
	goto	u34_20
u34_21:
	goto	i1l2190
u34_20:
	line	218
	
i1l2184:	
;MS86F_PWM1_HALF.C: 217: {
;MS86F_PWM1_HALF.C: 218: if(working_timer)working_timer--;
	movf	(_working_timer+1),w
	iorwf	(_working_timer),w
	skipnz
	goto	u35_21
	goto	u35_20
u35_21:
	goto	i1l2188
u35_20:
	
i1l2186:	
	movlw	low(01h)
	subwf	(_working_timer),f
	movlw	high(01h)
	skipc
	decf	(_working_timer+1),f
	subwf	(_working_timer+1),f
	line	219
	
i1l2188:	
;MS86F_PWM1_HALF.C: 219: T0_cnt=0;
	clrf	(_T0_cnt)	;volatile
	line	262
	
i1l2190:	
;MS86F_PWM1_HALF.C: 220: }
;MS86F_PWM1_HALF.C: 262: if(led_stat==0)
	movf	(_led_stat),f
	skipz	;volatile
	goto	u36_21
	goto	u36_20
u36_21:
	goto	i1l2194
u36_20:
	line	264
	
i1l2192:	
;MS86F_PWM1_HALF.C: 263: {
;MS86F_PWM1_HALF.C: 264: PC1=1;
	bsf	(57/8),(57)&7
	line	265
;MS86F_PWM1_HALF.C: 265: }
	goto	i1l844
	line	266
	
i1l2194:	
;MS86F_PWM1_HALF.C: 266: else if(led_stat<4)
	movlw	(04h)
	subwf	(_led_stat),w	;volatile
	skipnc
	goto	u37_21
	goto	u37_20
u37_21:
	goto	i1l2208
u37_20:
	line	268
	
i1l2196:	
;MS86F_PWM1_HALF.C: 267: {
;MS86F_PWM1_HALF.C: 268: delay++;
	incf	(_delay),f	;volatile
	line	269
	
i1l2198:	
;MS86F_PWM1_HALF.C: 269: if(led_stat==2)delay++;
	movf	(_led_stat),w	;volatile
	xorlw	02h
	skipz
	goto	u38_21
	goto	u38_20
u38_21:
	goto	i1l2202
u38_20:
	
i1l2200:	
	incf	(_delay),f	;volatile
	goto	i1l2206
	line	270
	
i1l2202:	
;MS86F_PWM1_HALF.C: 270: else if(led_stat==3)delay++;
	movf	(_led_stat),w	;volatile
	xorlw	03h
	skipz
	goto	u39_21
	goto	u39_20
u39_21:
	goto	i1l2206
u39_20:
	goto	i1l2200
	line	272
	
i1l2206:	
;MS86F_PWM1_HALF.C: 272: if(delay<128)
	movlw	(080h)
	subwf	(_delay),w	;volatile
	skipnc
	goto	u40_21
	goto	u40_20
u40_21:
	goto	i1l2210
u40_20:
	line	274
	
i1l2208:	
;MS86F_PWM1_HALF.C: 273: {
;MS86F_PWM1_HALF.C: 274: PC1=0;
	bcf	(57/8),(57)&7
	line	275
;MS86F_PWM1_HALF.C: 275: }
	goto	i1l844
	line	276
	
i1l2210:	
;MS86F_PWM1_HALF.C: 276: else if(delay<254)
	movlw	(0FEh)
	subwf	(_delay),w	;volatile
	skipnc
	goto	u41_21
	goto	u41_20
u41_21:
	goto	i1l2214
u41_20:
	goto	i1l2192
	line	280
	
i1l2214:	
;MS86F_PWM1_HALF.C: 280: else delay=0;
	clrf	(_delay)	;volatile
	line	288
	
i1l844:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text359,local,class=CODE,delta=2
global __ptext359
__ptext359:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
