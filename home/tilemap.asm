ClearBGPalettes::
	call ClearPalettes
	; fallthrough
WaitBGMap::
	; Tell VBlank to update BG Map
	ld a, 1 ; BG Map 0 tiles
	ldh [hBGMapMode], a
	; Wait for it to do its magic
	ld c, 4
	jp DelayFrames

WaitBGMap2::
	rst IsCGB
	jr z, WaitBGMap
	ld a, 2
	ldh [hBGMapMode], a
	ld c, 4
	call DelayFrames
	jr WaitBGMap

ApplyTilemap::
	rst IsCGB
	jr z, WaitBGMap
	ld a, [wSpriteUpdatesEnabled]
	cp FALSE
	jr z, WaitBGMap
	ld a, 1
	ldh [hBGMapMode], a
	jr CopyTilemapAtOnce

CGBOnly_CopyTilemapAtOnce::
	rst IsCGB
	jr z, WaitBGMap
	; wait for [rLY] to be $80 - 1
	ld a, $80 - 1
	ldh [hCopyTilemapAtOnceWait], a
	; fallthrough
CopyTilemapAtOnce::
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	ldh a, [hCopyTilemapAtOnceWait]
	ld b, a
.wait
	ldh a, [rLY]
	cp b
	jr c, .wait
	di
	ld a, BANK(vBGMap2)
	ldh [rVBK], a
	hlcoord 0, 0, wAttrmap
	call .CopyBGMapViaStack
	ld a, BANK(vBGMap0)
	ldh [rVBK], a
	hlcoord 0, 0
	call .CopyBGMapViaStack
	ldh a, [hCopyTilemapAtOnceWait]
	ld b, a
.wait2
	ldh a, [rLY]
	cp b
	jr c, .wait2
	ei
	pop af
	ldh [hMapAnims], a
	pop af
	ldh [hBGMapMode], a
	ret
.CopyBGMapViaStack:
; Copy all tiles to vBGMap
	ld [hSPBuffer], sp
	ld sp, hl
	ldh a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ldh [hTilesPerCycle], a
	ld b, STAT_BUSY
	ld c, LOW(rSTAT)
.loop
rept SCREEN_WIDTH / 2
	pop de
	; if in v/hblank, wait until not in v/hblank
.loop\@
	ldh a, [c]
	and b
	jr nz, .loop\@
	; load vBGMap
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr
	ld de, TILEMAP_WIDTH - SCREEN_WIDTH
	add hl, de
	ldh a, [hTilesPerCycle]
	dec a
	ldh [hTilesPerCycle], a
	jr nz, .loop
	ldh a, [hSPBuffer]
	ld l, a
	ldh a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret

SetDefaultBGPAndOBP::
; Inits the Palettes
; depending on the system the monochromes palettes or color palettes
	rst IsCGB
	jr nz, .SetDefaultBGPAndOBPForGameBoyColor
	ld a, %11100100
	ldh [rBGP], a
	ld a, %11010000
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret
.SetDefaultBGPAndOBPForGameBoyColor:
	push de
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
	call DmgToCgbObjPals
	pop de
	ret

ClearPalettes::
; Make all palettes white
	; CGB: make all the palette colors white
	rst IsCGB
	jr nz, .cgb
	; DMG: just change palettes to 0 (white)
	xor a
	ldh [rBGP], a
	ldh [rOBP0], a
	ldh [rOBP1], a
	ret
.cgb
	ldh a, [rWBK]
	push af
	ld a, BANK(wBGPals2)
	ldh [rWBK], a
	; Fill wBGPals2 and wOBPals2 with $ffff (white)
	ld hl, wBGPals2
	ld bc, 16 palettes
	ld a, $ff
	call ByteFill
	pop af
	ldh [rWBK], a
	; Request palette update
	ld a, TRUE
	ldh [hCGBPalUpdate], a
	ret

GetMemSGBLayout::
	ld b, SCGB_DEFAULT
	; fallthrough
GetSGBLayout::
; load sgb packets unless dmg
	rst IsCGB
	jr nz, .sgb
	ldh a, [hSGB]
	and a
	ret z
.sgb
	predef_jump LoadSGBLayout

SetHPPal::
; Set palette for hp bar pixel length e at hl.
	call GetHPPal
	ld [hl], d
	ret

GetHPPal::
; Get palette for hp bar pixel length e in d.
	ld d, HP_GREEN
	ld a, e
	cp (HP_BAR_LENGTH_PX * 50 / 100) ; 24
	ret nc
	assert HP_GREEN + 1 == HP_YELLOW
	inc d
	cp (HP_BAR_LENGTH_PX * 21 / 100) ; 10
	ret nc
	assert HP_YELLOW + 1 == HP_RED
	inc d
	ret

LoadTilemapToTempTilemap::
; Load wTilemap into wTempTilemap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rSVBK], a
	hlcoord 0, 0
	decoord 0, 0, wTempTilemap
	ld bc, wTilemapEnd - wTilemap
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

SafeLoadTempTilemapToTilemap::
	xor a
	ldh [hBGMapMode], a
	call LoadTempTilemapToTilemap
	ld a, 1
	ldh [hBGMapMode], a
	ret

LoadTempTilemapToTilemap::
; Load wTempTilemap into wTilemap
	ldh a, [rSVBK]
	push af
	ld a, BANK(wTempTilemap)
	ldh [rSVBK], a
	hlcoord 0, 0, wTempTilemap
	decoord 0, 0
	ld bc, wTilemapEnd - wTilemap
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret
