DelayFrame::
; Wait for one frame
	ld a, 1
	ld [wVBlankOccurred], a
.halt
	; Wait for the next VBlank, halting to conserve battery
	halt
	nop
	ld a, [wVBlankOccurred]
	and a
	jr nz, .halt
	ret

DelayFrames::
; Wait c frames
	call DelayFrame
	dec c
	jr nz, DelayFrames
	ret
