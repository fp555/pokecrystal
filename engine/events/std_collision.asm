CheckFacingTileForStdScript::
; Checks to see if the tile you're facing has a std script associated with it.
; If so, executes the script and returns carry.
	ld a, c
	ld de, 2
	ld hl, TileCollisionStdScripts
	call IsInArray
	jr nc, .notintable
	ld a, jumpstd_command
	ld [wJumpStdScriptBuffer], a
	inc hl
	ld a, [hl]
	ld [wJumpStdScriptBuffer + 1], a
	ld a, BANK(Script_JumpStdFromRAM)
	ld hl, Script_JumpStdFromRAM
	call CallScript
	scf
	ret
.notintable
	xor a
	ret

INCLUDE "data/collision/collision_stdscripts.asm"

Script_JumpStdFromRAM:
	sjump wJumpStdScriptBuffer
