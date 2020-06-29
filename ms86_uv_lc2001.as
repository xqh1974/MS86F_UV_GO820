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
	FNCALL	_main,_SetUvSleep
	FNCALL	_main,_DELAY_MS
	FNCALL	_main,_GetKeyEvent
	FNCALL	_main,_SetUvWorking
	FNCALL	_main,_SetUvIdle
	FNCALL	_DELAY_MS,_DELAY_125US
	FNROOT	_main
	global	_brigtness
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	file	"MS86F_PWM1_HALF.C"
	line	50

;initializer for _brigtness
	retlw	05h
	retlw	0

	global	_buzz_timer
	global	_working_timer
	global	GetKeyEvent@keytime
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

	global	_INTCON
_INTCON	set	11
	global	_MSCON
_MSCON	set	27
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_PC0
_PC0	set	56
	global	_PC1
_PC1	set	57
	global	_PC4
_PC4	set	60
	global	_PC5
_PC5	set	61
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
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
	file	"ms86_uv_lc2001.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_buzz_timer:
       ds      2

_working_timer:
       ds      2

GetKeyEvent@keytime:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"MS86F_PWM1_HALF.C"
_brigtness:
       ds      2

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
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
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x0
	global	?_DELAY_125US
?_DELAY_125US:	; 0 bytes @ 0x0
	global	??_DELAY_125US
??_DELAY_125US:	; 0 bytes @ 0x0
	global	?_SetUvWorking
?_SetUvWorking:	; 0 bytes @ 0x0
	global	??_SetUvWorking
??_SetUvWorking:	; 0 bytes @ 0x0
	global	?_SetUvIdle
?_SetUvIdle:	; 0 bytes @ 0x0
	global	??_SetUvIdle
??_SetUvIdle:	; 0 bytes @ 0x0
	global	?_SetUvSleep
?_SetUvSleep:	; 0 bytes @ 0x0
	global	??_SetUvSleep
??_SetUvSleep:	; 0 bytes @ 0x0
	global	??_GetKeyEvent
??_GetKeyEvent:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_GetKeyEvent
?_GetKeyEvent:	; 1 bytes @ 0x0
	global	DELAY_125US@a
DELAY_125US@a:	; 1 bytes @ 0x0
	global	GetKeyEvent@key_event
GetKeyEvent@key_event:	; 1 bytes @ 0x0
	ds	1
	global	?_DELAY_MS
?_DELAY_MS:	; 0 bytes @ 0x1
	global	DELAY_MS@Time
DELAY_MS@Time:	; 2 bytes @ 0x1
	ds	2
	global	??_DELAY_MS
??_DELAY_MS:	; 0 bytes @ 0x3
	global	DELAY_MS@a
DELAY_MS@a:	; 2 bytes @ 0x3
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x5
	global	main@keycode
main@keycode:	; 1 bytes @ 0x5
	ds	1
;;Data sizes: Strings 0, constant 0, data 2, bss 5, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      13
;; BANK0           48      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_DELAY_MS
;;   _DELAY_MS->_DELAY_125US
;;
;; Critical Paths under _main in BANK0
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
;; (0) _main                                                 1     1      0     105
;;                                              5 COMMON     1     1      0
;;                        _DEVICE_INIT
;;                         _SetUvSleep
;;                           _DELAY_MS
;;                        _GetKeyEvent
;;                       _SetUvWorking
;;                          _SetUvIdle
;; ---------------------------------------------------------------------------------
;; (1) _DELAY_MS                                             4     2      2      60
;;                                              1 COMMON     4     2      2
;;                        _DELAY_125US
;; ---------------------------------------------------------------------------------
;; (1) _GetKeyEvent                                          1     1      0      15
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _SetUvSleep                                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _SetUvIdle                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _SetUvWorking                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_125US                                          1     1      0      30
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _SetUvSleep
;;   _DELAY_MS
;;     _DELAY_125US
;;   _GetKeyEvent
;;   _SetUvWorking
;;   _SetUvIdle
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0       F       3        0.0%
;;ABS                  0      0       D       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       2       2        0.0%
;;BANK0               30      0       0       5        0.0%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       D       1       92.9%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 232 in file "MS86F_PWM1_HALF.C"
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
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DEVICE_INIT
;;		_SetUvSleep
;;		_DELAY_MS
;;		_GetKeyEvent
;;		_SetUvWorking
;;		_SetUvIdle
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MS86F_PWM1_HALF.C"
	line	232
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	233
	
