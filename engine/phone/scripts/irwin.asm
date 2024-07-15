IrwinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	checkflag ENGINE_IRWIN_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	checkflag ENGINE_IRWIN_MONDAY_NIGHT
	iftrue .NotMonday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime NITE
	iftrue IrwinMondayNight
.Rockets:
	farsjump IrwinRocketRumorScript
.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	farsjump IrwinReminderScript
.NotMonday:
	farsjump IrwinRandomTextScript

IrwinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	checkflag ENGINE_IRWIN_READY_FOR_REMATCH
	iftrue .Generic
	checkflag ENGINE_IRWIN_MONDAY_NIGHT
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, IrwinWantsBattle
.Rockets:
	farsjump IrwinRocketRumorScript
.Generic:
	farsjump IrwinRumorScript

IrwinMondayNight:
	setflag ENGINE_IRWIN_MONDAY_NIGHT

IrwinWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_35
	setflag ENGINE_IRWIN_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male
