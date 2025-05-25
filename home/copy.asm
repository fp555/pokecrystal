CopyBytes::
; copy bc bytes from hl to de
	inc b ; we bail the moment b hits 0, so include the last run
	inc c ; same thing; include last byte
	jr .HandleLoop
.CopyByte:
	ld a, [hli]
	ld [de], a
	inc de
.HandleLoop:
	dec c
	jr nz, .CopyByte
	dec b
	jr nz, .CopyByte
	ret

SwapBytes::
; swap bc bytes between hl and de
.Loop:
	; stash [hl] away on the stack
	ld a, [hl]
	push af
	; copy a byte from [de] to [hl]
	ld a, [de]
	ld [hli], a
	; retrieve the previous value of [hl]; put it in [de]
	pop af
	ld [de], a
	inc de
	; handle loop stuff
	dec bc
	ld a, b
	or c
	jr nz, .Loop
	ret

ByteFill::
; fill bc bytes with the value of a, starting at hl
	inc b ; we bail the moment b hits 0, so include the last run
	inc c ; same thing; include last byte
	jr .HandleLoop
.PutByte:
	ld [hli], a
.HandleLoop:
	dec c
	jr nz, .PutByte
	dec b
	jr nz, .PutByte
	ret

GetFarByte::
; retrieve a single byte from a:hl, and return it in a.
	; bankswitch to new bank
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	; get byte from new bank
	ld a, [hl]
	ldh [hFarByte], a
	; bankswitch to previous bank
	pop af
	rst Bankswitch
	; return retrieved value in a
	ldh a, [hFarByte]
	ret

GetFarWord::
; retrieve a word from a:hl, and return it in hl.
	; bankswitch to new bank
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	; get word from new bank, put it in hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; bankswitch to previous bank and return
	pop af
	rst Bankswitch
	ret

FarCopyWRAM::
; copy bc bytes from hl to a:de
	ldh [hTempBank], a
	ldh a, [rWBK]
	push af
	ldh a, [hTempBank]
	ldh [rWBK], a
	call CopyBytes
	pop af
	ldh [rWBK], a
	ret

GetFarWRAMByte::
; retrieve a single byte from a:hl, and return it in a.
	ldh [hTempBank], a
	ldh a, [rWBK]
	push af
	ldh a, [hTempBank]
	ldh [rWBK], a
	ld a, [hl]
	ldh [hFarByte], a
	pop af
	ldh [rWBK], a
	ldh a, [hFarByte]
	ret

FarCopyBytes::
; copy bc bytes from a:hl to de
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call CopyBytes
	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble:
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a
	inc b
	inc c
	jr .dec
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop
	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble_DoubleBankSwitch::
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch
	call FarCopyBytesDouble
	pop af
	rst Bankswitch
	ret

CopyName1::
; Copies the name from de to wStringBuffer2
	ld hl, wStringBuffer2
	; fallthrough
CopyName2::
; Copies the name from de to hl
.loop
	ld a, [de]
	inc de
	ld [hli], a
	cp "@"
	jr nz, .loop
	ret
