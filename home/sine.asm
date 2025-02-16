Sine::
; a = d * sin(a * pi/32)
	and %111111
	cp %100000
	jr nc, .negative
	call .ApplySineWave
	ld a, h
	ret
.negative
	and %011111
	call .ApplySineWave
	ld a, h
	cpl
	inc a
	ret
.ApplySineWave:
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .sinewave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.multiply ; Factor amplitude
	srl a
	jr nc, .even
	add hl, de
.even
	sla e
	rl d
	and a
	jr nz, .multiply
	ret
.sinewave
for x, $20
	dw sin(x * 0.5 / $20)
endr
