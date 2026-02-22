DEF MEMORYGAME_COIN_PRICE EQU 3
DEF MEMORYGAME_NUM_TRIES EQU 5

_MemoryGame:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	; LoadGFXAndPals
	call DisableLCD
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	callfar ClearSpriteAnims
	ld hl, MemoryGameLZ
	ld de, vTiles2 tile $00
	call Decompress
	ld hl, MemoryGameCursorGFX
	ld de, vTiles0 tile $00
	ld bc, 4 tiles
	call CopyBytes
	ld a, SPRITE_ANIM_DICT_ARROW_CURSOR
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $00
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	xor a
	call ByteFill
	xor a
	ldh [hSCY], a
	ldh [hSCX], a
	ldh [rWY], a
	ld [wJumptableIndex], a
	ld a, $1
	ldh [hBGMapMode], a
	ld a, LCDC_DEFAULT
	ldh [rLCDC], a
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $e0
	call DmgToCgbObjPal0
	call DelayFrame
.JumptableLoop
	ld a, [wJumptableIndex]
	bit JUMPTABLE_EXIT_F, a
	jr nz, .quit
	call .ExecuteJumptable ; do not optimize this call
	callfar PlaySpriteAnimations
	call DelayFrame
	jr .JumptableLoop
.quit
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	ld hl, wOptions
	res NO_TEXT_SCROLL, [hl]
	ret
.ExecuteJumptable:
	jumptable .Jumptable, wJumptableIndex
.Jumptable:
	dw MemoryGame_RestartGame
	dw MemoryGame_ResetBoard
	dw MemoryGame_CheckTriesRemaining
	dw MemoryGame_PickCards
	dw MemoryGame_DelayPickAgain
	dw MemoryGame_RevealAll

MemoryGame_RestartGame:
	ld hl, .PlayWithThreeCoinsText
	call PrintText
	call CardFlip_PrintCoinBalance ; same bank
	call YesNoBox
	jr c, .NotPlaying
	; DeductCoins
	ld hl, wCoins
	ld a, [hli]
	ld l, [hl]
	ld h, a
	and a
	jr nz, .deduct ; You have at least 256 coins.
	ld a, l
	cp MEMORYGAME_COIN_PRICE
	jr nc, .deduct ; You have at least 3 coins.
	ld hl, .NotEnoughCoinsText
	call PrintText
.NotPlaying
	ld hl, wJumptableIndex
	set JUMPTABLE_EXIT_F, [hl]
	ret
.deduct
	ld de, -MEMORYGAME_COIN_PRICE
	add hl, de
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call CardFlip_PrintCoinBalance ; same bank
	call WaitSFX
	; MemoryGame_InitStrings
	hlcoord 0, 0
	ld bc, SCREEN_AREA
	ld a, $1
	call ByteFill
	hlcoord 0, 0
	ld de, .score_string
	call PlaceString
	hlcoord 13, 0
	ld de, .tries_string
	call PlaceString
	ld hl, wJumptableIndex
	inc [hl] ; ResetBoard
	ret
.score_string
	db "SCORE@"
.tries_string
	db "TRIES@"
.PlayWithThreeCoinsText:
	text_far _CardFlipPlayWithThreeCoinsText
	text_end
.NotEnoughCoinsText:
	text_far _CardFlipNotEnoughCoinsText
	text_end

MemoryGame_ResetBoard:
	ld de, SFX_SLOT_MACHINE_START
	call PlaySFX
	; InitBoard
	ld hl, wMemoryGameCards
	ld bc, wMemoryGameCardsEnd - wMemoryGameCards
	xor a
	call ByteFill
	call MemoryGame_GetDistributionOfTiles
	ld c, 2
	ld b, [hl]
	call MemoryGame_SampleTilePlacement
	ld c, 8
	ld b, [hl]
	call MemoryGame_SampleTilePlacement
	ld c, 4
	ld b, [hl]
	call MemoryGame_SampleTilePlacement
	ld c, 7
	ld b, [hl]
	call MemoryGame_SampleTilePlacement
	ld c, 3
	ld b, [hl]
	call MemoryGame_SampleTilePlacement
	ld c, 6
	ld b, [hl]
	call MemoryGame_SampleTilePlacement
	ld c, 1
	ld b, [hl]
	call MemoryGame_SampleTilePlacement
	ld c, 5
	ld hl, wMemoryGameCards
	ld b, wMemoryGameCardsEnd - wMemoryGameCards
.loop
	ld a, [hl]
	and a
	jr nz, .no_load
	ld [hl], c
.no_load
	inc hl
	dec b
	jr nz, .loop
	; end InitBoard
	xor a
	ld [wMemoryGameCounter], a
	ld hl, wMemoryGameLastMatches
rept 4
	ld [hli], a
endr
	ld [hl], a
	ld [wMemoryGameNumCardsMatched], a
	; InitBoardTilemapAndCursorObject
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .spawn_object
	inc [hl]
	call MemoryGame_Card2Coord
	xor a
	ld [wMemoryGameLastCardPicked], a
	jp MemoryGame_PlaceCard
.spawn_object
	depixel 6, 3, 4, 4
	ld a, SPRITE_ANIM_OBJ_MEMORY_GAME_CURSOR
	call InitSpriteAnimStruct
	ld a, MEMORYGAME_NUM_TRIES
	ld [wMemoryGameNumberTriesRemaining], a
	ld hl, wJumptableIndex
	inc [hl] ; CheckTriesRemaining
	ret

MemoryGame_CheckTriesRemaining:
	ld a, [wMemoryGameNumberTriesRemaining]
	hlcoord 19, 0
	add '0'
	ld [hl], a
	ld hl, wMemoryGameNumberTriesRemaining
	ld a, [hl]
	and a
	jr nz, .next_try
	ld hl, .MemoryGameGameOverText
	call PrintText
	ld a, $5 ; RevealAll
	ld [wJumptableIndex], a
	ret
.next_try
	push hl
	ld hl, .ChooseACardText
	call PrintText
	pop hl
	dec [hl]
	xor a
	ld [wMemoryGameCardChoice], a
	ld hl, wJumptableIndex
	inc [hl] ; PickCards
	ret
.MemoryGameGameOverText:
	text_far _MemoryGameGameOverText
	text_end
.ChooseACardText:
	text_far _CardFlipChooseACardText
	text_end

