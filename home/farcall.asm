FarCall_de::
; Call a:de.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	push de
	jr ReturnFarCall

FarCall_hl::
; Call a:hl.
; Preserves other registers.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	rst CallHL
	; fallthrough
ReturnFarCall::
; We want to retain the contents of f.
; To do this, we can pop to bc instead of af.
	ld a, b
	ld [wFarCallBC], a
	ld a, c
	ld [wFarCallBC + 1], a
	; Restore the working bank.
	pop bc
	ld a, b
	rst Bankswitch
	; Restore the contents of bc.
	ld a, [wFarCallBC]
	ld b, a
	ld a, [wFarCallBC + 1]
	ld c, a
	ret
