BattleIntroSlidingPics:
	ldh a, [rWBK]
	push af
	ld a, BANK(wLYOverrides)
	ldh [rWBK], a
	ld hl, wLYOverrides
	ld a, $90
	ld bc, SCREEN_HEIGHT_PX
	call ByteFill
	ld a, $90
	ldh [hSCX], a
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals	
	ld a, LOW(rSCX)
	ldh [hLCDCPointer], a
	ld d, $90
	ld e, $72
	ld a, $48
	inc a
.loop1
	push af
.loop2
	ldh a, [rLY]
	cp $60
	jr c, .loop2
	ld a, d
	ldh [hSCX], a
	; .subfunction5
	ld hl, wLYOverrides
	ld a, d
	ld c, $3e ; 62
.loop3
	ld [hli], a
	dec c
	jr nz, .loop3
	ld a, e
	ld c, $22 ; 34
.loop4
	ld [hli], a
	dec c
	jr nz, .loop4
	xor a
	ld c, $30 ; 48
.loop5
	ld [hli], a
	dec c
	jr nz, .loop5	
	inc e
	inc e
	dec d
	dec d
	pop af
	push af
	cp $1
	jr z, .skip1
	push de
	ld hl, wShadowOAMSprite00XCoord
	ld c, $12 ; 18
	ld de, OBJ_SIZE
.loop6
	dec [hl]
	dec [hl]
	add hl, de
	dec c
	jr nz, .loop6
	pop de
.skip1
	call DelayFrame
	pop af
	dec a
	jr nz, .loop1
	xor a
	ldh [hLCDCPointer], a
	pop af
	ldh [rWBK], a
	ret
