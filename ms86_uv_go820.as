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
	FNCALL	_main,_PWM1_INIT
	FNCALL	_main,_ENABLE_INTERRUPT
	FNCALL	_main,_LVD_INIT
	FNCALL	_main,_SetUvIdle
	FNCALL	_main,_WDT_INIT
	FNCALL	_main,_GetKeyEvent
	FNCALL	_main,_GetPwrSta
	FNCALL	_main,_SetUvWarning
	FNCALL	_main,_SetUvCharging
	FNCALL	_main,_SetUvSleep
	FNCALL	_main,_SetUvWorking
	FNCALL	_main,_SetUvCharged
	FNCALL	_main,_SetUvBreaking
	FNCALL	_main,_DELAY_MS
	FNCALL	_SetUvSleep,_led_off
	FNCALL	_SetUvSleep,_SYS_SLEEP
	FNCALL	_SetUvIdle,_led_on
	FNCALL	_SetUvCharged,_led_on
	FNCALL	_SetUvBreaking,_led_on
	FNCALL	_SetUvCharging,_led_blink
	FNCALL	_SetUvWarning,_led_blink
	FNCALL	_SetUvWorking,_led_blink
	FNCALL	_led_off,_DISABLE_INTERRUPT
	FNCALL	_led_on,_DISABLE_INTERRUPT
	FNCALL	_DELAY_MS,_DELAY_125US
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_LED_SPEED
	global	_dir
	global	_brigtness
	global	_work_sta
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"MS86F_PWM1_HALF.C"
	line	234

;initializer for _LED_SPEED
	retlw	08h
	line	233

;initializer for _dir
	retlw	01h
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	line	89

;initializer for _brigtness
	retlw	05h
	retlw	0

	line	75

;initializer for _work_sta
	retlw	01h
	global	_T0_seconds
	global	_working_timer
	global	_T0_cnt
	global	_delay
	global	_led_stat
	global	_second_cnt
	global	_brightness
	global	_keytime
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
	global	_P1BDTH
_P1BDTH	set	21
	global	_P1BDTL
_P1BDTL	set	15
	global	_P1CON
_P1CON	set	22
	global	_PORTA
_PORTA	set	5
	global	_PORTC
_PORTC	set	7
	global	_T2CON0
_T2CON0	set	18
	global	_TMR0
_TMR0	set	1
	global	_TMR2H
_TMR2H	set	19
	global	_TMR2L
_TMR2L	set	17
	global	_WDTCON
_WDTCON	set	24
	global	_GIE
_GIE	set	95
	global	_INTE
_INTE	set	92
	global	_INTF
_INTF	set	89
	global	_PA2
_PA2	set	42
	global	_PA3
_PA3	set	43
	global	_PA6
_PA6	set	46
	global	_PC0
_PC0	set	56
	global	_PC4
_PC4	set	60
	global	_RA4
_RA4	set	44
	global	_RA7
_RA7	set	47
	global	_SLVREN
_SLVREN	set	219
	global	_SWDTEN
_SWDTEN	set	192
	global	_T0IE
_T0IE	set	93
	global	_T0IF
_T0IF	set	90
	global	_T0ON
_T0ON	set	251
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_OPTION
_OPTION	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_P1OE
_P1OE	set	144
	global	_P1POL
_P1POL	set	153
	global	_PCON
_PCON	set	142
	global	_PR2H
_PR2H	set	146
	global	_PR2L
_PR2L	set	145
	global	_PSINKA
_PSINKA	set	151
	global	_PSINKC
_PSINKC	set	159
	global	_PSRCA
_PSRCA	set	136
	global	_PSRCC
_PSRCC	set	148
	global	_T2CON1
_T2CON1	set	158
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
	global	_LVDEN
_LVDEN	set	1139
	global	_LVDW
_LVDW	set	1138
	global	_P1BOE
_P1BOE	set	1158
	file	"ms86_uv_go820.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_brightness:
       ds      1

_keytime:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"MS86F_PWM1_HALF.C"
	line	89
_brigtness:
       ds      2

psect	dataCOMMON
	file	"MS86F_PWM1_HALF.C"
	line	75
_work_sta:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_T0_seconds:
       ds      2

_working_timer:
       ds      2

_T0_cnt:
       ds      1

_delay:
       ds      1

_led_stat:
       ds      1

_second_cnt:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"MS86F_PWM1_HALF.C"
	line	234
_LED_SPEED:
       ds      1

psect	dataBANK0
	file	"MS86F_PWM1_HALF.C"
	line	233
_dir:
       ds      1

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
	clrf	((__pbssBANK0)+5)&07Fh
	clrf	((__pbssBANK0)+6)&07Fh
	clrf	((__pbssBANK0)+7)&07Fh
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
	fcall	__pidataCOMMON+1		;fetch initializer
	movwf	__pdataCOMMON+1&07fh		
	fcall	__pidataCOMMON+2		;fetch initializer
	movwf	__pdataCOMMON+2&07fh		
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
	global	?_PWM1_INIT
?_PWM1_INIT:	; 0 bytes @ 0x0
	global	?_WDT_INIT
?_WDT_INIT:	; 0 bytes @ 0x0
	global	?_DELAY_125US
?_DELAY_125US:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_ENABLE_INTERRUPT
?_ENABLE_INTERRUPT:	; 0 bytes @ 0x0
	global	?_DISABLE_INTERRUPT
?_DISABLE_INTERRUPT:	; 0 bytes @ 0x0
	global	?_LVD_INIT
?_LVD_INIT:	; 0 bytes @ 0x0
	global	?_SYS_SLEEP
?_SYS_SLEEP:	; 0 bytes @ 0x0
	global	?_led_on
?_led_on:	; 0 bytes @ 0x0
	global	?_led_off
?_led_off:	; 0 bytes @ 0x0
	global	?_led_blink
?_led_blink:	; 0 bytes @ 0x0
	global	?_SetUvWorking
?_SetUvWorking:	; 0 bytes @ 0x0
	global	?_SetUvBreaking
?_SetUvBreaking:	; 0 bytes @ 0x0
	global	?_SetUvWarning
?_SetUvWarning:	; 0 bytes @ 0x0
	global	?_SetUvCharging
?_SetUvCharging:	; 0 bytes @ 0x0
	global	?_SetUvCharged
?_SetUvCharged:	; 0 bytes @ 0x0
	global	?_SetUvIdle
?_SetUvIdle:	; 0 bytes @ 0x0
	global	?_SetUvSleep
?_SetUvSleep:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_GetKeyEvent
?_GetKeyEvent:	; 1 bytes @ 0x0
	global	?_GetPwrSta
?_GetPwrSta:	; 1 bytes @ 0x0
	ds	2
	global	??_DEVICE_INIT
??_DEVICE_INIT:	; 0 bytes @ 0x2
	global	??_PWM1_INIT
??_PWM1_INIT:	; 0 bytes @ 0x2
	global	??_WDT_INIT
??_WDT_INIT:	; 0 bytes @ 0x2
	global	??_DELAY_125US
??_DELAY_125US:	; 0 bytes @ 0x2
	global	??_ENABLE_INTERRUPT
??_ENABLE_INTERRUPT:	; 0 bytes @ 0x2
	global	??_DISABLE_INTERRUPT
??_DISABLE_INTERRUPT:	; 0 bytes @ 0x2
	global	??_LVD_INIT
??_LVD_INIT:	; 0 bytes @ 0x2
	global	??_SYS_SLEEP
??_SYS_SLEEP:	; 0 bytes @ 0x2
	global	??_led_on
??_led_on:	; 0 bytes @ 0x2
	global	??_led_off
??_led_off:	; 0 bytes @ 0x2
	global	??_led_blink
??_led_blink:	; 0 bytes @ 0x2
	global	??_SetUvWorking
??_SetUvWorking:	; 0 bytes @ 0x2
	global	??_SetUvBreaking
??_SetUvBreaking:	; 0 bytes @ 0x2
	global	??_SetUvWarning
??_SetUvWarning:	; 0 bytes @ 0x2
	global	??_SetUvCharging
??_SetUvCharging:	; 0 bytes @ 0x2
	global	??_SetUvCharged
??_SetUvCharged:	; 0 bytes @ 0x2
	global	??_SetUvIdle
??_SetUvIdle:	; 0 bytes @ 0x2
	global	??_SetUvSleep
??_SetUvSleep:	; 0 bytes @ 0x2
	global	??_GetKeyEvent
??_GetKeyEvent:	; 0 bytes @ 0x2
	global	??_GetPwrSta
??_GetPwrSta:	; 0 bytes @ 0x2
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
	global	DELAY_MS@a
DELAY_MS@a:	; 2 bytes @ 0x5
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x7
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@pwr_sta
main@pwr_sta:	; 1 bytes @ 0x0
	ds	1
	global	main@keycode
main@keycode:	; 1 bytes @ 0x1
	ds	1
