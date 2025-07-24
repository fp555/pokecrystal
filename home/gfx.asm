DEF TILES_PER_CYCLE EQU 8
DEF MOBILE_TILES_PER_CYCLE EQU 6

Get2bppViaHDMA::
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jp z, Copy2bpp
	homecall HDMATransfer2bpp
	ret

Get1bppViaHDMA::
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jp z, Copy1bpp
	homecall HDMATransfer1bpp
	ret

UpdatePlayerSprite::
	farcall _UpdatePlayerSprite
	ret

LoadStandardFont::
	farcall _LoadStandardFont
	ret

LoadFontsBattleExtra::
	farcall _LoadFontsBattleExtra
	ret

LoadFrame::
	farcall _LoadFrame
	ret

DecompressRequest2bpp::
; Load compressed 2bpp at b:hl to occupy c tiles of de.
	push de
	ld a, BANK(sScratch)
	call OpenSRAM
	push bc
	ld de, sScratch
	ld a, b
	call FarDecompress
	pop bc
	pop hl
	ld de, sScratch
	call Request2bpp
	jp CloseSRAM

Request2bpp::
; Load 2bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	ldh a, [hTilesPerCycle]
	push af
	ld a, TILES_PER_CYCLE
	ldh [hTilesPerCycle], a
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .NotMobile
	ldh a, [hMobile]
	and a
	jr nz, .NotMobile
	ld a, MOBILE_TILES_PER_CYCLE
	ldh [hTilesPerCycle], a
.NotMobile:
	ld a, e
	ld [wRequested2bppSource], a
	ld a, d
	ld [wRequested2bppSource + 1], a
	ld a, l
	ld [wRequested2bppDest], a
	ld a, h
	ld [wRequested2bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .cycle
	ld [wRequested2bppSize], a
.wait
	call DelayFrame
	ld a, [wRequested2bppSize]
	and a
	jr nz, .wait
	pop af
	ldh [hTilesPerCycle], a
	pop af
	rst Bankswitch
	pop af
	ldh [hBGMapMode], a
	ret
.cycle
	ldh a, [hTilesPerCycle]
	ld [wRequested2bppSize], a
.wait2
	call DelayFrame
	ld a, [wRequested2bppSize]
	and a
	jr nz, .wait2
	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop

Request1bpp::
; Load 1bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch
	ldh a, [hTilesPerCycle]
	push af
	ld a, TILES_PER_CYCLE
	ldh [hTilesPerCycle], a
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .NotMobile
	ldh a, [hMobile]
	and a
	jr nz, .NotMobile
	ld a, MOBILE_TILES_PER_CYCLE
	ldh [hTilesPerCycle], a
.NotMobile:
	ld a, e
	ld [wRequested1bppSource], a
	ld a, d
	ld [wRequested1bppSource + 1], a
	ld a, l
	ld [wRequested1bppDest], a
	ld a, h
	ld [wRequested1bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .cycle
	ld [wRequested1bppSize], a
.wait
	call DelayFrame
	ld a, [wRequested1bppSize]
	and a
	jr nz, .wait
	pop af
	ldh [hTilesPerCycle], a
	pop af
	rst Bankswitch
	pop af
	ldh [hBGMapMode], a
	ret
.cycle
	ldh a, [hTilesPerCycle]
	ld [wRequested1bppSize], a
.wait2
	call DelayFrame
	ld a, [wRequested1bppSize]
	and a
	jr nz, .wait2
	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop

Get2bpp::
; copy c 2bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jp nz, Request2bpp
	; fallthrough
Copy2bpp:
	push hl
	ld h, d
	ld l, e
	pop de
	; bank
	ld a, b
	; bc = c * TILE_SIZE
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af
	jp FarCopyBytes

Get1bpp::
; copy c 1bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit B_LCDC_ENABLE, a
	jp nz, Request1bpp
	; fallthrough
Copy1bpp::
	push de
	ld d, h
	ld e, l
	; bank
	ld a, b
	; bc = c * TILE_1BPP_SIZE
	push af
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af
	pop hl
	jp FarCopyBytesDouble
