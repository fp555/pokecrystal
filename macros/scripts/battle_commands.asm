MACRO command
	const \1_command
	DEF \1 EQUS "db \1_command"
ENDM

; BattleCommandPointers indexes (see data/battle/effect_command_pointers.asm)
	const_def 1
	command checkturn               ; 01
	command checkobedience          ; 02
	command usedmovetext            ; 03
	command doturn                  ; 04
	command critical                ; 05
	command damagestats             ; 06
	command stab                    ; 07
	command damagevariation         ; 08
	command checkhit                ; 09
	command lowersub                ; 0a
	command moveanimnosub           ; 0b
	command raisesub                ; 0c
	command failuretext             ; 0d
	command applydamage             ; 0e
	command criticaltext            ; 0f
	command supereffectivetext      ; 10
	command checkfaint              ; 11
	command buildopponentrage       ; 12
	command poisontarget            ; 13
	command sleeptarget             ; 14
	command draintarget             ; 15
	command eatdream                ; 16
	command burntarget              ; 17
	command freezetarget            ; 18
	command paralyzetarget          ; 19
	command selfdestruct            ; 1a
	command mirrormove              ; 1b
	command statup                  ; 1c
	command statdown                ; 1d
	command payday                  ; 1e
	command conversion              ; 1f
	command resetstats              ; 20
	command storeenergy             ; 21
	command unleashenergy           ; 22
	command forceswitch             ; 23
	command endloop                 ; 24
	command flinchtarget            ; 25
	command ohko                    ; 26
	command recoil                  ; 27
	command mist                    ; 28
	command focusenergy             ; 29
	command confuse                 ; 2a
	command confusetarget           ; 2b
	command heal                    ; 2c
	command transform               ; 2d
	command screen                  ; 2e
	command poison                  ; 2f
	command paralyze                ; 30
	command substitute              ; 31
	command rechargenextturn        ; 32
	command mimic                   ; 33
	command metronome               ; 34
	command leechseed               ; 35
	command splash                  ; 36
	command disable                 ; 37
	command cleartext               ; 38
	command charge                  ; 39
	command checkcharge             ; 3a
	command traptarget              ; 3b
	command bulkup		            ; 3c
	command rampage                 ; 3d
	command checkrampage            ; 3e
	command constantdamage          ; 3f
	command counter                 ; 40
	command encore                  ; 41
	command painsplit               ; 42
	command snore                   ; 43
	command conversion2             ; 44
	command lockon                  ; 45
	command sketch                  ; 46
	command sleeptalk               ; 47
	command destinybond             ; 48
	command spite                   ; 49
	command falseswipe              ; 4a
	command healbell                ; 4b
	command kingsrock               ; 4c
	command triplekick              ; 4d
	command kickcounter             ; 4e
	command thief                   ; 4f
	command arenatrap               ; 50
	command nightmare               ; 51
	command defrost                 ; 52
	command curse                   ; 53
	command protect                 ; 54
	command spikes                  ; 55
	command foresight               ; 56
	command perishsong              ; 57
	command startsandstorm          ; 58
	command endure                  ; 59
	command checkrollout            ; 5a
	command rolloutpower            ; 5b
	command effect0x5d              ; 5c
	command furycutter              ; 5d
	command attract                 ; 5e
	command happinesspower          ; 5f
	command present                 ; 60
	command damagecalc              ; 61
	command frustrationpower        ; 62
	command safeguard               ; 63
	command checksafeguard          ; 64
	command getmagnitude            ; 65
	command batonpass               ; 66
	command pursuit                 ; 67
	command clearhazards            ; 68
	command healmorn                ; 69
	command healday                 ; 6a
	command healnite                ; 6b
	command hiddenpower             ; 6c
	command startrain               ; 6d
	command startsun                ; 6e
	command attackup                ; 6f
	command defenseup               ; 70
	command speedup                 ; 71
	command specialattackup         ; 72
	command specialdefenseup        ; 73
	command accuracyup              ; 74
	command evasionup               ; 75
	command attackup2               ; 76
	command defenseup2              ; 77
	command speedup2                ; 78
	command specialattackup2        ; 79
	command specialdefenseup2       ; 7a
	command accuracyup2             ; 7b
	command evasionup2              ; 7c
	command attackdown              ; 7d
	command defensedown             ; 7e
	command speeddown               ; 7f
	command specialattackdown       ; 80
	command specialdefensedown      ; 81
	command accuracydown            ; 82
	command evasiondown             ; 83
	command attackdown2             ; 84
	command defensedown2            ; 85
	command speeddown2              ; 86
	command specialattackdown2      ; 87
	command specialdefensedown2     ; 88
	command accuracydown2           ; 89
	command evasiondown2            ; 8a
	command statupmessage           ; 8b
	command statdownmessage         ; 8c
	command statupfailtext          ; 8d
	command statdownfailtext        ; 8e
	command effectchance            ; 8f
	command statdownanim            ; 90
	command statupanim              ; 91
	command switchturn              ; 92
	command fakeout                 ; 93
	command bellydrum               ; 94
	command psychup                 ; 95
	command rage                    ; 96
	command doubleflyingdamage      ; 97
	command doubleundergrounddamage ; 98
	command mirrorcoat              ; 99
	command checkfuturesight        ; 9a
	command futuresight             ; 9b
	command doubleminimizedamage    ; 9c
	command skipsuncharge           ; 9d
	command thunderaccuracy         ; 9e
	command teleport                ; 9f
	command beatup                  ; a0
	command ragedamage              ; a1
	command resettypematchup        ; a2
	command allstatsup              ; a3
	command bidefailtext            ; a4
	command raisesubnoanim          ; a5
	command lowersubnoanim          ; a6
	command beatupfailtext          ; a7
	command clearmissdamage         ; a8
	command movedelay               ; a9
	command moveanim                ; aa
	command tristatuschance         ; ab
	command supereffectivelooptext  ; ac
	command startloop               ; ad
	command curl                    ; ae
DEF NUM_EFFECT_COMMANDS EQU const_value - 1

	const_def -1, -1
	command endmove                 ; ff
	command endturn                 ; fe