;;Data sizes: Strings 0, constant 0, data 5, bss 10, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7      12
;; BANK0           48      2      12

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
;;   None.
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
;; (0) _main                                                 2     2      0     656
;;                                              0 BANK0      2     2      0
;;                        _DEVICE_INIT
;;                          _PWM1_INIT
;;                   _ENABLE_INTERRUPT
;;                           _LVD_INIT
;;                          _SetUvIdle
;;                           _WDT_INIT
;;                        _GetKeyEvent
;;                          _GetPwrSta
;;                       _SetUvWarning
;;                      _SetUvCharging
;;                         _SetUvSleep
;;                       _SetUvWorking
;;                       _SetUvCharged
;;                      _SetUvBreaking
;;                           _DELAY_MS
;; ---------------------------------------------------------------------------------
;; (1) _SetUvSleep                                           0     0      0       0
;;                            _led_off
;;                          _SYS_SLEEP
;; ---------------------------------------------------------------------------------
;; (1) _SetUvIdle                                            0     0      0       0
;;                             _led_on
;; ---------------------------------------------------------------------------------
;; (1) _SetUvCharged                                         0     0      0       0
;;                             _led_on
;; ---------------------------------------------------------------------------------
;; (1) _SetUvBreaking                                        0     0      0       0
;;                             _led_on
;; ---------------------------------------------------------------------------------
;; (1) _SetUvCharging                                        0     0      0       0
;;                          _led_blink
;; ---------------------------------------------------------------------------------
;; (1) _SetUvWarning                                         0     0      0       0
;;                          _led_blink
;; ---------------------------------------------------------------------------------
;; (1) _SetUvWorking                                         0     0      0       0
;;                          _led_blink
;; ---------------------------------------------------------------------------------
;; (2) _led_off                                              0     0      0       0
;;                  _DISABLE_INTERRUPT
;; ---------------------------------------------------------------------------------
;; (2) _led_on                                               0     0      0       0
;;                  _DISABLE_INTERRUPT
;; ---------------------------------------------------------------------------------
;; (2) _SYS_SLEEP                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DELAY_MS                                             4     2      2     139
;;                                              3 COMMON     4     2      2
;;                        _DELAY_125US
;; ---------------------------------------------------------------------------------
;; (1) _GetPwrSta                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _GetKeyEvent                                          1     1      0      40
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _led_blink                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _LVD_INIT                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _DISABLE_INTERRUPT                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _ENABLE_INTERRUPT                                     0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _DELAY_125US                                          1     1      0      68
;;                                              2 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _WDT_INIT                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _PWM1_INIT                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _DEVICE_INIT                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _DEVICE_INIT
;;   _PWM1_INIT
;;   _ENABLE_INTERRUPT
;;   _LVD_INIT
;;   _SetUvIdle
;;     _led_on
;;       _DISABLE_INTERRUPT
;;   _WDT_INIT
;;   _GetKeyEvent
;;   _GetPwrSta
;;   _SetUvWarning
;;     _led_blink
;;   _SetUvCharging
;;     _led_blink
;;   _SetUvSleep
;;     _led_off
;;       _DISABLE_INTERRUPT
;;     _SYS_SLEEP
;;   _SetUvWorking
;;     _led_blink
;;   _SetUvCharged
;;     _led_on
;;       _DISABLE_INTERRUPT
;;   _SetUvBreaking
;;     _led_on
;;       _DISABLE_INTERRUPT
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
;;DATA                 0      0      1B       3        0.0%
;;ABS                  0      0      18       6        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       3       2        0.0%
;;BANK0               30      2       C       5       25.0%
;;BITBANK0            30      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 540 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  keycode         1    1[BANK0 ] unsigned char 
;;  pwr_sta         1    0[BANK0 ] enum E1037
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       2
;;      Temps:          0       0
;;      Totals:         0       2
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_DEVICE_INIT
;;		_PWM1_INIT
;;		_ENABLE_INTERRUPT
;;		_LVD_INIT
;;		_SetUvIdle
;;		_WDT_INIT
;;		_GetKeyEvent
;;		_GetPwrSta
;;		_SetUvWarning
;;		_SetUvCharging
;;		_SetUvSleep
;;		_SetUvWorking
;;		_SetUvCharged
;;		_SetUvBreaking
;;		_DELAY_MS
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"MS86F_PWM1_HALF.C"
	line	540
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	541
	
l3076:	
	line	542
;MS86F_PWM1_HALF.C: 542: unsigned char keycode=0;
	clrf	(main@keycode)
	line	544
	
l3078:	
;MS86F_PWM1_HALF.C: 544: DEVICE_INIT();
	fcall	_DEVICE_INIT
	line	552
;MS86F_PWM1_HALF.C: 546: while(0)
	
l3080:	
;MS86F_PWM1_HALF.C: 550: }
;MS86F_PWM1_HALF.C: 552: PWM1_INIT();
	fcall	_PWM1_INIT
	line	554
	
l3082:	
;MS86F_PWM1_HALF.C: 554: ENABLE_INTERRUPT();
	fcall	_ENABLE_INTERRUPT
	line	556
	
l3084:	
;MS86F_PWM1_HALF.C: 556: LVD_INIT();
	fcall	_LVD_INIT
	line	558
	
l3086:	
;MS86F_PWM1_HALF.C: 558: SetUvIdle();
	fcall	_SetUvIdle
	line	559
	
l3088:	
;MS86F_PWM1_HALF.C: 559: WDT_INIT();
	fcall	_WDT_INIT
	line	563
	
l3090:	
;MS86F_PWM1_HALF.C: 562: {
;MS86F_PWM1_HALF.C: 563: keycode=GetKeyEvent();
	fcall	_GetKeyEvent
	movwf	(main@keycode)
	line	564
	
l3092:	
;MS86F_PWM1_HALF.C: 564: pwr_sta=GetPwrSta();
	fcall	_GetPwrSta
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@pwr_sta)
	line	566
	
l3094:	
;MS86F_PWM1_HALF.C: 566: if(pwr_sta==POWER_LOW)
	movf	(main@pwr_sta),w
	xorlw	03h
	skipz
	goto	u1201
	goto	u1200
u1201:
	goto	l3158
u1200:
	line	568
	
l3096:	
;MS86F_PWM1_HALF.C: 567: {
;MS86F_PWM1_HALF.C: 568: if(work_sta==STATE_WORKING || work_sta==STATE_BREAKING || keycode)SetUvWarning();
	movf	(_work_sta),w
	xorlw	02h
	skipnz
	goto	u1211
	goto	u1210
u1211:
	goto	l3102
u1210:
	
l3098:	
	movf	(_work_sta),w
	xorlw	04h
	skipnz
	goto	u1221
	goto	u1220
u1221:
	goto	l3102
u1220:
	
l3100:	
	movf	(main@keycode),w
	skipz
	goto	u1230
	goto	l3160
u1230:
	
l3102:	
	fcall	_SetUvWarning
	goto	l3160
	line	575
	
l3104:	
;MS86F_PWM1_HALF.C: 575: if(keycode==2)SetUvIdle();
	movf	(main@keycode),w
	xorlw	02h
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l3108
u1240:
	
l3106:	
	fcall	_SetUvIdle
	goto	l3160
	line	576
	
l3108:	
;MS86F_PWM1_HALF.C: 576: else if(pwr_sta==POWER_CHARGING)SetUvCharging();
	decf	(main@pwr_sta),w
	skipz
	goto	u1251
	goto	u1250
u1251:
	goto	l3160
u1250:
	
l3110:	
	fcall	_SetUvCharging
	goto	l3160
	line	577
	
l927:	
;MS86F_PWM1_HALF.C: 577: break;
	goto	l3160
	line	579
	
l3112:	
;MS86F_PWM1_HALF.C: 579: if(keycode==2)SetUvSleep();
	movf	(main@keycode),w
	xorlw	02h
	skipz
	goto	u1261
	goto	u1260
u1261:
	goto	l3116
u1260:
	
l3114:	
	fcall	_SetUvSleep
	goto	l3160
	line	580
	
l3116:	
;MS86F_PWM1_HALF.C: 580: else if(keycode==1)SetUvWorking();
	decf	(main@keycode),w
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l3120
u1270:
	
l3118:	
	fcall	_SetUvWorking
	goto	l3160
	line	581
	
l3120:	
;MS86F_PWM1_HALF.C: 581: else if(pwr_sta==POWER_CHARGING)SetUvCharging();
	decf	(main@pwr_sta),w
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l3160
u1280:
	goto	l3110
	line	585
	
l3124:	
;MS86F_PWM1_HALF.C: 584: case STATE_BREAKING:
;MS86F_PWM1_HALF.C: 585: if(keycode==2)SetUvSleep();
	movf	(main@keycode),w
	xorlw	02h
	skipz
	goto	u1291
	goto	u1290
u1291:
	goto	l3160
u1290:
	goto	l3114
	line	590
	
l3128:	
;MS86F_PWM1_HALF.C: 590: if(keycode==1)SetUvWorking();
	decf	(main@keycode),w
	skipz
	goto	u1301
	goto	u1300
u1301:
	goto	l3132
u1300:
	goto	l3118
	line	591
	
l3132:	
;MS86F_PWM1_HALF.C: 591: else if(pwr_sta==POWER_FULL)SetUvCharged();
	movf	(main@pwr_sta),w
	xorlw	02h
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l3136
u1310:
	
l3134:	
	fcall	_SetUvCharged
	goto	l3160
	line	592
	
l3136:	
;MS86F_PWM1_HALF.C: 592: else if(pwr_sta==POWER_NORMAL)SetUvSleep();
	movf	(main@pwr_sta),f
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l3160
u1320:
	goto	l3114
	line	595
	
l3140:	
;MS86F_PWM1_HALF.C: 595: if(keycode==1)SetUvWorking();
	decf	(main@keycode),w
	skipz
	goto	u1331
	goto	u1330
u1331:
	goto	l3144
u1330:
	goto	l3118
	line	596
	
l3144:	
;MS86F_PWM1_HALF.C: 596: else if(keycode==2)SetUvSleep();
	movf	(main@keycode),w
	xorlw	02h
	skipz
	goto	u1341
	goto	u1340
u1341:
	goto	l3148
u1340:
	goto	l3114
	line	597
	
l3148:	
;MS86F_PWM1_HALF.C: 597: else if(pwr_sta==POWER_CHARGING)SetUvCharging();
	decf	(main@pwr_sta),w
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l3152
u1350:
	goto	l3110
	line	598
	
l3152:	
;MS86F_PWM1_HALF.C: 598: else if(pwr_sta==POWER_NORMAL)SetUvSleep();
	movf	(main@pwr_sta),f
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l927
u1360:
	goto	l3114
	line	572
	
l3158:	
	movf	(_work_sta),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           13     6 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l3160
movlw high(S3256)
movwf pclath
	movlw low(S3256)
	addwf fsr,w
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S3256:
	ljmp	l3104
	ljmp	l3112
	ljmp	l3124
	ljmp	l3160
	ljmp	l3124
	ljmp	l3128
	ljmp	l3140
psect	maintext

	line	603
	
l3160:	
;MS86F_PWM1_HALF.C: 601: }
;MS86F_PWM1_HALF.C: 603: if(working_timer>0)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_working_timer+1),w	;volatile
	iorwf	(_working_timer),w	;volatile
	skipnz
	goto	u1371
	goto	u1370
