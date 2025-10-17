LoadPoisonBGPals:
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a
	ld hl, wBGPals2
	ld c, 4 palettes
.loop
	ld a, LOW(palred 28 + palgreen 21 + palblue 31)
	ld [hli], a
	ld a, HIGH(palred 28 + palgreen 21 + palblue 31)
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ldh [rWBK], a
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	farcall _UpdateTimePals
	ret
