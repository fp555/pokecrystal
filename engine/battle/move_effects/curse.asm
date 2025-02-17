BattleCommand_Curse:
; Cut HP in half and put a curse on the opponent.
	call CheckHiddenOpponent
	jr nz, .failed
	call CheckSubstituteOpp
	jr nz, .failed
	ld a, BATTLE_VARS_SUBSTATUS1_OPP
	call GetBattleVarAddr
	bit SUBSTATUS_CURSE, [hl]
	jr nz, .failed
	set SUBSTATUS_CURSE, [hl]
	call AnimateCurrentMove
	ld hl, GetHalfMaxHP
	call CallBattleCore
	ld hl, SubtractHPFromUser
	call CallBattleCore
	call UpdateUserInParty
	ld hl, PutACurseText
	jp StdBattleTextbox
.failed
	call AnimateFailedMove
	jp PrintButItFailed