u1371:
	goto	l3206
u1370:
	line	605
	
l3162:	
;MS86F_PWM1_HALF.C: 604: {
;MS86F_PWM1_HALF.C: 605: if(working_timer!=-1)
	incf	(_working_timer),w	;volatile
	skipnz
	incf	(_working_timer+1),w	;volatile

	skipnz
	goto	u1381
	goto	u1380
u1381:
	goto	l3172
u1380:
	line	607
	
l3164:	
;MS86F_PWM1_HALF.C: 606: {
;MS86F_PWM1_HALF.C: 607: second_cnt++;
	incf	(_second_cnt),f	;volatile
	line	608
	
l3166:	
;MS86F_PWM1_HALF.C: 608: if(second_cnt>=100)
	movlw	(064h)
	subwf	(_second_cnt),w	;volatile
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l3172
u1390:
	line	610
	
l3168:	
;MS86F_PWM1_HALF.C: 609: {
;MS86F_PWM1_HALF.C: 610: second_cnt=0;
	clrf	(_second_cnt)	;volatile
	line	611
	
l3170:	
;MS86F_PWM1_HALF.C: 611: working_timer--;
	movlw	low(01h)
	subwf	(_working_timer),f	;volatile
	movlw	high(01h)
	skipc
	decf	(_working_timer+1),f	;volatile
	subwf	(_working_timer+1),f	;volatile
	line	614
	
l3172:	
;MS86F_PWM1_HALF.C: 612: }
;MS86F_PWM1_HALF.C: 613: }
;MS86F_PWM1_HALF.C: 614: if(working_timer==0)
	movf	((_working_timer+1)),w	;volatile
	iorwf	((_working_timer)),w	;volatile
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l3188
u1400:
	line	616
	
l3174:	
;MS86F_PWM1_HALF.C: 615: {
;MS86F_PWM1_HALF.C: 616: if(work_sta==STATE_WORKING)SetUvBreaking();
	movf	(_work_sta),w
	xorlw	02h
	skipz
	goto	u1411
	goto	u1410
u1411:
	goto	l3178
u1410:
	
l3176:	
	fcall	_SetUvBreaking
	goto	l3206
	line	617
	
l3178:	
;MS86F_PWM1_HALF.C: 617: else if(work_sta==STATE_BREAKING) SetUvWorking();
	movf	(_work_sta),w
	xorlw	04h
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l3182
u1420:
	
l3180:	
	fcall	_SetUvWorking
	goto	l3206
	line	618
	
l3182:	
;MS86F_PWM1_HALF.C: 618: else if(work_sta==STATE_WARNING || work_sta==STATE_IDLE)SetUvSleep();
	movf	(_work_sta),w
	xorlw	03h
	skipnz
	goto	u1431
	goto	u1430
u1431:
	goto	l3186
u1430:
	
l3184:	
	decf	(_work_sta),w
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l965
u1440:
	
l3186:	
	fcall	_SetUvSleep
	goto	l3206
	line	622
	
l3188:	
;MS86F_PWM1_HALF.C: 620: else
;MS86F_PWM1_HALF.C: 621: {
;MS86F_PWM1_HALF.C: 622: brigtness++;
	incf	(_brigtness),f	;volatile
	skipnz
	incf	(_brigtness+1),f	;volatile
	line	623
	
l3190:	
;MS86F_PWM1_HALF.C: 623: if(work_sta==STATE_CHARGING)brigtness+=3;
	movf	(_work_sta),w
	xorlw	05h
	skipz
	goto	u1451
	goto	u1450
u1451:
	goto	l3194
u1450:
	
l3192:	
	movlw	03h
	addwf	(_brigtness),f	;volatile
	skipnc
	incf	(_brigtness+1),f	;volatile
	goto	l967
	line	624
	
l3194:	
;MS86F_PWM1_HALF.C: 624: else if(work_sta==STATE_WARNING)brigtness+=15;
	movf	(_work_sta),w
	xorlw	03h
	skipz
	goto	u1461
	goto	u1460
u1461:
	goto	l967
u1460:
	
l3196:	
	movlw	0Fh
	addwf	(_brigtness),f	;volatile
	skipnc
	incf	(_brigtness+1),f	;volatile
	line	625
	
l967:	
;MS86F_PWM1_HALF.C: 625: if(brigtness<=200)P1BDTL=(unsigned char)(200-brigtness);
	movlw	high(0C9h)
	subwf	(_brigtness+1),w	;volatile
	movlw	low(0C9h)
	skipnz
	subwf	(_brigtness),w	;volatile
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l3200
u1470:
	
l3198:	
	movf	(_brigtness),w	;volatile
	sublw	0C8h
	movwf	(15)	;volatile
	goto	l3206
	line	626
	
l3200:	
;MS86F_PWM1_HALF.C: 626: else if(brigtness<(200*2))P1BDTL=(unsigned char)(brigtness-200);
	movlw	high(0190h)
	subwf	(_brigtness+1),w	;volatile
	movlw	low(0190h)
	skipnz
	subwf	(_brigtness),w	;volatile
	skipnc
	goto	u1481
	goto	u1480
u1481:
	goto	l3204
u1480:
	
l3202:	
	movf	(_brigtness),w	;volatile
	addlw	038h
	movwf	(15)	;volatile
	goto	l3206
	line	627
	
l3204:	
;MS86F_PWM1_HALF.C: 627: else brigtness=5;
	movlw	05h
	movwf	(_brigtness)	;volatile
	clrf	(_brigtness+1)	;volatile
	goto	l3206
	line	628
	
l965:	
	line	631
	
l3206:	
;MS86F_PWM1_HALF.C: 628: }
;MS86F_PWM1_HALF.C: 629: }
;MS86F_PWM1_HALF.C: 631: DELAY_MS(10);
	movlw	0Ah
	movwf	(?_DELAY_MS)
	clrf	(?_DELAY_MS+1)
	fcall	_DELAY_MS
	goto	l3090
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	633
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_SetUvSleep
psect	text764,local,class=CODE,delta=2
global __ptext764
__ptext764:

;; *************** function _SetUvSleep *****************
;; Defined at:
;;		line 493 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_led_off
;;		_SYS_SLEEP
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text764
	file	"MS86F_PWM1_HALF.C"
	line	493
	global	__size_of_SetUvSleep
	__size_of_SetUvSleep	equ	__end_of_SetUvSleep-_SetUvSleep
	
_SetUvSleep:	
	opt	stack 4
; Regs used in _SetUvSleep: [status,2+status,0+pclath+cstack]
	line	494
	
l3068:	
;MS86F_PWM1_HALF.C: 494: PA6=1;
	bsf	(46/8),(46)&7
	line	495
;MS86F_PWM1_HALF.C: 495: PA3=0;
	bcf	(43/8),(43)&7
	line	496
;MS86F_PWM1_HALF.C: 496: PC4=0;
	bcf	(60/8),(60)&7
	line	497
	
l3070:	
;MS86F_PWM1_HALF.C: 497: working_timer=0;
	clrf	(_working_timer)	;volatile
	clrf	(_working_timer+1)	;volatile
	line	498
;MS86F_PWM1_HALF.C: 498: work_sta=STATE_SLEEPING;
	clrf	(_work_sta)
	line	499
	
l3072:	
;MS86F_PWM1_HALF.C: 499: led_off();
	fcall	_led_off
	line	501
	
l3074:	
;MS86F_PWM1_HALF.C: 501: SYS_SLEEP();
	fcall	_SYS_SLEEP
	line	502
;MS86F_PWM1_HALF.C: 502: keytime=0;
	clrf	(_keytime)	;volatile
	line	504
	
l895:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvSleep
	__end_of_SetUvSleep:
;; =============== function _SetUvSleep ends ============

	signat	_SetUvSleep,88
	global	_SetUvIdle
psect	text765,local,class=CODE,delta=2
global __ptext765
__ptext765:

;; *************** function _SetUvIdle *****************
;; Defined at:
;;		line 480 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_led_on
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text765
	file	"MS86F_PWM1_HALF.C"
	line	480
	global	__size_of_SetUvIdle
	__size_of_SetUvIdle	equ	__end_of_SetUvIdle-_SetUvIdle
	
_SetUvIdle:	
	opt	stack 4
; Regs used in _SetUvIdle: [wreg+status,2+status,0+pclath+cstack]
	line	482
	
l3058:	
;MS86F_PWM1_HALF.C: 482: PA6=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	483
;MS86F_PWM1_HALF.C: 483: PA3=0;
	bcf	(43/8),(43)&7
	line	484
;MS86F_PWM1_HALF.C: 484: PC4=0;
	bcf	(60/8),(60)&7
	line	486
	
l3060:	
;MS86F_PWM1_HALF.C: 486: second_cnt=0;
	clrf	(_second_cnt)	;volatile
	line	487
	
l3062:	
;MS86F_PWM1_HALF.C: 487: working_timer=12;
	movlw	0Ch
	movwf	(_working_timer)	;volatile
	clrf	(_working_timer+1)	;volatile
	line	489
	
l3064:	
;MS86F_PWM1_HALF.C: 489: work_sta=STATE_IDLE;
	clrf	(_work_sta)
	incf	(_work_sta),f
	line	490
	
l3066:	
;MS86F_PWM1_HALF.C: 490: led_on();
	fcall	_led_on
	line	491
	
l892:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvIdle
	__end_of_SetUvIdle:
;; =============== function _SetUvIdle ends ============

	signat	_SetUvIdle,88
	global	_SetUvCharged
psect	text766,local,class=CODE,delta=2
global __ptext766
__ptext766:

;; *************** function _SetUvCharged *****************
;; Defined at:
;;		line 470 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_led_on
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text766
	file	"MS86F_PWM1_HALF.C"
	line	470
	global	__size_of_SetUvCharged
	__size_of_SetUvCharged	equ	__end_of_SetUvCharged-_SetUvCharged
	
_SetUvCharged:	
	opt	stack 4
; Regs used in _SetUvCharged: [wreg+status,2+status,0+pclath+cstack]
	line	472
	
l3052:	
;MS86F_PWM1_HALF.C: 472: PA6=1;
	bsf	(46/8),(46)&7
	line	473
;MS86F_PWM1_HALF.C: 473: PA3=0;
	bcf	(43/8),(43)&7
	line	474
;MS86F_PWM1_HALF.C: 474: PC4=0;
	bcf	(60/8),(60)&7
	line	475
	
l3054:	
;MS86F_PWM1_HALF.C: 475: working_timer=-1;
	movlw	low(-1)
	movwf	(_working_timer)
	movlw	high(-1)
	movwf	((_working_timer))+1
	line	476
;MS86F_PWM1_HALF.C: 476: work_sta=STATE_CHARGED;
	movlw	(06h)
	movwf	(_work_sta)
	line	477
	
l3056:	
;MS86F_PWM1_HALF.C: 477: led_on();
	fcall	_led_on
	line	478
	
l889:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvCharged
	__end_of_SetUvCharged:
;; =============== function _SetUvCharged ends ============

	signat	_SetUvCharged,88
	global	_SetUvBreaking
psect	text767,local,class=CODE,delta=2
global __ptext767
__ptext767:

;; *************** function _SetUvBreaking *****************
;; Defined at:
;;		line 435 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_led_on
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text767
	file	"MS86F_PWM1_HALF.C"
	line	435
	global	__size_of_SetUvBreaking
	__size_of_SetUvBreaking	equ	__end_of_SetUvBreaking-_SetUvBreaking
	
_SetUvBreaking:	
	opt	stack 4
; Regs used in _SetUvBreaking: [wreg+status,2+status,0+pclath+cstack]
	line	436
	
l3042:	
;MS86F_PWM1_HALF.C: 436: PA6=1;
	bsf	(46/8),(46)&7
	line	437
;MS86F_PWM1_HALF.C: 437: PA3=0;
	bcf	(43/8),(43)&7
	line	438
;MS86F_PWM1_HALF.C: 438: PC4=0;
	bcf	(60/8),(60)&7
	line	441
	
l3044:	
;MS86F_PWM1_HALF.C: 441: second_cnt=0;
	clrf	(_second_cnt)	;volatile
	line	442
	
l3046:	
;MS86F_PWM1_HALF.C: 442: working_timer=10*59;
	movlw	low(024Eh)
	movwf	(_working_timer)
	movlw	high(024Eh)
	movwf	((_working_timer))+1
	line	444
	
l3048:	
;MS86F_PWM1_HALF.C: 444: work_sta=STATE_BREAKING;
	movlw	(04h)
	movwf	(_work_sta)
	line	445
	
l3050:	
;MS86F_PWM1_HALF.C: 445: led_on();
	fcall	_led_on
	line	446
	
l880:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvBreaking
	__end_of_SetUvBreaking:
;; =============== function _SetUvBreaking ends ============

	signat	_SetUvBreaking,88
	global	_SetUvCharging
psect	text768,local,class=CODE,delta=2
global __ptext768
__ptext768:

;; *************** function _SetUvCharging *****************
;; Defined at:
;;		line 461 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_led_blink
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text768
	file	"MS86F_PWM1_HALF.C"
	line	461
	global	__size_of_SetUvCharging
	__size_of_SetUvCharging	equ	__end_of_SetUvCharging-_SetUvCharging
	
_SetUvCharging:	
	opt	stack 5
; Regs used in _SetUvCharging: [wreg+status,2+status,0+pclath+cstack]
	line	462
	
l3036:	
;MS86F_PWM1_HALF.C: 462: PA6=1;
	bsf	(46/8),(46)&7
	line	463
;MS86F_PWM1_HALF.C: 463: PA3=0;
	bcf	(43/8),(43)&7
	line	464
;MS86F_PWM1_HALF.C: 464: PC4=0;
	bcf	(60/8),(60)&7
	line	465
	
l3038:	
;MS86F_PWM1_HALF.C: 465: work_sta=STATE_CHARGING;
	movlw	(05h)
	movwf	(_work_sta)
	line	466
;MS86F_PWM1_HALF.C: 466: working_timer=-1;
	movlw	low(-1)
	movwf	(_working_timer)
	movlw	high(-1)
	movwf	((_working_timer))+1
	line	467
	
l3040:	
;MS86F_PWM1_HALF.C: 467: led_blink();
	fcall	_led_blink
	line	468
	
l886:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvCharging
	__end_of_SetUvCharging:
;; =============== function _SetUvCharging ends ============

	signat	_SetUvCharging,88
	global	_SetUvWarning
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:

;; *************** function _SetUvWarning *****************
;; Defined at:
;;		line 448 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_led_blink
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text769
	file	"MS86F_PWM1_HALF.C"
	line	448
	global	__size_of_SetUvWarning
	__size_of_SetUvWarning	equ	__end_of_SetUvWarning-_SetUvWarning
	
_SetUvWarning:	
	opt	stack 5
; Regs used in _SetUvWarning: [wreg+status,2+status,0+pclath+cstack]
	line	449
	
l3026:	
;MS86F_PWM1_HALF.C: 449: PA6=1;
	bsf	(46/8),(46)&7
	line	450
;MS86F_PWM1_HALF.C: 450: PA3=0;
	bcf	(43/8),(43)&7
	line	451
;MS86F_PWM1_HALF.C: 451: PC4=0;
	bcf	(60/8),(60)&7
	line	454
	
l3028:	
;MS86F_PWM1_HALF.C: 454: second_cnt=0;
	clrf	(_second_cnt)	;volatile
	line	455
	
l3030:	
;MS86F_PWM1_HALF.C: 455: working_timer=2;
	movlw	02h
	movwf	(_working_timer)	;volatile
	clrf	(_working_timer+1)	;volatile
	line	457
	
l3032:	
;MS86F_PWM1_HALF.C: 457: work_sta=STATE_WARNING;
	movlw	(03h)
	movwf	(_work_sta)
	line	458
	
l3034:	
;MS86F_PWM1_HALF.C: 458: led_blink();
	fcall	_led_blink
	line	459
	
l883:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvWarning
	__end_of_SetUvWarning:
;; =============== function _SetUvWarning ends ============

	signat	_SetUvWarning,88
	global	_SetUvWorking
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

;; *************** function _SetUvWorking *****************
;; Defined at:
;;		line 422 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
;;		Unchanged: FFFDF/0
;; Data sizes:     COMMON   BANK0
;;      Params:         0       0
;;      Locals:         0       0
;;      Temps:          0       0
;;      Totals:         0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_led_blink
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text770
	file	"MS86F_PWM1_HALF.C"
	line	422
	global	__size_of_SetUvWorking
	__size_of_SetUvWorking	equ	__end_of_SetUvWorking-_SetUvWorking
	
_SetUvWorking:	
	opt	stack 5
; Regs used in _SetUvWorking: [wreg+status,2+status,0+pclath+cstack]
	line	424
	
l3016:	
;MS86F_PWM1_HALF.C: 424: PA6=0;
	bcf	(46/8),(46)&7
	line	425
;MS86F_PWM1_HALF.C: 425: PA3=1;
	bsf	(43/8),(43)&7
	line	426
;MS86F_PWM1_HALF.C: 426: PC4=1;
	bsf	(60/8),(60)&7
	line	428
	
l3018:	
;MS86F_PWM1_HALF.C: 428: second_cnt=0;
	clrf	(_second_cnt)	;volatile
	line	429
	
l3020:	
;MS86F_PWM1_HALF.C: 429: working_timer=20*59;
	movlw	low(049Ch)
	movwf	(_working_timer)
	movlw	high(049Ch)
	movwf	((_working_timer))+1
	line	431
	
l3022:	
;MS86F_PWM1_HALF.C: 431: work_sta=STATE_WORKING;
	movlw	(02h)
	movwf	(_work_sta)
	line	432
	
l3024:	
;MS86F_PWM1_HALF.C: 432: led_blink();
	fcall	_led_blink
	line	433
	
l877:	
	return
	opt stack 0
GLOBAL	__end_of_SetUvWorking
	__end_of_SetUvWorking:
;; =============== function _SetUvWorking ends ============

	signat	_SetUvWorking,88
	global	_led_off
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

;; *************** function _led_off *****************
;; Defined at:
;;		line 407 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DISABLE_INTERRUPT
;; This function is called by:
;;		_SetUvSleep
;; This function uses a non-reentrant model
;;
psect	text771
	file	"MS86F_PWM1_HALF.C"
	line	407
	global	__size_of_led_off
	__size_of_led_off	equ	__end_of_led_off-_led_off
	
_led_off:	
	opt	stack 4
; Regs used in _led_off: [status,2+status,0+pclath+cstack]
	line	408
	
l3010:	
;MS86F_PWM1_HALF.C: 408: DISABLE_INTERRUPT();
	fcall	_DISABLE_INTERRUPT
	line	409
	
l3012:	
;MS86F_PWM1_HALF.C: 409: P1BOE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1158/8)^080h,(1158)&7
	line	410
	
