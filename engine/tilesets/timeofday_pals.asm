UpdateTimeOfDayPal::
	call UpdateTime
	ld a, [wTimeOfDay]
	ld [wCurTimeOfDay], a
	call GetTimePalette
	ld [wTimeOfDayPal], a
	ret

_TimeOfDayPals::
; return carry if pals are changed
	ld hl, wTimeOfDayPalFlags
	bit FORCED_PALSET_F, [hl] ; forced pals?
	jr nz, .dontchange
	; do we need to bother updating?
	ld a, [wTimeOfDay]
	ld hl, wCurTimeOfDay
	cp [hl]
	jr z, .dontchange
	; if so, the time of day has changed
	ld a, [wTimeOfDay]
	ld [wCurTimeOfDay], a
	; get palette id
	call GetTimePalette
	; same palette as before?
	ld hl, wTimeOfDayPal
	cp [hl]
	jr z, .dontchange
	; update palette id
	ld [wTimeOfDayPal], a
	; save bg palette 7
	ld hl, wBGPals1 palette PAL_BG_TEXT
	; save wram bank
	ldh a, [rWBK]
	ld b, a
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	; push palette
	ld c, PAL_COLORS
.push
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	push de
	dec c
	jr nz, .push
	; restore wram bank
	ld a, b
	ldh [rWBK], a
	; update sgb pals
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	; restore bg palette 7
	ld hl, wOBPals1 - 1 ; last byte in wBGPals1
	; save wram bank
	ldh a, [rWBK]
	ld d, a
	ld a, BANK(wOBPals1)
	ldh [rWBK], a
	; pop palette
	ld e, PAL_COLORS
.pop
	pop bc
	ld [hl], c
	dec hl
	ld [hl], b
	dec hl
	dec e
	jr nz, .pop
	; restore wram bank
	ld a, d
	ldh [rWBK], a
	; update palettes
	call _UpdateTimePals
	call DelayFrame
	; successful change
	scf
	ret
.dontchange
	; no change occurred
	and a
	ret

_UpdateTimePals::
	ld c, $9 ; normal
	call GetTimePalFade
	jp DmgToCgbTimePals

FadeInFromWhite::
	ld c, $12
	call GetTimePalFade
	ld b, $4
	jp ConvertTimePalsDecHL

FadeOutToWhite::
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
	jp ConvertTimePalsIncHL

BattleTowerFade:
	call FillWhiteBGColor
	ld c, $9
	call GetTimePalFade
	ld b, $4
.loop
	call DmgToCgbTimePals
	inc hl
	inc hl
	inc hl
	ld c, $7
	call DelayFrames
	dec b
	jr nz, .loop
	ret

FadeInFromBlack:
	ld c, $0
	call GetTimePalFade
	ld b, $4
	jp ConvertTimePalsIncHL

FadeOutToBlack:
	ld c, $9
	call GetTimePalFade
	ld b, $4
	jp ConvertTimePalsDecHL

FillWhiteBGColor:
; Copy white palette of wBGPals1 Pal0
; into white palette of wBGPals1 Pal1-Pal6
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rWBK], a
	ld hl, wBGPals1
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld hl, wBGPals1 palette 1 color 0
	ld c, 6
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
rept 3 colors
	inc hl
endr
	dec c
	jr nz, .loop
	pop af
	ldh [rWBK], a
	ret

ReplaceTimeOfDayPals:
	ld a, [wMapTimeOfDay]
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr nz, .not_dark
	ld a, DARKNESS_PALSET
.done:
 	ld [wTimeOfDayPalset], a
 	ret
.not_dark:
	ld hl, .BrightnessLevels
	ld a, [wMapTimeOfDay]
	maskbits NUM_MAP_PALETTES
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	jr .done
.BrightnessLevels:
; actual palettes used when time is
;      EVN_F   NITE_F  DAY_F   MORN_F
; -----------------------------------
	dc EVN_F,  NITE_F, DAY_F,  MORN_F ; PALETTE_AUTO
	dc DAY_F,  DAY_F,  DAY_F,  DAY_F  ; PALETTE_DAY
	dc NITE_F, NITE_F, NITE_F, NITE_F ; PALETTE_NITE
	dc MORN_F, MORN_F, MORN_F, MORN_F ; PALETTE_MORN
	dc EVN_F,  EVN_F,  EVN_F,  EVN_F  ; PALETTE_EVN

GetTimePalette:
	jumptable .TimePalettes, wTimeOfDay
.TimePalettes:
	dw .MorningPalette ; MORN_F
	dw .DayPalette     ; DAY_F
	dw .NitePalette    ; NITE_F
	dw .EveningPalette ; EVN_F
.MorningPalette:
	ld a, [wTimeOfDayPalset]
	and %00000011
	ret
.DayPalette:
	ld a, [wTimeOfDayPalset]
	and %00001100
	srl a
	srl a
	ret
.NitePalette:
	ld a, [wTimeOfDayPalset]
	and %00110000
	swap a
	ret
.EveningPalette:
	ld a, [wTimeOfDayPalset]
	and %11000000
	rlca
	rlca
	ret

DmgToCgbTimePals:
	push hl
	push de
	ld a, [hli]
	call DmgToCgbBGPals
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	call DmgToCgbObjPals
	pop de
	pop hl
	ret

ConvertTimePalsIncHL:
.loop
	call DmgToCgbTimePals
	inc hl
	inc hl
	inc hl
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret

ConvertTimePalsDecHL:
.loop
	call DmgToCgbTimePals
	dec hl
	dec hl
	dec hl
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ret

GetTimePalFade:
; assume cgb
	ld hl, .cgbfade
	ld b, 0
	add hl, bc
	ret
.cgbfade
	dc 3,3,3,3, 3,3,3,3, 3,3,3,3
	dc 3,3,3,2, 3,3,3,2, 3,3,3,2
	dc 3,3,2,1, 3,3,2,1, 3,3,2,1
	dc 3,2,1,0, 3,2,1,0, 3,2,1,0
	dc 2,1,0,0, 2,1,0,0, 2,1,0,0
	dc 1,0,0,0, 1,0,0,0, 1,0,0,0
	dc 0,0,0,0, 0,0,0,0, 0,0,0,0
