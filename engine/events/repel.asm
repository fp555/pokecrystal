RepelWoreOffScript::
	opentext
	readmem wRepelType
	getitemname STRING_BUFFER_3, USE_SCRIPT_VAR
	writetext .RepelWoreOffText
	waitbutton
	checkitem USE_SCRIPT_VAR ; one of REPEL, SUPER_REPEL, MAX_REPEL
	iffalse .done
	writetext .RepelUseAnotherText
	yesorno
	iffalse .done
	callasm DoItemEffect
.done
	closetext
	end
.RepelWoreOffText:
	text_far _RepelWoreOffText
	text_end
.RepelUseAnotherText:
	text_far _RepelUseAnotherText
	text_end