l3014:	
;MS86F_PWM1_HALF.C: 410: RA4=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(44/8),(44)&7
	line	411
	
l871:	
	return
	opt stack 0
GLOBAL	__end_of_led_off
	__end_of_led_off:
;; =============== function _led_off ends ============

	signat	_led_off,88
	global	_led_on
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

;; *************** function _led_on *****************
;; Defined at:
;;		line 401 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DISABLE_INTERRUPT
;; This function is called by:
;;		_SetUvBreaking
;;		_SetUvCharged
;;		_SetUvIdle
;; This function uses a non-reentrant model
;;
psect	text772
	file	"MS86F_PWM1_HALF.C"
	line	401
	global	__size_of_led_on
	__size_of_led_on	equ	__end_of_led_on-_led_on
	
_led_on:	
	opt	stack 4
; Regs used in _led_on: [status,2+status,0+pclath+cstack]
	line	402
	
l3004:	
;MS86F_PWM1_HALF.C: 402: DISABLE_INTERRUPT();
	fcall	_DISABLE_INTERRUPT
	line	403
	
l3006:	
;MS86F_PWM1_HALF.C: 403: P1BOE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1158/8)^080h,(1158)&7
	line	404
	
l3008:	
;MS86F_PWM1_HALF.C: 404: RA4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(44/8),(44)&7
	line	405
	