l1977:	
	line	234
	
l1979:	
;MS86F_PWM1_HALF.C: 234: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	236
	
l1981:	
;MS86F_PWM1_HALF.C: 236: SetUvSleep();
	fcall	_SetUvSleep
	line	237
	
l1983:	
;MS86F_PWM1_HALF.C: 237: DELAY_MS(500);
	movlw	low(01F4h)
	movwf	(?_DELAY_MS)
	movlw	high(01F4h)
	movwf	((?_DELAY_MS))+1
	fcall	_DELAY_MS
	line	252
	
l1985:	
;MS86F_PWM1_HALF.C: 251: {
;MS86F_PWM1_HALF.C: 252: keycode=GetKeyEvent();
	fcall	_GetKeyEvent
	movwf	(main@keycode)
	line	253
	
l1987:	
;MS86F_PWM1_HALF.C: 253: if(keycode==1)
	decf	(main@keycode),w
	skipz
	goto	u81
	goto	u80
u81:
	goto	l1993
u80:
	line	255
	
l1989:	
;MS86F_PWM1_HALF.C: 254: {
;MS86F_PWM1_HALF.C: 255: RA4=!RA4;
	movlw	1<<((44)&7)
	xorwf	((44)/8),f
	line	256
;MS86F_PWM1_HALF.C: 256: buzz_timer=20;
	movlw	014h
	movwf	(_buzz_timer)
	clrf	(_buzz_timer+1)
	line	257
	
l1991:	
;MS86F_PWM1_HALF.C: 257: RA5=1;
	bsf	(45/8),(45)&7
	line	258
;MS86F_PWM1_HALF.C: 258: }
	goto	l2011
	line	259
	
l1993:	
;MS86F_PWM1_HALF.C: 259: else if(keycode==2)
	movf	(main@keycode),w
	xorlw	02h
	skipz
	goto	u91
	goto	u90
u91:
	goto	l2011
u90:
	line	261
	
l1995:	
;MS86F_PWM1_HALF.C: 260: {
;MS86F_PWM1_HALF.C: 261: if(working_timer==0)
	movf	((_working_timer+1)),w
	iorwf	((_working_timer)),w
	skipz
	goto	u101
	goto	u100
u101:
	goto	l2003
u100:
	line	263
	
l1997:	
;MS86F_PWM1_HALF.C: 262: {
;MS86F_PWM1_HALF.C: 263: SetUvWorking();
	fcall	_SetUvWorking
	line	264
	
l1999:	
;MS86F_PWM1_HALF.C: 264: buzz_timer=100;
	movlw	064h
	movwf	(_buzz_timer)
	clrf	(_buzz_timer+1)
	goto	l1991
	line	269
	
l2003:	
;MS86F_PWM1_HALF.C: 267: else
;MS86F_PWM1_HALF.C: 268: {
;MS86F_PWM1_HALF.C: 269: SetUvIdle();
	fcall	_SetUvIdle
	line	270
	
l2005:	
;MS86F_PWM1_HALF.C: 270: working_timer=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	goto	l1999
	line	276
	
l2011:	
;MS86F_PWM1_HALF.C: 273: }
;MS86F_PWM1_HALF.C: 274: }
;MS86F_PWM1_HALF.C: 276: if(working_timer)
	movf	(_working_timer+1),w
	iorwf	(_working_timer),w
	skipnz
	goto	u111
	goto	u110
u111:
	goto	l2023
u110:
	line	278
	
l2013:	
;MS86F_PWM1_HALF.C: 277: {
;MS86F_PWM1_HALF.C: 278: working_timer--;
	movlw	low(01h)
	subwf	(_working_timer),f
	movlw	high(01h)
	skipc
	decf	(_working_timer+1),f
	subwf	(_working_timer+1),f
	line	279
	
l2015:	
;MS86F_PWM1_HALF.C: 279: if(working_timer==0)
	movf	((_working_timer+1)),w
	iorwf	((_working_timer)),w
	skipz
	goto	u121
	goto	u120
u121:
	goto	l2023
u120:
	line	281
	
l2017:	
;MS86F_PWM1_HALF.C: 280: {
;MS86F_PWM1_HALF.C: 281: SetUvIdle();
	fcall	_SetUvIdle
	line	282
	
l2019:	
;MS86F_PWM1_HALF.C: 282: buzz_timer=500;
	movlw	low(01F4h)
	movwf	(_buzz_timer)
	movlw	high(01F4h)
	movwf	((_buzz_timer))+1
	line	283
	
l2021:	
;MS86F_PWM1_HALF.C: 283: RA5=1;
	bsf	(45/8),(45)&7
	line	286
	
l2023:	
;MS86F_PWM1_HALF.C: 284: }
;MS86F_PWM1_HALF.C: 285: }
;MS86F_PWM1_HALF.C: 286: if(buzz_timer)
	movf	(_buzz_timer+1),w
	iorwf	(_buzz_timer),w
	skipnz
	goto	u131
	goto	u130
u131:
	goto	l2035
u130:
	line	288
	
l2025:	
;MS86F_PWM1_HALF.C: 287: {
;MS86F_PWM1_HALF.C: 288: buzz_timer--;
	movlw	low(01h)
	subwf	(_buzz_timer),f
	movlw	high(01h)
	skipc
	decf	(_buzz_timer+1),f
	subwf	(_buzz_timer+1),f
	line	289
;MS86F_PWM1_HALF.C: 289: if(buzz_timer==0 || buzz_timer==150 || buzz_timer==300)RA5=0;
	movf	(_buzz_timer+1),w
	iorwf	(_buzz_timer),w
	skipnz
	goto	u141
	goto	u140
u141:
	goto	l841
u140:
	
l2027:	
		movf	(_buzz_timer),w
	xorlw	150
	iorwf	(_buzz_timer+1),w

	skipnz
	goto	u151
	goto	u150
u151:
	goto	l841
u150:
	
l2029:	
	decf	(_buzz_timer+1),w
	movlw	44
	skipnz
	xorwf	(_buzz_timer),w

	skipz
	goto	u161
	goto	u160
u161:
	goto	l2031
u160:
	
l841:	
	bcf	(45/8),(45)&7
	goto	l2035
	line	290
	
l2031:	
;MS86F_PWM1_HALF.C: 290: else if(buzz_timer==100 || buzz_timer==250)RA5=1;
		movf	(_buzz_timer),w
	xorlw	100
	iorwf	(_buzz_timer+1),w

	skipnz
	goto	u171
	goto	u170
u171:
	goto	l845
u170:
	
l2033:	
		movf	(_buzz_timer),w
	xorlw	250
	iorwf	(_buzz_timer+1),w

	skipz
	goto	u181
	goto	u180
u181:
	goto	l2035
u180:
	
l845:	
	bsf	(45/8),(45)&7
	line	293
	
l2035:	
;MS86F_PWM1_HALF.C: 291: }
;MS86F_PWM1_HALF.C: 293: if(working_timer || PC4==0)
	movf	((_working_timer+1)),w
	iorwf	((_working_timer)),w
	skipz
	goto	u191
	goto	u190
u191:
	goto	l2039
u190:
	
l2037:	
	btfsc	(60/8),(60)&7
	goto	u201
	goto	u200
u201:
	goto	l2059
u200:
	line	295
	
l2039:	
;MS86F_PWM1_HALF.C: 294: {
;MS86F_PWM1_HALF.C: 295: brigtness++;
	incf	(_brigtness),f
	skipnz
	incf	(_brigtness+1),f
	line	309
	
l2041:	
;MS86F_PWM1_HALF.C: 309: if(brigtness<50)
	movlw	high(032h)
	subwf	(_brigtness+1),w
	movlw	low(032h)
	skipnz
	subwf	(_brigtness),w
	skipnc
	goto	u211
	goto	u210
u211:
	goto	l2049
u210:
	line	311
	
l2043:	
;MS86F_PWM1_HALF.C: 310: {
;MS86F_PWM1_HALF.C: 311: if(working_timer)PC1=0;
	movf	(_working_timer+1),w
	iorwf	(_working_timer),w
	skipnz
	goto	u221
	goto	u220
u221:
	goto	l850
u220:
	
l2045:	
	bcf	(57/8),(57)&7
	
l850:	
	line	312
;MS86F_PWM1_HALF.C: 312: if(PC4==0)RA3=0;
	btfsc	(60/8),(60)&7
	goto	u231
	goto	u230
u231:
	goto	l2059
u230:
	
l2047:	
	bcf	(43/8),(43)&7
	goto	l2059
	line	314
	
l2049:	
;MS86F_PWM1_HALF.C: 314: else if(brigtness<100)
	movlw	high(064h)
	subwf	(_brigtness+1),w
	movlw	low(064h)
	skipnz
	subwf	(_brigtness),w
	skipnc
	goto	u241
	goto	u240
u241:
	goto	l2057
u240:
	line	316
	
l2051:	
;MS86F_PWM1_HALF.C: 315: {
;MS86F_PWM1_HALF.C: 316: if(working_timer)PC1=1;
	movf	(_working_timer+1),w
	iorwf	(_working_timer),w
	skipnz
	goto	u251
	goto	u250
u251:
	goto	l854
u250:
	
l2053:	
	bsf	(57/8),(57)&7
	
l854:	
	line	317
;MS86F_PWM1_HALF.C: 317: if(PC4==0)RA3=1;
	btfsc	(60/8),(60)&7
	goto	u261
	goto	u260
u261:
	goto	l852
u260:
	
l2055:	
	bsf	(43/8),(43)&7
	goto	l2059
	line	319
	
l2057:	
;MS86F_PWM1_HALF.C: 319: else brigtness=0;
	clrf	(_brigtness)
	clrf	(_brigtness+1)
	goto	l2059
	
l852:	
	line	323
	
l2059:	
;MS86F_PWM1_HALF.C: 321: }
;MS86F_PWM1_HALF.C: 323: if(PC4) RA3=PC0;
	btfss	(60/8),(60)&7
	goto	u271
	goto	u270
u271:
	goto	l2063
u270:
	
l2061:	
	btfsc	(56/8),(56)&7
	goto	u281
	goto	u280
	
u281:
	bcf	status, 5	;RP0=0, select bank0
	bsf	(43/8),(43)&7
	goto	u294
u280:
	bcf	status, 5	;RP0=0, select bank0
	bcf	(43/8),(43)&7
u294:
	line	325
	
l2063:	
;MS86F_PWM1_HALF.C: 325: DELAY_MS(10);
	movlw	0Ah
	movwf	(?_DELAY_MS)
	clrf	(?_DELAY_MS+1)
	fcall	_DELAY_MS
	goto	l1985
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	328
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_DELAY_MS
psect	text76,local,class=CODE,delta=2
global __ptext76
__ptext76:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 162 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  Time            2    1[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  a               2    3[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         2       0
;;      Locals:         2       0
;;      Temps:          0       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_DELAY_125US
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text76
	file	"MS86F_PWM1_HALF.C"
	line	162
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 6
; Regs used in _DELAY_MS: [wreg+status,2+status,0+pclath+cstack]
	line	165
	
l1967:	
;MS86F_PWM1_HALF.C: 163: unsigned short a;
;MS86F_PWM1_HALF.C: 165: Time<<=3;
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	line	167
	
l1969:	
;MS86F_PWM1_HALF.C: 167: for(a=0;a<Time;a++)
	clrf	(DELAY_MS@a)
	clrf	(DELAY_MS@a+1)
	goto	l1975
	line	169
	
l1971:	
;MS86F_PWM1_HALF.C: 168: {
;MS86F_PWM1_HALF.C: 169: DELAY_125US();
	fcall	_DELAY_125US
	line	167
	
l1973:	
	incf	(DELAY_MS@a),f
	skipnz
	incf	(DELAY_MS@a+1),f
	
l1975:	
	movf	(DELAY_MS@Time+1),w
	subwf	(DELAY_MS@a+1),w
	skipz
	goto	u75
	movf	(DELAY_MS@Time),w
	subwf	(DELAY_MS@a),w
u75:
	skipc
	goto	u71
	goto	u70
u71:
	goto	l1971
u70:
	line	171
	
l808:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_GetKeyEvent
psect	text77,local,class=CODE,delta=2
global __ptext77
__ptext77:

;; *************** function _GetKeyEvent *****************
;; Defined at:
;;		line 207 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key_event       1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 20/0
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text77
	file	"MS86F_PWM1_HALF.C"
	line	207
	global	__size_of_GetKeyEvent
	__size_of_GetKeyEvent	equ	__end_of_GetKeyEvent-_GetKeyEvent
	
_GetKeyEvent:	
	opt	stack 7
; Regs used in _GetKeyEvent: [wreg+status,2+status,0]
	line	209
	
l1943:	
;MS86F_PWM1_HALF.C: 208: static unsigned char keytime=0;
;MS86F_PWM1_HALF.C: 209: unsigned char key_event=0;
	clrf	(GetKeyEvent@key_event)
	line	210
	
l1945:	
;MS86F_PWM1_HALF.C: 210: if(RA2==0)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u21
	goto	u20
u21:
	goto	l1955
u20:
	line	212
	
l1947:	
;MS86F_PWM1_HALF.C: 211: {
;MS86F_PWM1_HALF.C: 212: if(keytime<200)
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipnc
	goto	u31
	goto	u30
u31:
	goto	l1963
u30:
	line	214
	
l1949:	
;MS86F_PWM1_HALF.C: 213: {
;MS86F_PWM1_HALF.C: 214: keytime++;
	incf	(GetKeyEvent@keytime),f
	line	215
	
l1951:	
;MS86F_PWM1_HALF.C: 215: if(keytime>=200)key_event = 2;
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipc
	goto	u41
	goto	u40
u41:
	goto	l1963
u40:
	
l1953:	
	movlw	(02h)
	movwf	(GetKeyEvent@key_event)
	goto	l1963
	line	220
	
l1955:	
;MS86F_PWM1_HALF.C: 218: else
;MS86F_PWM1_HALF.C: 219: {
;MS86F_PWM1_HALF.C: 220: if(keytime>10 && keytime<200)key_event=1;
	movlw	(0Bh)
	subwf	(GetKeyEvent@keytime),w
	skipc
	goto	u51
	goto	u50
u51:
	goto	l1961
u50:
	
l1957:	
	movlw	(0C8h)
	subwf	(GetKeyEvent@keytime),w
	skipnc
	goto	u61
	goto	u60
u61:
	goto	l1961
u60:
	
l1959:	
	clrf	(GetKeyEvent@key_event)
	incf	(GetKeyEvent@key_event),f
	line	221
	
l1961:	
;MS86F_PWM1_HALF.C: 221: keytime=0;
	clrf	(GetKeyEvent@keytime)
	line	223
	
l1963:	
;MS86F_PWM1_HALF.C: 222: }
;MS86F_PWM1_HALF.C: 223: return key_event;
	movf	(GetKeyEvent@key_event),w
	line	224
	
l827:	
	return
	opt stack 0
GLOBAL	__end_of_GetKeyEvent
	__end_of_GetKeyEvent:
;; =============== function _GetKeyEvent ends ============

	signat	_GetKeyEvent,89
	global	_SetUvSleep
psect	text78,local,class=CODE,delta=2
global __ptext78
__ptext78:

;; *************** function _SetUvSleep *****************
;; Defined at:
;;		line 196 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text78
	file	"MS86F_PWM1_HALF.C"
	line	196
	global	__size_of_SetUvSleep
	__size_of_SetUvSleep	equ	__end_of_SetUvSleep-_SetUvSleep
	
_SetUvSleep:	
	opt	stack 7
; Regs used in _SetUvSleep: [status,2]
	line	200
	
l1939:	
;MS86F_PWM1_HALF.C: 200: PC5=1;
	bsf	(61/8),(61)&7
	line	201
;MS86F_PWM1_HALF.C: 201: PC1=1;
	bsf	(57/8),(57)&7
	line	203
	
l1941:	
;MS86F_PWM1_HALF.C: 203: working_timer=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	line	204
	
l817:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvSleep
	__end_of_SetUvSleep:
;; =============== function _SetUvSleep ends ============

	signat	_SetUvSleep,88
	global	_SetUvIdle
psect	text79,local,class=CODE,delta=2
global __ptext79
__ptext79:

;; *************** function _SetUvIdle *****************
;; Defined at:
;;		line 185 in file "MS86F_PWM1_HALF.C"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text79
	file	"MS86F_PWM1_HALF.C"
	line	185
	global	__size_of_SetUvIdle
	__size_of_SetUvIdle	equ	__end_of_SetUvIdle-_SetUvIdle
	
_SetUvIdle:	
	opt	stack 7
; Regs used in _SetUvIdle: [status,2]
	line	188
	
l1935:	
;MS86F_PWM1_HALF.C: 188: PC5=1;
	bsf	(61/8),(61)&7
	line	192
;MS86F_PWM1_HALF.C: 192: PC1=1;
	bsf	(57/8),(57)&7
	line	193
	
l1937:	
;MS86F_PWM1_HALF.C: 193: working_timer=0;
	clrf	(_working_timer)
	clrf	(_working_timer+1)
	line	194
	
l814:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvIdle
	__end_of_SetUvIdle:
;; =============== function _SetUvIdle ends ============

	signat	_SetUvIdle,88
	global	_SetUvWorking
psect	text80,local,class=CODE,delta=2
global __ptext80
__ptext80:

;; *************** function _SetUvWorking *****************
;; Defined at:
;;		line 174 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text80
	file	"MS86F_PWM1_HALF.C"
	line	174
	global	__size_of_SetUvWorking
	__size_of_SetUvWorking	equ	__end_of_SetUvWorking-_SetUvWorking
	
_SetUvWorking:	
	opt	stack 7
; Regs used in _SetUvWorking: [wreg]
	line	175
	
l1931:	
;MS86F_PWM1_HALF.C: 175: working_timer=(100*59*5);
	movlw	low(0733Ch)
	movwf	(_working_timer)
	movlw	high(0733Ch)
	movwf	((_working_timer))+1
	line	176
;MS86F_PWM1_HALF.C: 176: brigtness=5;
	movlw	05h
	movwf	(_brigtness)
	clrf	(_brigtness+1)
	line	179
	
l1933:	
;MS86F_PWM1_HALF.C: 179: PC5=0;
	bcf	(61/8),(61)&7
	line	183
	
l811:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvWorking
	__end_of_SetUvWorking:
;; =============== function _SetUvWorking ends ============

	signat	_SetUvWorking,88
	global	_DELAY_125US
psect	text81,local,class=CODE,delta=2
global __ptext81
__ptext81:

;; *************** function _DELAY_125US *****************
;; Defined at:
;;		line 153 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         1       0
;;      Temps:          0       0
;;      Totals:         1       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DELAY_MS
;; This function uses a non-reentrant model
;;
psect	text81
	file	"MS86F_PWM1_HALF.C"
	line	153
	global	__size_of_DELAY_125US
	__size_of_DELAY_125US	equ	__end_of_DELAY_125US-_DELAY_125US
	
_DELAY_125US:	
	opt	stack 6
; Regs used in _DELAY_125US: [wreg+status,2+status,0]
	line	156
	
l1921:	
;MS86F_PWM1_HALF.C: 154: unsigned char a;
;MS86F_PWM1_HALF.C: 156: for(a=0;a<125;a++)
	clrf	(DELAY_125US@a)
	line	157
	
l800:	
	line	158
# 158 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text81
	line	156
	
l1927:	
	incf	(DELAY_125US@a),f
	
l1929:	
	movlw	(07Dh)
	subwf	(DELAY_125US@a),w
	skipc
	goto	u11
	goto	u10
u11:
	goto	l800
u10:
	line	160
	
l802:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_125US
	__end_of_DELAY_125US:
;; =============== function _DELAY_125US ends ============

	signat	_DELAY_125US,88
	global	_DEVICE_INIT
psect	text82,local,class=CODE,delta=2
global __ptext82
__ptext82:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 58 in file "MS86F_PWM1_HALF.C"
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text82
	file	"MS86F_PWM1_HALF.C"
	line	58
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 7
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	59
	
l1893:	
;MS86F_PWM1_HALF.C: 59: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	62
	
l1895:	
;MS86F_PWM1_HALF.C: 62: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	63
	
l1897:	
;MS86F_PWM1_HALF.C: 63: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	65
	
l1899:	
;MS86F_PWM1_HALF.C: 65: PORTA = 0B00011000;
	movlw	(018h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	66
	
l1901:	
;MS86F_PWM1_HALF.C: 66: TRISA = 0B11000111;
	movlw	(0C7h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	67
	
l1903:	
;MS86F_PWM1_HALF.C: 67: WPUA = 0B11000111;
	movlw	(0C7h)
	movwf	(149)^080h	;volatile
	line	69
	
l1905:	
;MS86F_PWM1_HALF.C: 69: PORTC = 0B00000010;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(7)	;volatile
	line	70
	
l1907:	
;MS86F_PWM1_HALF.C: 70: TRISC = 0B11011101;
	movlw	(0DDh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	71
	
l1909:	
;MS86F_PWM1_HALF.C: 71: WPUC = 0B11011101;
	movlw	(0DDh)
	movwf	(147)^080h	;volatile
	line	73
	
l1911:	
;MS86F_PWM1_HALF.C: 73: PSRCA = 0B11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	74
	
l1913:	
;MS86F_PWM1_HALF.C: 74: PSRCC = 0B11111111;
	movlw	(0FFh)
	movwf	(148)^080h	;volatile
	line	75
	
l1915:	
;MS86F_PWM1_HALF.C: 75: PSINKA = 0B11111111;
	movlw	(0FFh)
	movwf	(151)^080h	;volatile
	line	76
	
l1917:	
;MS86F_PWM1_HALF.C: 76: PSINKC = 0B11111111;
	movlw	(0FFh)
	movwf	(159)^080h	;volatile
	line	77
	
l1919:	
;MS86F_PWM1_HALF.C: 77: MSCON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	85
	
l791:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
psect	text83,local,class=CODE,delta=2
global __ptext83
__ptext83:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
