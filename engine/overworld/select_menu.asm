SelectMenu::
	call CheckRegisteredItem
	jr c, .NotRegistered
	jp UseRegisteredItem
.NotRegistered:
	call OpenText
	ld b, BANK(MayRegisterItemText)
	ld hl, MayRegisterItemText
	call MapTextbox
	call WaitButton
	jp CloseText

MayRegisterItemText:
	text_far _MayRegisterItemText
	text_end

CheckRegisteredItem:
	ld a, [wWhichRegisteredItem]
	and a
	jr z, .NoRegisteredItem
	and REGISTERED_POCKET
	rlca
	rlca
	ld hl, .Pockets
	rst JumpTable
	ret
.Pockets:
; entries correspond to *_POCKET constants
	dw .CheckItem
	dw .CheckBall
	dw .CheckKeyItem
	dw .CheckTMHM
	dw .CheckBerry
.CheckItem:
	ld hl, wNumItems
	call .CheckRegisteredNo
	jr c, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	and a
	ret
.CheckKeyItem:
	ld a, [wRegisteredItem]
	ld hl, wKeyItems
	ld de, 1
	call IsInArray
	jr nc, .NoRegisteredItem
	ld a, [wRegisteredItem]
	ld [wCurItem], a
	and a
	ret
.CheckBall:
	ld hl, wNumBalls
	jr .StandardCheck
.CheckBerry:
	ld hl, wNumBerries
.StandardCheck:
	call .CheckRegisteredNo
	jr nc, .NoRegisteredItem
	inc hl
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	call .IsSameItem
	jr c, .NoRegisteredItem
	ret
.CheckTMHM:
.NoRegisteredItem:
	xor a
	ld [wWhichRegisteredItem], a
	ld [wRegisteredItem], a
.NotEnoughItems:
.NotSameItem:
	scf
	ret
.CheckRegisteredNo:
	ld a, [wWhichRegisteredItem]
	and REGISTERED_NUMBER
	dec a
	cp [hl]
	jr nc, .NotEnoughItems
	ld [wCurItemQuantity], a
	and a
	ret
.IsSameItem:
	ld a, [wRegisteredItem]
	cp [hl]
	jr nz, .NotSameItem
	ld [wCurItem], a
	and a
	ret

UseRegisteredItem:
	farcall CheckItemMenu
	ld a, [wItemAttributeValue]
	ld hl, .SwitchTo
	rst JumpTable
	ret
.SwitchTo:
; entries correspond to ITEMMENU_* constants
	dw .NoUse
	dw .Current
	dw .Party
	dw .Overworld
.Current:
	call OpenText
	call DoItemEffect
	call CloseText
	and a
	ret
.Party:
	call ReanchorMap
	call FadeToMenu
	call DoItemEffect
	call CloseSubmenu
	call CloseText
	and a
	ret
.Overworld:
	call ReanchorMap
	ld a, 1
	ld [wUsingItemWithSelect], a
	call DoItemEffect
	xor a
	ld [wUsingItemWithSelect], a
	ld a, [wItemEffectSucceeded]
	cp 1
	jr nz, .cantuse
	scf
	ld a, HMENURETURN_SCRIPT
	ldh [hMenuReturn], a
	ret
.NoUse:
	call ReanchorMap
.cantuse
	call CantUseItem
	call CloseText
	and a
	ret