l868:	
	return
	opt stack 0
GLOBAL	__end_of_led_on
	__end_of_led_on:
;; =============== function _led_on ends ============

	signat	_led_on,88
	global	_SYS_SLEEP
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:

;; *************** function _SYS_SLEEP *****************
;; Defined at:
;;		line 350 in file "MS86F_PWM1_HALF.C"
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
;;		On exit  : 0/0
;;		Unchanged: 0/0
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
;;		_SetUvSleep
;; This function uses a non-reentrant model
;;
psect	text773
	file	"MS86F_PWM1_HALF.C"
	line	350
	global	__size_of_SYS_SLEEP
	__size_of_SYS_SLEEP	equ	__end_of_SYS_SLEEP-_SYS_SLEEP
	
_SYS_SLEEP:	
	opt	stack 5
; Regs used in _SYS_SLEEP: []
	line	375
	
l3002:	
;MS86F_PWM1_HALF.C: 375: GIE = 0;
	bcf	(95/8),(95)&7
	line	376
# 376 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text773
	line	381
;MS86F_PWM1_HALF.C: 381: SLVREN = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(219/8),(219)&7
	line	386
;MS86F_PWM1_HALF.C: 386: INTEDG = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1038/8)^080h,(1038)&7
	line	387
;MS86F_PWM1_HALF.C: 387: INTF = 0;
	bcf	(89/8),(89)&7
	line	388
;MS86F_PWM1_HALF.C: 388: INTE = 1;
	bsf	(92/8),(92)&7
	line	389
# 389 "MS86F_PWM1_HALF.C"
sleep ;#
psect	text773
	line	390
;MS86F_PWM1_HALF.C: 390: _nop();
	nop
	line	391
;MS86F_PWM1_HALF.C: 391: INTE = 0;
	bcf	(92/8),(92)&7
	line	392
;MS86F_PWM1_HALF.C: 392: INTF = 0;
	bcf	(89/8),(89)&7
	line	393
;MS86F_PWM1_HALF.C: 393: SLVREN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(219/8),(219)&7
	line	394
;MS86F_PWM1_HALF.C: 394: SWDTEN = 1;
	bsf	(192/8),(192)&7
	line	395
# 395 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text773
	line	396
;MS86F_PWM1_HALF.C: 396: GIE = 1;
	bsf	(95/8),(95)&7
	line	398
	
l865:	
	return
	opt stack 0
GLOBAL	__end_of_SYS_SLEEP
	__end_of_SYS_SLEEP:
;; =============== function _SYS_SLEEP ends ============

	signat	_SYS_SLEEP,88
	global	_DELAY_MS
psect	text774,local,class=CODE,delta=2
global __ptext774
__ptext774:

;; *************** function _DELAY_MS *****************
;; Defined at:
;;		line 219 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;  Time            2    3[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  a               2    5[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0
;;      Params:         2       0
;;      Locals:         2       0
;;      Temps:          0       0
;;      Totals:         4       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_DELAY_125US
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text774
	file	"MS86F_PWM1_HALF.C"
	line	219
	global	__size_of_DELAY_MS
	__size_of_DELAY_MS	equ	__end_of_DELAY_MS-_DELAY_MS
	
_DELAY_MS:	
	opt	stack 5
; Regs used in _DELAY_MS: [wreg+status,2+status,0+pclath+cstack]
	line	222
	
l2992:	
;MS86F_PWM1_HALF.C: 220: unsigned short a;
;MS86F_PWM1_HALF.C: 222: Time<<=3;
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	clrc
	rlf	(DELAY_MS@Time),f
	rlf	(DELAY_MS@Time+1),f
	line	224
	
l2994:	
;MS86F_PWM1_HALF.C: 224: for(a=0;a<Time;a++)
	clrf	(DELAY_MS@a)
	clrf	(DELAY_MS@a+1)
	goto	l3000
	line	226
	
l2996:	
;MS86F_PWM1_HALF.C: 225: {
;MS86F_PWM1_HALF.C: 226: DELAY_125US();
	fcall	_DELAY_125US
	line	224
	
l2998:	
	incf	(DELAY_MS@a),f
	skipnz
	incf	(DELAY_MS@a+1),f
	
l3000:	
	movf	(DELAY_MS@Time+1),w
	subwf	(DELAY_MS@a+1),w
	skipz
	goto	u1195
	movf	(DELAY_MS@Time),w
	subwf	(DELAY_MS@a),w
u1195:
	skipc
	goto	u1191
	goto	u1190
u1191:
	goto	l2996
u1190:
	line	228
	
l831:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_MS
	__end_of_DELAY_MS:
;; =============== function _DELAY_MS ends ============

	signat	_DELAY_MS,4216
	global	_GetPwrSta
psect	text775,local,class=CODE,delta=2
global __ptext775
__ptext775:

;; *************** function _GetPwrSta *****************
;; Defined at:
;;		line 526 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      enum E1037
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 0/0
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
psect	text775
	file	"MS86F_PWM1_HALF.C"
	line	526
	global	__size_of_GetPwrSta
	__size_of_GetPwrSta	equ	__end_of_GetPwrSta-_GetPwrSta
	
_GetPwrSta:	
	opt	stack 6
; Regs used in _GetPwrSta: [wreg]
	line	527
	
l2968:	
;MS86F_PWM1_HALF.C: 527: if(PC0==0)return POWER_FULL;
	btfsc	(56/8),(56)&7
	goto	u1161
	goto	u1160
u1161:
	goto	l906
u1160:
	
l2970:	
	movlw	(02h)
	goto	l907
	line	528
	
l906:	
;MS86F_PWM1_HALF.C: 528: else if(RA7==0)return POWER_CHARGING;
	btfsc	(47/8),(47)&7
	goto	u1171
	goto	u1170
u1171:
	goto	l909
u1170:
	
l2976:	
	movlw	(01h)
	goto	l907
	line	529
	
l909:	
;MS86F_PWM1_HALF.C: 529: else if(LVDW)return POWER_LOW;
	bsf	status, 5	;RP0=1, select bank1
	btfss	(1138/8)^080h,(1138)&7
	goto	u1181
	goto	u1180
u1181:
	goto	l2988
u1180:
	
l2982:	
	movlw	(03h)
	goto	l907
	line	530
	
l2988:	
;MS86F_PWM1_HALF.C: 530: else return POWER_NORMAL;
	movlw	(0)
	line	531
	
l907:	
	return
	opt stack 0
GLOBAL	__end_of_GetPwrSta
	__end_of_GetPwrSta:
;; =============== function _GetPwrSta ends ============

	signat	_GetPwrSta,89
	global	_GetKeyEvent
psect	text776,local,class=CODE,delta=2
global __ptext776
__ptext776:

;; *************** function _GetKeyEvent *****************
;; Defined at:
;;		line 507 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  key_event       1    2[COMMON] unsigned char 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text776
	file	"MS86F_PWM1_HALF.C"
	line	507
	global	__size_of_GetKeyEvent
	__size_of_GetKeyEvent	equ	__end_of_GetKeyEvent-_GetKeyEvent
	
_GetKeyEvent:	
	opt	stack 6
; Regs used in _GetKeyEvent: [wreg+status,2+status,0]
	line	509
	
l2944:	
;MS86F_PWM1_HALF.C: 509: unsigned char key_event=0;
	clrf	(GetKeyEvent@key_event)
	line	510
	
l2946:	
;MS86F_PWM1_HALF.C: 510: if(PA2==0)
	bcf	status, 5	;RP0=0, select bank0
	btfsc	(42/8),(42)&7
	goto	u1111
	goto	u1110
u1111:
	goto	l2956
u1110:
	line	512
	
l2948:	
;MS86F_PWM1_HALF.C: 511: {
;MS86F_PWM1_HALF.C: 512: if(keytime<200)
	movlw	(0C8h)
	subwf	(_keytime),w	;volatile
	skipnc
	goto	u1121
	goto	u1120
u1121:
	goto	l2964
u1120:
	line	514
	
l2950:	
;MS86F_PWM1_HALF.C: 513: {
;MS86F_PWM1_HALF.C: 514: keytime++;
	incf	(_keytime),f	;volatile
	line	515
	
l2952:	
;MS86F_PWM1_HALF.C: 515: if(keytime>=200)key_event = 2;
	movlw	(0C8h)
	subwf	(_keytime),w	;volatile
	skipc
	goto	u1131
	goto	u1130
u1131:
	goto	l2964
u1130:
	
l2954:	
	movlw	(02h)
	movwf	(GetKeyEvent@key_event)
	goto	l2964
	line	520
	
l2956:	
;MS86F_PWM1_HALF.C: 518: else
;MS86F_PWM1_HALF.C: 519: {
;MS86F_PWM1_HALF.C: 520: if(keytime>10 && keytime<200)key_event=1;
	movlw	(0Bh)
	subwf	(_keytime),w	;volatile
	skipc
	goto	u1141
	goto	u1140
u1141:
	goto	l2962
u1140:
	
l2958:	
	movlw	(0C8h)
	subwf	(_keytime),w	;volatile
	skipnc
	goto	u1151
	goto	u1150
u1151:
	goto	l2962
u1150:
	
l2960:	
	clrf	(GetKeyEvent@key_event)
	incf	(GetKeyEvent@key_event),f
	line	521
	
l2962:	
;MS86F_PWM1_HALF.C: 521: keytime=0;
	clrf	(_keytime)	;volatile
	line	523
	
l2964:	
;MS86F_PWM1_HALF.C: 522: }
;MS86F_PWM1_HALF.C: 523: return key_event;
	movf	(GetKeyEvent@key_event),w
	line	524
	
l903:	
	return
	opt stack 0
GLOBAL	__end_of_GetKeyEvent
	__end_of_GetKeyEvent:
;; =============== function _GetKeyEvent ends ============

	signat	_GetKeyEvent,89
	global	_led_blink
psect	text777,local,class=CODE,delta=2
global __ptext777
__ptext777:

;; *************** function _led_blink *****************
;; Defined at:
;;		line 413 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 20/0
;;		On exit  : 20/20
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
;;		_SetUvWorking
;;		_SetUvWarning
;;		_SetUvCharging
;; This function uses a non-reentrant model
;;
psect	text777
	file	"MS86F_PWM1_HALF.C"
	line	413
	global	__size_of_led_blink
	__size_of_led_blink	equ	__end_of_led_blink-_led_blink
	
_led_blink:	
	opt	stack 5
; Regs used in _led_blink: [wreg+status,2+status,0]
	line	414
	
l2936:	
;MS86F_PWM1_HALF.C: 414: brigtness=5;
	movlw	05h
	movwf	(_brigtness)	;volatile
	clrf	(_brigtness+1)	;volatile
	line	415
	
l2938:	
;MS86F_PWM1_HALF.C: 415: dir=1;
	clrf	(_dir)	;volatile
	incf	(_dir),f	;volatile
	line	416
	
l2940:	
;MS86F_PWM1_HALF.C: 416: P1BDTL=200-brigtness;
	movf	(_brigtness),w	;volatile
	sublw	0C8h
	movwf	(15)	;volatile
	line	417
	
l2942:	
;MS86F_PWM1_HALF.C: 417: P1BOE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1158/8)^080h,(1158)&7
	line	419
	
l874:	
	return
	opt stack 0
GLOBAL	__end_of_led_blink
	__end_of_led_blink:
;; =============== function _led_blink ends ============

	signat	_led_blink,88
	global	_LVD_INIT
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

;; *************** function _LVD_INIT *****************
;; Defined at:
;;		line 337 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 20/20
;;		On exit  : 20/20
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
psect	text778
	file	"MS86F_PWM1_HALF.C"
	line	337
	global	__size_of_LVD_INIT
	__size_of_LVD_INIT	equ	__end_of_LVD_INIT-_LVD_INIT
	
_LVD_INIT:	
	opt	stack 6
; Regs used in _LVD_INIT: [wreg]
	line	339
	
l2932:	
;MS86F_PWM1_HALF.C: 339: PCON = 0B11010011;
	movlw	(0D3h)
	movwf	(142)^080h	;volatile
	line	346
	
l2934:	
;MS86F_PWM1_HALF.C: 346: LVDEN = 1;
	bsf	(1139/8)^080h,(1139)&7
	line	347
	
l862:	
	return
	opt stack 0
GLOBAL	__end_of_LVD_INIT
	__end_of_LVD_INIT:
;; =============== function _LVD_INIT ends ============

	signat	_LVD_INIT,88
	global	_DISABLE_INTERRUPT
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

;; *************** function _DISABLE_INTERRUPT *****************
;; Defined at:
;;		line 321 in file "MS86F_PWM1_HALF.C"
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
;;		_led_on
;;		_led_off
;; This function uses a non-reentrant model
;;
psect	text779
	file	"MS86F_PWM1_HALF.C"
	line	321
	global	__size_of_DISABLE_INTERRUPT
	__size_of_DISABLE_INTERRUPT	equ	__end_of_DISABLE_INTERRUPT-_DISABLE_INTERRUPT
	
_DISABLE_INTERRUPT:	
	opt	stack 4
; Regs used in _DISABLE_INTERRUPT: []
	line	322
	
l2930:	
;MS86F_PWM1_HALF.C: 322: INTE = 0;
	bcf	(92/8),(92)&7
	line	324
;MS86F_PWM1_HALF.C: 324: T0IF = 0;
	bcf	(90/8),(90)&7
	line	325
;MS86F_PWM1_HALF.C: 325: T0IE = 0;
	bcf	(93/8),(93)&7
	line	326
;MS86F_PWM1_HALF.C: 326: T0ON = 0;
	bcf	(251/8),(251)&7
	line	328
;MS86F_PWM1_HALF.C: 328: GIE = 0;
	bcf	(95/8),(95)&7
	line	329
	
l859:	
	return
	opt stack 0
GLOBAL	__end_of_DISABLE_INTERRUPT
	__end_of_DISABLE_INTERRUPT:
;; =============== function _DISABLE_INTERRUPT ends ============

	signat	_DISABLE_INTERRUPT,88
	global	_ENABLE_INTERRUPT
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

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
;;		On entry : 20/20
;;		On exit  : 20/20
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
psect	text780
	file	"MS86F_PWM1_HALF.C"
	line	309
	global	__size_of_ENABLE_INTERRUPT
	__size_of_ENABLE_INTERRUPT	equ	__end_of_ENABLE_INTERRUPT-_ENABLE_INTERRUPT
	
_ENABLE_INTERRUPT:	
	opt	stack 6
; Regs used in _ENABLE_INTERRUPT: []
	line	310
	
l2928:	
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
	
l856:	
	return
	opt stack 0
GLOBAL	__end_of_ENABLE_INTERRUPT
	__end_of_ENABLE_INTERRUPT:
;; =============== function _ENABLE_INTERRUPT ends ============

	signat	_ENABLE_INTERRUPT,88
	global	_DELAY_125US
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

;; *************** function _DELAY_125US *****************
;; Defined at:
;;		line 210 in file "MS86F_PWM1_HALF.C"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  a               1    2[COMMON] unsigned char 
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_DELAY_MS
;; This function uses a non-reentrant model
;;
psect	text781
	file	"MS86F_PWM1_HALF.C"
	line	210
	global	__size_of_DELAY_125US
	__size_of_DELAY_125US	equ	__end_of_DELAY_125US-_DELAY_125US
	
_DELAY_125US:	
	opt	stack 5
; Regs used in _DELAY_125US: [wreg+status,2+status,0]
	line	213
	
l2918:	
;MS86F_PWM1_HALF.C: 211: unsigned char a;
;MS86F_PWM1_HALF.C: 213: for(a=0;a<125;a++)
	clrf	(DELAY_125US@a)
	line	214
	
l823:	
	line	215
# 215 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text781
	line	213
	
l2924:	
	incf	(DELAY_125US@a),f
	
l2926:	
	movlw	(07Dh)
	subwf	(DELAY_125US@a),w
	skipc
	goto	u1101
	goto	u1100
u1101:
	goto	l823
u1100:
	line	217
	
l825:	
	return
	opt stack 0
GLOBAL	__end_of_DELAY_125US
	__end_of_DELAY_125US:
;; =============== function _DELAY_125US ends ============

	signat	_DELAY_125US,88
	global	_WDT_INIT
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:

;; *************** function _WDT_INIT *****************
;; Defined at:
;;		line 191 in file "MS86F_PWM1_HALF.C"
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
;;		Unchanged: FFE00/0
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
psect	text782
	file	"MS86F_PWM1_HALF.C"
	line	191
	global	__size_of_WDT_INIT
	__size_of_WDT_INIT	equ	__end_of_WDT_INIT-_WDT_INIT
	
_WDT_INIT:	
	opt	stack 6
; Regs used in _WDT_INIT: [wreg]
	line	192
	
l2912:	
;MS86F_PWM1_HALF.C: 192: SWDTEN = 0;
	bcf	(192/8),(192)&7
	line	196
# 196 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text782
	line	197
	
l2914:	
;MS86F_PWM1_HALF.C: 197: OPTION = 0B00001000;
	movlw	(08h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(129)^080h	;volatile
	line	198
;MS86F_PWM1_HALF.C: 198: WDTCON = 0B00010101;
	movlw	(015h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(24)	;volatile
	line	201
	
l2916:	
;MS86F_PWM1_HALF.C: 201: SWDTEN = 1;
	bsf	(192/8),(192)&7
	line	202
	
l820:	
	return
	opt stack 0
GLOBAL	__end_of_WDT_INIT
	__end_of_WDT_INIT:
;; =============== function _WDT_INIT ends ============

	signat	_WDT_INIT,88
	global	_PWM1_INIT
psect	text783,local,class=CODE,delta=2
global __ptext783
__ptext783:

;; *************** function _PWM1_INIT *****************
;; Defined at:
;;		line 133 in file "MS86F_PWM1_HALF.C"
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
;;		On exit  : 20/20
;;		Unchanged: FFE00/0
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
psect	text783
	file	"MS86F_PWM1_HALF.C"
	line	133
	global	__size_of_PWM1_INIT
	__size_of_PWM1_INIT	equ	__end_of_PWM1_INIT-_PWM1_INIT
	
_PWM1_INIT:	
	opt	stack 6
; Regs used in _PWM1_INIT: [wreg+status,2]
	line	134
	
l2888:	
;MS86F_PWM1_HALF.C: 134: TRISA |= 0B00010000;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(133)^080h+(4/8),(4)&7	;volatile
	line	137
	
l2890:	
;MS86F_PWM1_HALF.C: 137: T2CON0 = 0B00000001;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	138
	
l2892:	
;MS86F_PWM1_HALF.C: 138: T2CON1 = 0B00000000;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(158)^080h	;volatile
	line	139
	
l2894:	
;MS86F_PWM1_HALF.C: 139: PR2H = 0;
	clrf	(146)^080h	;volatile
	line	140
;MS86F_PWM1_HALF.C: 140: PR2L = 200-1;
	movlw	(0C7h)
	movwf	(145)^080h	;volatile
	line	142
	
l2896:	
;MS86F_PWM1_HALF.C: 142: P1BDTH = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(21)	;volatile
	line	143
	
l2898:	
;MS86F_PWM1_HALF.C: 143: P1BDTL = 200-5;
	movlw	(0C3h)
	movwf	(15)	;volatile
	line	147
	
l2900:	
;MS86F_PWM1_HALF.C: 147: P1OE = 0B01000000;
	movlw	(040h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(144)^080h	;volatile
	line	150
	
l2902:	
;MS86F_PWM1_HALF.C: 150: P1POL = 0B00000000;
	clrf	(153)^080h	;volatile
	line	151
;MS86F_PWM1_HALF.C: 151: P1CON = 0B00001000;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(22)	;volatile
	line	152
	
l2904:	
;MS86F_PWM1_HALF.C: 152: TMR2H = 0;
	clrf	(19)	;volatile
	line	153
	
l2906:	
;MS86F_PWM1_HALF.C: 153: TMR2L = 0;
	clrf	(17)	;volatile
	line	154
	
l2908:	
;MS86F_PWM1_HALF.C: 154: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	155
	
l2910:	
;MS86F_PWM1_HALF.C: 155: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	156
;MS86F_PWM1_HALF.C: 156: while(TMR2IF==0) asm("clrwdt");
	goto	l814
	
l815:	
# 156 "MS86F_PWM1_HALF.C"
clrwdt ;#
psect	text783
	
l814:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(97/8),(97)&7
	goto	u1091
	goto	u1090
u1091:
	goto	l815
u1090:
	
l816:	
	line	157
;MS86F_PWM1_HALF.C: 157: TRISA &= 0B11101111;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(133)^080h+(4/8),(4)&7	;volatile
	line	159
	
l817:	
	return
	opt stack 0
GLOBAL	__end_of_PWM1_INIT
	__end_of_PWM1_INIT:
;; =============== function _PWM1_INIT ends ============

	signat	_PWM1_INIT,88
	global	_DEVICE_INIT
psect	text784,local,class=CODE,delta=2
global __ptext784
__ptext784:

;; *************** function _DEVICE_INIT *****************
;; Defined at:
;;		line 98 in file "MS86F_PWM1_HALF.C"
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
psect	text784
	file	"MS86F_PWM1_HALF.C"
	line	98
	global	__size_of_DEVICE_INIT
	__size_of_DEVICE_INIT	equ	__end_of_DEVICE_INIT-_DEVICE_INIT
	
_DEVICE_INIT:	
	opt	stack 6
; Regs used in _DEVICE_INIT: [wreg+status,2]
	line	99
	
l2874:	
;MS86F_PWM1_HALF.C: 99: OSCCON = 0B01110001;
	movlw	(071h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(143)^080h	;volatile
	line	102
	
l2876:	
;MS86F_PWM1_HALF.C: 102: INTCON = 0B00000000;
	clrf	(11)	;volatile
	line	103
	
l2878:	
;MS86F_PWM1_HALF.C: 103: OPTION = 0B00001000;
	movlw	(08h)
	movwf	(129)^080h	;volatile
	line	105
	
l2880:	
;MS86F_PWM1_HALF.C: 105: PORTA = 0B01010000;
	movlw	(050h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(5)	;volatile
	line	106
	
l2882:	
;MS86F_PWM1_HALF.C: 106: TRISA = 0B10100111;
	movlw	(0A7h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(133)^080h	;volatile
	line	107
	
l2884:	
;MS86F_PWM1_HALF.C: 107: WPUA = 0B10100111;
	movlw	(0A7h)
	movwf	(149)^080h	;volatile
	line	109
	
l2886:	
;MS86F_PWM1_HALF.C: 109: PORTC = 0B00000000;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(7)	;volatile
	line	110
;MS86F_PWM1_HALF.C: 110: TRISC = 0B11101111;
	movlw	(0EFh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(135)^080h	;volatile
	line	111
;MS86F_PWM1_HALF.C: 111: WPUC = 0B11101111;
	movlw	(0EFh)
	movwf	(147)^080h	;volatile
	line	113
;MS86F_PWM1_HALF.C: 113: PSRCA = 0B11111111;
	movlw	(0FFh)
	movwf	(136)^080h	;volatile
	line	114
;MS86F_PWM1_HALF.C: 114: PSRCC = 0B11111111;
	movlw	(0FFh)
	movwf	(148)^080h	;volatile
	line	115
;MS86F_PWM1_HALF.C: 115: PSINKA = 0B11111111;
	movlw	(0FFh)
	movwf	(151)^080h	;volatile
	line	116
;MS86F_PWM1_HALF.C: 116: PSINKC = 0B11111111;
	movlw	(0FFh)
	movwf	(159)^080h	;volatile
	line	117
;MS86F_PWM1_HALF.C: 117: MSCON = 0B00110000;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(27)	;volatile
	line	125
	
l811:	
	return
	opt stack 0
GLOBAL	__end_of_DEVICE_INIT
	__end_of_DEVICE_INIT:
;; =============== function _DEVICE_INIT ends ============

	signat	_DEVICE_INIT,88
	global	_ISR
psect	text785,local,class=CODE,delta=2
global __ptext785
__ptext785:

;; *************** function _ISR *****************
;; Defined at:
;;		line 237 in file "MS86F_PWM1_HALF.C"
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
psect	text785
	file	"MS86F_PWM1_HALF.C"
	line	237
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
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
psect	text785
	line	239
	
i1l2494:	
;MS86F_PWM1_HALF.C: 239: if(INTE&&INTF)
	btfss	(92/8),(92)&7
	goto	u57_21
	goto	u57_20
u57_21:
	goto	i1l834
u57_20:
	
i1l2496:	
	btfss	(89/8),(89)&7
	goto	u58_21
	goto	u58_20
u58_21:
	goto	i1l834
u58_20:
	line	241
	
i1l2498:	
;MS86F_PWM1_HALF.C: 240: {
;MS86F_PWM1_HALF.C: 241: INTF = 0;
	bcf	(89/8),(89)&7
	line	242
	
i1l834:	
	line	244
;MS86F_PWM1_HALF.C: 242: }
;MS86F_PWM1_HALF.C: 244: if(T0IE&&T0IF)
	btfss	(93/8),(93)&7
	goto	u59_21
	goto	u59_20
u59_21:
	goto	i1l850
u59_20:
	
i1l2500:	
	btfss	(90/8),(90)&7
	goto	u60_21
	goto	u60_20
u60_21:
	goto	i1l850
u60_20:
	line	246
	
i1l2502:	
;MS86F_PWM1_HALF.C: 245: {
;MS86F_PWM1_HALF.C: 246: T0IF = 0;
	bcf	(90/8),(90)&7
	line	247
	
i1l2504:	
;MS86F_PWM1_HALF.C: 247: TMR0 = 6;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(1)	;volatile
	line	248
	
i1l2506:	
;MS86F_PWM1_HALF.C: 248: T0_cnt++;
	incf	(_T0_cnt),f	;volatile
	line	249
	
i1l2508:	
;MS86F_PWM1_HALF.C: 249: if(T0_cnt>=125)
	movlw	(07Dh)
	subwf	(_T0_cnt),w	;volatile
	skipc
	goto	u61_21
	goto	u61_20
u61_21:
	goto	i1l2512
u61_20:
	line	252
	
i1l2510:	
;MS86F_PWM1_HALF.C: 250: {
;MS86F_PWM1_HALF.C: 252: T0_cnt=0;
	clrf	(_T0_cnt)	;volatile
	line	255
	
i1l2512:	
;MS86F_PWM1_HALF.C: 253: }
;MS86F_PWM1_HALF.C: 255: if(work_sta==STATE_WARNING || work_sta==STATE_WORKING || work_sta==STATE_CHARGING)
	movf	(_work_sta),w
	xorlw	03h
	skipnz
	goto	u62_21
	goto	u62_20
u62_21:
	goto	i1l2518
u62_20:
	
i1l2514:	
	movf	(_work_sta),w
	xorlw	02h
	skipnz
	goto	u63_21
	goto	u63_20
u63_21:
	goto	i1l2518
u63_20:
	
i1l2516:	
	movf	(_work_sta),w
	xorlw	05h
	skipz
	goto	u64_21
	goto	u64_20
u64_21:
	goto	i1l850
u64_20:
	line	257
	
i1l2518:	
;MS86F_PWM1_HALF.C: 256: {
;MS86F_PWM1_HALF.C: 257: delay++;
	incf	(_delay),f	;volatile
	line	258
	
i1l2520:	
;MS86F_PWM1_HALF.C: 258: if(work_sta==STATE_CHARGING)delay++;
	movf	(_work_sta),w
	xorlw	05h
	skipz
	goto	u65_21
	goto	u65_20
u65_21:
	goto	i1l2524
u65_20:
	
i1l2522:	
	incf	(_delay),f	;volatile
	goto	i1l2528
	line	259
	
i1l2524:	
;MS86F_PWM1_HALF.C: 259: else if(work_sta==STATE_WARNING)delay++;
	movf	(_work_sta),w
	xorlw	03h
	skipz
	goto	u66_21
	goto	u66_20
u66_21:
	goto	i1l2528
u66_20:
	goto	i1l2522
	line	261
	
i1l2528:	
;MS86F_PWM1_HALF.C: 261: if(delay>LED_SPEED)
	movf	(_delay),w	;volatile
	subwf	(_LED_SPEED),w	;volatile
	skipnc
	goto	u67_21
	goto	u67_20
u67_21:
	goto	i1l850
u67_20:
	line	263
	
i1l2530:	
;MS86F_PWM1_HALF.C: 262: {
;MS86F_PWM1_HALF.C: 263: delay=0;
	clrf	(_delay)	;volatile
	line	265
	
i1l2532:	
;MS86F_PWM1_HALF.C: 265: if(dir)
	movf	(_dir),w	;volatile
	skipz
	goto	u68_20
	goto	i1l2540
u68_20:
	line	267
	
i1l2534:	
;MS86F_PWM1_HALF.C: 266: {
;MS86F_PWM1_HALF.C: 267: if(brightness<200)brightness++;
	movlw	(0C8h)
	subwf	(_brightness),w	;volatile
	skipnc
	goto	u69_21
	goto	u69_20
u69_21:
	goto	i1l2538
u69_20:
	
i1l2536:	
	incf	(_brightness),f	;volatile
	goto	i1l2544
	line	268
	
i1l2538:	
;MS86F_PWM1_HALF.C: 268: else dir=0;
	clrf	(_dir)	;volatile
	goto	i1l2544
	line	272
	
i1l2540:	
;MS86F_PWM1_HALF.C: 270: else
;MS86F_PWM1_HALF.C: 271: {
;MS86F_PWM1_HALF.C: 272: if(brightness>5)brightness--;
	movlw	(06h)
	subwf	(_brightness),w	;volatile
	skipc
	goto	u70_21
	goto	u70_20
u70_21:
	goto	i1l848
u70_20:
	
i1l2542:	
	decf	(_brightness),f	;volatile
	goto	i1l2544
	line	273
	
i1l848:	
;MS86F_PWM1_HALF.C: 273: else dir=1;
	clrf	(_dir)	;volatile
	incf	(_dir),f	;volatile
	line	284
	
i1l2544:	
;MS86F_PWM1_HALF.C: 274: }
;MS86F_PWM1_HALF.C: 284: P1BDTL = 200-brightness;
	movf	(_brightness),w	;volatile
	sublw	0C8h
	movwf	(15)	;volatile
	line	288
	
i1l850:	
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
psect	text786,local,class=CODE,delta=2
global __ptext786
__ptext786:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