MemoryGame_PickCards:
	; PickCard1
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard1], a
	ld a, e
	ld [wMemoryGameCard1Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	xor a
	ld [wMemoryGameCardChoice], a
	ld de, SFX_STOP_SLOT
	call PlaySFX
	; PickCard2
	ld a, [wMemoryGameCardChoice]
	and a
	ret z
	dec a
	ld hl, wMemoryGameCard1Location
	cp [hl]
	ret z
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld [wMemoryGameLastCardPicked], a
	ld [wMemoryGameCard2], a
	ld a, e
	ld [wMemoryGameCard2Location], a
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	ld a, 64
	ld [wMemoryGameCounter], a
	ld de, SFX_STOP_SLOT
	call PlaySFX
	ld hl, wJumptableIndex
	inc [hl] ; DelayPickAgain
	ret

MemoryGame_DelayPickAgain:
	ld hl, wMemoryGameCounter
	ld a, [hl]
	and a
	jr z, .CheckMatch
	dec [hl]
	ret
.CheckMatch
	ld hl, wMemoryGameCard1
	ld a, [hli]
	cp [hl]
	jr nz, .no_match
	; don't deduct a try for a match
	ld hl, wMemoryGameNumberTriesRemaining
	inc [hl]
	ld hl, .VictoryText
	call PrintText
	ld de, SFX_3RD_PLACE
	call PlaySFX
	call WaitSFX
	call WaitPressAorB_BlinkCursor
	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard
	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	call MemoryGame_DeleteCard
	ld a, [wMemoryGameCard1Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1
	ld a, [wMemoryGameCard2Location]
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld [hl], -1
	ld a, [wMemoryGameCard2]
	ld [wMemoryGameLastCardPicked], a
	ld hl, wMemoryGameNumCardsMatched
	inc [hl]
	inc [hl]
.done
	ld a, $2 ; CheckTriesRemaining
	ld [wJumptableIndex], a
	ret
.no_match
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, .MemoryGameDarnText
	call PrintText
	call WaitPressAorB_BlinkCursor
	xor a
	ld [wMemoryGameLastCardPicked], a
	ld a, [wMemoryGameCard1Location]
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	ld a, [wMemoryGameCard2Location]
	call MemoryGame_Card2Coord
	call MemoryGame_PlaceCard
	jr .done
.VictoryText:
	text_asm
	push bc
	hlcoord 2, 13
	call MemoryGame_PlaceCard
	ld hl, .MemoryGameMatchedText
	pop bc
	inc bc
	inc bc
	inc bc
	ret
.MemoryGameMatchedText:
	text_far _MemoryGameMatchedText
	text_end
.MemoryGameDarnText:
	text_far _MemoryGameDarnText
	text_end

MemoryGame_RevealAll:
	xor a
	ld [wMemoryGameCounter], a
.RevelationLoop
	ld hl, wMemoryGameCounter
	ld a, [hl]
	cp 45
	jr nc, .finish_round
	inc [hl]
	push af
	call MemoryGame_Card2Coord
	pop af
	push hl
	ld e, a
	ld d, 0
	ld hl, wMemoryGameCards
	add hl, de
	ld a, [hl]
	pop hl
	cp -1
	jr z, .RevelationLoop
	ld [wMemoryGameLastCardPicked], a
	call MemoryGame_PlaceCard
	jr .RevelationLoop
.finish_round
	call WaitPressAorB_BlinkCursor
	xor a ; RestartGame
	ld [wJumptableIndex], a
	ret

MemoryGame_SampleTilePlacement:
	push hl
	ld de, wMemoryGameCards
.loop
	call Random
	and %00111111
	cp 45
	jr nc, .loop
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .loop
	ld [hl], c
	dec c
	jr nz, .loop
	pop hl
	inc hl
	ret

MemoryGame_GetDistributionOfTiles:
	ld a, [wMenuCursorY]
	dec a
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, .distributions
	add hl, de
	ret
.distributions
	db $02, $03, $06, $06, $06, $08, $08, $06
	db $02, $02, $04, $06, $06, $08, $08, $09
	db $02, $02, $02, $04, $07, $08, $08, $0c

MemoryGame_PlaceCard:
	ld a, [wMemoryGameLastCardPicked]
	sla a
	sla a
	add 4
	ld [hli], a
	inc a
	ld [hld], a
	inc a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	inc a
	ld [hl], a
	ld c, 3
	jp DelayFrames

MemoryGame_DeleteCard:
	ld a, $1
	ld [hli], a
	ld [hld], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hli], a
	ld [hl], a
	ld c, 3
	jp DelayFrames

MemoryGame_Card2Coord:
	ld d, 0
.find_row
	sub 9
	jr c, .found_row
	inc d
	jr .find_row
.found_row
	add 9
	ld e, a
	hlcoord 1, 2
	ld bc, 2 * SCREEN_WIDTH
.loop2
	ld a, d
	and a
	jr z, .done
	add hl, bc
	dec d
	jr .loop2
.done
	sla e
	add hl, de
	ret

MemoryGame_InterpretJoypad_AnimateCursor:
	ld a, [wJumptableIndex]
	cp $2 ; CheckTriesRemaining
	jr c, .quit ; RestartGame, ResetBoard
	cp $4 ; DelayPickAgain
	ret z
	jr nc, .quit ; RevealAll
	call JoyTextDelay
	ld hl, hJoypadPressed
	ld a, [hl]
	and PAD_A
	jr nz, .pressed_a
	ld a, [hl]
	and PAD_LEFT
	jr nz, .pressed_left
	ld a, [hl]
	and PAD_RIGHT
	jr nz, .pressed_right
	ld a, [hl]
	and PAD_UP
	jr nz, .pressed_up
	ld a, [hl]
	and PAD_DOWN
	jr nz, .pressed_down
	ret
.quit
	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld [hl], $0
	ret
.pressed_a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	inc a
	ld [wMemoryGameCardChoice], a
	ret
.pressed_left
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	dec [hl]
	jr .play_movement_sound
.pressed_right
	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld a, [hl]
	cp (9 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	inc [hl]
	jr .play_movement_sound
.pressed_up
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	and a
	ret z
	sub 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	sub 9
	ld [hl], a
	jr .play_movement_sound
.pressed_down
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, [hl]
	cp (5 - 1) tiles
	ret z
	add 1 tiles
	ld [hl], a
	ld hl, SPRITEANIMSTRUCT_VAR1
	add hl, bc
	ld a, [hl]
	add 9
	ld [hl], a
.play_movement_sound
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	jp PlaySFX

MemoryGameLZ:
INCBIN "gfx/memory_game/memory_game.2bpp.lz"

MemoryGameCursorGFX:
INCBIN "gfx/memory_game/pointer.2bpp"
