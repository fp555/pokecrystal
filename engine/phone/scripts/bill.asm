BillPhoneCalleeScript:
	checktime DAY
	iftrue .daygreet
	checktime EVN | NITE
	iftrue .nitegreet
	farwritetext BillPhoneMornGreetingText
	promptbutton
.main
	farwritetext BillPhoneGenericText
	promptbutton
	readvar VAR_BOXSPACE
	getnum STRING_BUFFER_3
	ifequal 0, .full
	ifless PARTY_LENGTH, .nearlyfull
	farwritetext BillPhoneNotFullText
	end
.daygreet
	farwritetext BillPhoneDayGreetingText
	promptbutton
	sjump .main
.nitegreet
	farwritetext BillPhoneNiteGreetingText
	promptbutton
	sjump .main
.nearlyfull
	farwritetext BillPhoneNearlyFullText
	end
.full
	farwritetext BillPhoneFullText
	end

BillPhoneCallerScript:
	farwritetext BillPhoneNewlyFullText
	waitbutton
	end
