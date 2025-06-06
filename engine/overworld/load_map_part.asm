_LoadOverworldTilemap::
; From the metatile-based 24x20 map in wSurroundingTiles,
; load the corresponding 20x18 tiles to wTilemap.
; Also initializes wSurroundingAttributes in the same way.
; This function is only used for the initial loading of the map; incremental
; loads while moving happen through UpdateBGMapRow and UpdateBGMapColumn.
	ld hl, wSurroundingTiles
	decoord 0, 0
	call .copy
	ld hl, wSurroundingAttributes
	decoord 0, 0, wAttrmap
.copy
	ld a, [wPlayerMetatileY]
	and a
	jr z, .top_row
	ld bc, SURROUNDING_WIDTH * 2
	add hl, bc
.top_row
	ld a, [wPlayerMetatileX]
	and a
	jr z, .left_column
	inc hl
	inc hl
.left_column
	ldh a, [rSVBK]
	push af
	ld a, BANK("Surrounding Data")
	ldh [rSVBK], a
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add METATILE_WIDTH
	ld l, a
	jr nc, .carry
	inc h
.carry
	dec b
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ret
