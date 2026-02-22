MACRO add_stdscript
\1StdScript::
	dba \1
ENDM

StdScripts::
	add_stdscript PokecenterNurseScript
	add_stdscript DifficultBookshelfScript
	add_stdscript PictureBookshelfScript
	add_stdscript MagazineBookshelfScript
	add_stdscript TeamRocketOathScript
	add_stdscript IncenseBurnerScript
	add_stdscript MerchandiseShelfScript
	add_stdscript TownMapScript
	add_stdscript WindowScript
	add_stdscript TVScript
	add_stdscript Radio1Script
	add_stdscript Radio2Script
	add_stdscript TrashCanScript
	add_stdscript StrengthBoulderScript
	add_stdscript SmashRockScript
	add_stdscript PokecenterSignScript
	add_stdscript MartSignScript
	add_stdscript GoldenrodRocketsScript
	add_stdscript RadioTowerRocketsScript
	add_stdscript ElevatorButtonScript
	add_stdscript DayToTextScript
	add_stdscript BugContestResultsWarpScript
	add_stdscript BugContestResultsScript
	add_stdscript AskNumber1MScript
	add_stdscript AskNumber1FScript
	add_stdscript AskNumber2MScript
	add_stdscript AskNumber2FScript
	add_stdscript RegisteredNumberScript
	add_stdscript NumberAcceptedMScript
	add_stdscript NumberAcceptedFScript
	add_stdscript NumberDeclinedMScript
	add_stdscript NumberDeclinedFScript
	add_stdscript PhoneFullMScript
	add_stdscript PhoneFullFScript
	add_stdscript RematchMScript
	add_stdscript RematchFScript
	add_stdscript GiftMScript
	add_stdscript GiftFScript
	add_stdscript PackFullMScript
	add_stdscript PackFullFScript
	add_stdscript RematchGiftMScript
	add_stdscript RematchGiftFScript	
	add_stdscript GymStatue1Script
	add_stdscript GymStatue2Script
	add_stdscript ReceiveItemScript
	add_stdscript ReceiveTogepiEggScript
	add_stdscript PCScript
	add_stdscript GameCornerCoinVendorScript
	add_stdscript GameCornerMemoryGameExplanationScript
	add_stdscript HappinessCheckScript

PokecenterNurseScript:
	opentext
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	checktime NITE
	iftrue .nite
	sjump .ok
.morn
	farwritetext NurseMornText
	promptbutton
	sjump .ok
.day
	farwritetext NurseDayText
	promptbutton
	sjump .ok
.nite
	farwritetext NurseNiteText
	promptbutton
.ok
	farwritetext NurseAskHealText
	yesorno
	iffalse .done
	farwritetext NurseTakePokemonText
	pause 20
	turnobject LAST_TALKED, LEFT
	pause 10
	special HealParty
	playmusic MUSIC_NONE
	setval HEALMACHINE_POKECENTER
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	turnobject LAST_TALKED, DOWN
	pause 10
	checkphonecall ; elm already called about pokerus
	iftrue .no
	checkflag ENGINE_CAUGHT_POKERUS
	iftrue .no
	special CheckPokerus
	iftrue .pokerus
.no
	farwritetext NurseReturnPokemonText
	pause 20
.done
	farwritetext NurseGoodbyeText
	turnobject LAST_TALKED, UP
	pause 10
	turnobject LAST_TALKED, DOWN
	pause 10
	waitbutton
	closetext
	end
.pokerus
	farwritetext NursePokerusText
	waitbutton
	closetext
	setflag ENGINE_CAUGHT_POKERUS
	specialphonecall SPECIALCALL_POKERUS
	end

DifficultBookshelfScript:
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
	farjumptext MagazineBookshelfText

TeamRocketOathScript:
	farjumptext TeamRocketOathText

IncenseBurnerScript:
	farjumptext IncenseBurnerText

MerchandiseShelfScript:
	farjumptext MerchandiseShelfText

TownMapScript:
	opentext
	farwritetext LookTownMapText
	waitbutton
	special OverworldTownMap
	closetext
	end

WindowScript:
	farjumptext WindowText

TVScript:
	opentext
	farwritetext TVText
	waitbutton
	closetext
	end

Radio1Script:
	opentext
	setval MAPRADIO_POKEMON_CHANNEL
	special MapRadio
	closetext
	end

Radio2Script:
; Lucky Channel
	opentext
	setval MAPRADIO_LUCKY_CHANNEL
	special MapRadio
	closetext
	end

TrashCanScript:
	farjumptext TrashCanText

PCScript:
	opentext
	special PokemonCenterPC
	closetext
	end

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farsjump AskStrengthScript

SmashRockScript:
	farsjump AskRockSmashScript

PokecenterSignScript:
	farjumptext PokecenterSignText

MartSignScript:
	farjumptext MartSignText

DayToTextScript:
	readvar VAR_WEEKDAY
	ifequal MONDAY, .Monday
	ifequal TUESDAY, .Tuesday
	ifequal WEDNESDAY, .Wednesday
	ifequal THURSDAY, .Thursday
	ifequal FRIDAY, .Friday
	ifequal SATURDAY, .Saturday
	getstring STRING_BUFFER_3, .SundayText
	end
.Monday:
	getstring STRING_BUFFER_3, .MondayText
	end
.Tuesday:
	getstring STRING_BUFFER_3, .TuesdayText
	end
.Wednesday:
	getstring STRING_BUFFER_3, .WednesdayText
	end
.Thursday:
	getstring STRING_BUFFER_3, .ThursdayText
	end
.Friday:
	getstring STRING_BUFFER_3, .FridayText
	end
.Saturday:
	getstring STRING_BUFFER_3, .SaturdayText
	end
.SundayText:
	db "SUNDAY@"
.MondayText:
	db "MONDAY@"
.TuesdayText:
	db "TUESDAY@"
.WednesdayText:
	db "WEDNESDAY@"
.ThursdayText:
	db "THURSDAY@"
.FridayText:
	db "FRIDAY@"
.SaturdayText:
	db "SATURDAY@"

GoldenrodRocketsScript:
	clearevent EVENT_GOLDENROD_CITY_ROCKET_TAKEOVER
	end

RadioTowerRocketsScript:
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_GOLDENROD_CITY_CIVILIANS
	setevent EVENT_RADIO_TOWER_BLACKBELT_BLOCKS_STAIRS
	clearevent EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_MAHOGANY_TOWN_POKEFAN_M_BLOCKS_EAST
	specialphonecall SPECIALCALL_WEIRDBROADCAST
	setmapscene MAHOGANY_TOWN, SCENE_MAHOGANYTOWN_NOOP
	end

BugContestResultsWarpScript:
	special ClearBGPalettes
	; CopyContestantsToResults
	checkevent EVENT_BUG_CATCHING_CONTESTANT_1A
	iftrue .skip1
	clearevent EVENT_BUG_CATCHING_CONTESTANT_1B
.skip1
	checkevent EVENT_BUG_CATCHING_CONTESTANT_2A
	iftrue .skip2
	clearevent EVENT_BUG_CATCHING_CONTESTANT_2B
.skip2
	checkevent EVENT_BUG_CATCHING_CONTESTANT_3A
	iftrue .skip3
	clearevent EVENT_BUG_CATCHING_CONTESTANT_3B
.skip3
	checkevent EVENT_BUG_CATCHING_CONTESTANT_4A
	iftrue .skip4
	clearevent EVENT_BUG_CATCHING_CONTESTANT_4B
.skip4
	checkevent EVENT_BUG_CATCHING_CONTESTANT_5A
	iftrue .skip5
	clearevent EVENT_BUG_CATCHING_CONTESTANT_5B
.skip5
	checkevent EVENT_BUG_CATCHING_CONTESTANT_6A
	iftrue .skip6
	clearevent EVENT_BUG_CATCHING_CONTESTANT_6B
.skip6
	checkevent EVENT_BUG_CATCHING_CONTESTANT_7A
	iftrue .skip7
	clearevent EVENT_BUG_CATCHING_CONTESTANT_7B
.skip7
	checkevent EVENT_BUG_CATCHING_CONTESTANT_8A
	iftrue .skip8
	clearevent EVENT_BUG_CATCHING_CONTESTANT_8B
.skip8
	checkevent EVENT_BUG_CATCHING_CONTESTANT_9A
	iftrue .skip9
	clearevent EVENT_BUG_CATCHING_CONTESTANT_9B
.skip9
	checkevent EVENT_BUG_CATCHING_CONTESTANT_10A
	iftrue .skip10
	clearevent EVENT_BUG_CATCHING_CONTESTANT_10B
.skip10
	setevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	clearevent EVENT_ROUTE_36_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
	setevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	warp ROUTE_36_NATIONAL_PARK_GATE, 0, 4
	applymovement PLAYER, .WalkAfterWarp
	sjump BugContestResultsScript
.WalkAfterWarp:
	step RIGHT
	step DOWN
	turn_head UP
	step_end

BugContestResultsScript:
	clearflag ENGINE_BUG_CONTEST_TIMER
	clearevent EVENT_WARPED_FROM_ROUTE_35_NATIONAL_PARK_GATE
	clearevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	clearevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	clearevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
	clearevent EVENT_CONTEST_OFFICER_HAS_BERRY
	opentext
	farwritetext ContestResults_ReadyToJudgeText
	waitbutton
	special BugContestJudging
	getnum STRING_BUFFER_3
	ifequal 1, .FirstPlace
	ifequal 2, .SecondPlace
	ifequal 3, .ThirdPlace
	farwritetext ContestResults_ConsolationPrizeText
	promptbutton
	waitsfx
	verbosegiveitem BERRY
	iffalse .NoRoomForBerry
.DidNotWin:
	farwritetext ContestResults_DidNotWinText
	promptbutton
.FinishUp:
	checkevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	iffalse .DidNotLeaveMons
	farwritetext ContestResults_ReturnPartyText
	waitbutton
	special ContestReturnMons
.DidNotLeaveMons:
	special CheckPartyFullAfterContest
	ifequal BUGCONTEST_CAUGHT_MON, .CleanUp
	ifequal BUGCONTEST_NO_CATCH, .CleanUp
	; BUGCONTEST_BOXED_MON
	farwritetext ContestResults_PartyFullText
	waitbutton
.CleanUp:
	closetext
	setscene SCENE_ROUTE36NATIONALPARKGATE_NOOP
	setmapscene ROUTE_35_NATIONAL_PARK_GATE, SCENE_ROUTE35NATIONALPARKGATE_NOOP
	setevent EVENT_BUG_CATCHING_CONTESTANT_1A
	setevent EVENT_BUG_CATCHING_CONTESTANT_2A
	setevent EVENT_BUG_CATCHING_CONTESTANT_3A
	setevent EVENT_BUG_CATCHING_CONTESTANT_4A
	setevent EVENT_BUG_CATCHING_CONTESTANT_5A
	setevent EVENT_BUG_CATCHING_CONTESTANT_6A
	setevent EVENT_BUG_CATCHING_CONTESTANT_7A
	setevent EVENT_BUG_CATCHING_CONTESTANT_8A
	setevent EVENT_BUG_CATCHING_CONTESTANT_9A
	setevent EVENT_BUG_CATCHING_CONTESTANT_10A
	setevent EVENT_BUG_CATCHING_CONTESTANT_1B
	setevent EVENT_BUG_CATCHING_CONTESTANT_2B
	setevent EVENT_BUG_CATCHING_CONTESTANT_3B
	setevent EVENT_BUG_CATCHING_CONTESTANT_4B
	setevent EVENT_BUG_CATCHING_CONTESTANT_5B
	setevent EVENT_BUG_CATCHING_CONTESTANT_6B
	setevent EVENT_BUG_CATCHING_CONTESTANT_7B
	setevent EVENT_BUG_CATCHING_CONTESTANT_8B
	setevent EVENT_BUG_CATCHING_CONTESTANT_9B
	setevent EVENT_BUG_CATCHING_CONTESTANT_10B
	setflag ENGINE_DAILY_BUG_CONTEST
	special PlayMapMusic
	end
.NoRoomForBerry:
	farwritetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_BERRY
	sjump .DidNotWin
.FirstPlace:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	getitemname STRING_BUFFER_4, SUN_STONE
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem SUN_STONE
	iftrue .ReturnAfterWinnersPrize
	farwritetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_SUN_STONE
	sjump .ReturnAfterWinnersPrize
.SecondPlace:
	getitemname STRING_BUFFER_4, EVERSTONE
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem EVERSTONE
	iftrue .ReturnAfterWinnersPrize
	farwritetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_EVERSTONE
	sjump .ReturnAfterWinnersPrize
.ThirdPlace:
	getitemname STRING_BUFFER_4, GOLD_BERRY
	farwritetext ContestResults_PlayerWonAPrizeText
	waitbutton
	verbosegiveitem GOLD_BERRY
	iftrue .ReturnAfterWinnersPrize
	farwritetext BugContestPrizeNoRoomText
	promptbutton
	setevent EVENT_CONTEST_OFFICER_HAS_GOLD_BERRY
.ReturnAfterWinnersPrize:
	farwritetext ContestResults_JoinUsNextTimeText
	promptbutton
	sjump .FinishUp

AskNumber1MScript:
	special RandomPhoneMon
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
.Jack:
	farwritetext JackAskNumber1Text
	end
.Huey:
	farwritetext HueyAskNumber1Text
	end
.Gaven:
	farwritetext GavenAskNumber1Text
	end
.Jose:
	farwritetext JoseAskNumber1Text
	end
.Joey:
	farwritetext JoeyAskNumber1Text
	end
.Wade:
	farwritetext WadeAskNumber1Text
	end
.Ralph:
	farwritetext RalphAskNumber1Text
	end
.Anthony:
	farwritetext AnthonyAskNumber1Text
	end
.Todd:
	farwritetext ToddAskNumber1Text
	end
.Arnie:
	farwritetext ArnieAskNumber1Text
	end
.Alan:
	farwritetext AlanAskNumber1Text
	end
.Chad:
	farwritetext ChadAskNumber1Text
	end
.Derek:
	farwritetext DerekAskNumber1Text
	end
.Tully:
	farwritetext TullyAskNumber1Text
	end
.Brent:
	farwritetext BrentAskNumber1Text
	end
.Vance:
	farwritetext VanceAskNumber1Text
	end
.Wilton:
	farwritetext WiltonAskNumber1Text
	end
.Kenji:
	farwritetext KenjiAskNumber1Text
	end
.Parry:
	farwritetext ParryAskNumber1Text
	end

AskNumber2MScript:
	special RandomPhoneMon
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	ifequal PHONE_HIKER_PARRY, .Parry
.Jack:
	farwritetext JackAskNumber2Text
	end
.Huey:
	farwritetext HueyAskNumber2Text
	end
.Gaven:
	farwritetext GavenAskNumber2Text
	end
.Jose:
	farwritetext JoseAskNumber2Text
	end
.Joey:
	farwritetext JoeyAskNumber2Text
	end
.Wade:
	farwritetext WadeAskNumber2Text
	end
.Ralph:
	farwritetext RalphAskNumber2Text
	end
.Anthony:
	farwritetext AnthonyAskNumber2Text
	end
.Todd:
	farwritetext ToddAskNumber2Text
	end
.Arnie:
	farwritetext ArnieAskNumber2Text
	end
.Alan:
	farwritetext AlanAskNumber2Text
	end
.Chad:
	farwritetext ChadAskNumber2Text
	end
.Derek:
	farwritetext DerekAskNumber2Text
	end
.Tully:
	farwritetext TullyAskNumber2Text
	end
.Brent:
	farwritetext BrentAskNumber2Text
	end
.Vance:
	farwritetext VanceAskNumber2Text
	end
.Wilton:
	farwritetext WiltonAskNumber2Text
	end
.Kenji:
	farwritetext KenjiAskNumber2Text
	end
.Parry:
	farwritetext ParryAskNumber2Text
	end

RegisteredNumberScript:
	farwritetext RegisteredNumberText
	playsound SFX_REGISTER_PHONE_NUMBER
	waitsfx
	promptbutton
	end

NumberAcceptedMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	; PHONE_HIKER_PARRY
	farwritetext ParryNumberAcceptedText
.end
	waitbutton
	closetext
	end
.Jack:
	farwritetext JackNumberAcceptedText
	sjump .end
.Huey:
	farwritetext HueyNumberAcceptedText
	sjump .end
.Gaven:
	farwritetext GavenNumberAcceptedText
	sjump .end
.Jose:
	farwritetext JoseNumberAcceptedText
	sjump .end
.Joey:
	farwritetext JoeyNumberAcceptedText
	sjump .end
.Wade:
	farwritetext WadeNumberAcceptedText
	sjump .end
.Ralph:
	farwritetext RalphNumberAcceptedText
	sjump .end
.Anthony:
	farwritetext AnthonyNumberAcceptedText
	sjump .end
.Todd:
	farwritetext ToddNumberAcceptedText
	sjump .end
.Arnie:
	farwritetext ArnieNumberAcceptedText
	sjump .end
.Alan:
	farwritetext AlanNumberAcceptedText
	sjump .end
.Chad:
	farwritetext ChadNumberAcceptedText
	sjump .end
.Derek:
	farwritetext DerekNumberAcceptedText
	sjump .end
.Tully:
	farwritetext TullyNumberAcceptedText
	sjump .end
.Brent:
	farwritetext BrentNumberAcceptedText
	sjump .end
.Vance:
	farwritetext VanceNumberAcceptedText
	sjump .end
.Wilton:
	farwritetext WiltonNumberAcceptedText
	sjump .end
.Kenji:
	farwritetext KenjiNumberAcceptedText
	sjump .end

NumberDeclinedMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	; PHONE_HIKER_PARRY
	farwritetext ParryNumberDeclinedText
.end
	waitbutton
	closetext
	end
.Jack:
	farwritetext JackNumberDeclinedText
	sjump .end
.Huey:
	farwritetext HueyNumberDeclinedText
	sjump .end
.Gaven:
	farwritetext GavenNumberDeclinedText
	sjump .end
.Jose:
	farwritetext JoseNumberDeclinedText
	sjump .end
.Joey:
	farwritetext JoeyNumberDeclinedText
	sjump .end
.Wade:
	farwritetext WadeNumberDeclinedText
	sjump .end
.Ralph:
	farwritetext RalphNumberDeclinedText
	sjump .end
.Anthony:
	farwritetext AnthonyNumberDeclinedText
	sjump .end
.Todd:
	farwritetext ToddNumberDeclinedText
	sjump .end
.Arnie:
	farwritetext ArnieNumberDeclinedText
	sjump .end
.Alan:
	farwritetext AlanNumberDeclinedText
	sjump .end
.Chad:
	farwritetext ChadNumberDeclinedText
	sjump .end
.Derek:
	farwritetext DerekNumberDeclinedText
	sjump .end
.Tully:
	farwritetext TullyNumberDeclinedText
	sjump .end
.Brent:
	farwritetext BrentNumberDeclinedText
	sjump .end
.Vance:
	farwritetext VanceNumberDeclinedText
	sjump .end
.Wilton:
	farwritetext WiltonNumberDeclinedText
	sjump .end
.Kenji:
	farwritetext KenjiNumberDeclinedText
	sjump .end

PhoneFullMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	; PHONE_HIKER_PARRY
	farwritetext ParryPhoneFullText
.end
	waitbutton
	closetext
	end
.Jack:
	farwritetext JackPhoneFullText
	sjump .end
.Huey:
	farwritetext HueyPhoneFullText
	sjump .end
.Gaven:
	farwritetext GavenPhoneFullText
	sjump .end
.Jose:
	farwritetext JosePhoneFullText
	sjump .end
.Joey:
	farwritetext JoeyPhoneFullText
	sjump .end
.Wade:
	farwritetext WadePhoneFullText
	sjump .end
.Ralph:
	farwritetext RalphPhoneFullText
	sjump .end
.Anthony:
	farwritetext AnthonyPhoneFullText
	sjump .end
.Todd:
	farwritetext ToddPhoneFullText
	sjump .end
.Arnie:
	farwritetext ArniePhoneFullText
	sjump .end
.Alan:
	farwritetext AlanPhoneFullText
	sjump .end
.Chad:
	farwritetext ChadPhoneFullText
	sjump .end
.Derek:
	farwritetext DerekPhoneFullText
	sjump .end
.Tully:
	farwritetext TullyPhoneFullText
	sjump .end
.Brent:
	farwritetext BrentPhoneFullText
	sjump .end
.Vance:
	farwritetext VancePhoneFullText
	sjump .end
.Wilton:
	farwritetext WiltonPhoneFullText
	sjump .end
.Kenji:
	farwritetext KenjiPhoneFullText
	sjump .end

RematchMScript:
	loadtemptrainer
	encountermusic
	readvar VAR_CALLERID
	ifequal PHONE_SCHOOLBOY_JACK, .Jack
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_COOLTRAINERM_GAVEN, .Gaven
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_FISHER_RALPH, .Ralph
	ifequal PHONE_HIKER_ANTHONY, .Anthony
	ifequal PHONE_CAMPER_TODD, .Todd
	ifequal PHONE_BUG_CATCHER_ARNIE, .Arnie
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_SCHOOLBOY_CHAD, .Chad
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_POKEMANIAC_BRENT, .Brent
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	; PHONE_HIKER_PARRY
	farwritetext ParryRematchText
.end
	waitbutton
	closetext
	end
.Jack:
	farwritetext JackRematchText
	sjump .end
.Huey:
	farwritetext HueyRematchText
	sjump .end
.Gaven:
	farwritetext GavenRematchText
	sjump .end
.Jose:
	farwritetext JoseRematchText
	sjump .end
.Joey:
	farwritetext JoeyRematchText
	sjump .end
.Wade:
	farwritetext WadeRematchText
	sjump .end
.Ralph:
	farwritetext RalphRematchText
	sjump .end
.Anthony:
	farwritetext AnthonyRematchText
	sjump .end
.Todd:
	farwritetext ToddRematchText
	sjump .end
.Arnie:
	farwritetext ArnieRematchText
	sjump .end
.Alan:
	farwritetext AlanRematchText
	sjump .end
.Chad:
	farwritetext ChadRematchText
	sjump .end
.Tully:
	farwritetext TullyRematchText
	sjump .end
.Brent:
	farwritetext BrentRematchText
	sjump .end
.Vance:
	farwritetext VanceRematchText
	sjump .end
.Wilton:
	farwritetext WiltonRematchText
	sjump .end

GiftMScript:
	readvar VAR_CALLERID
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_FISHER_WILTON, .Wilton
	; PHONE_BLACKBELT_KENJI
	farwritetext KenjiGiftText
.end
	promptbutton
	end
.Jose:
	farwritetext JoseGiftText
	sjump .end
.Wade:
	farwritetext WadeGiftText
	sjump .end
.Alan:
	farwritetext AlanGiftText
	sjump .end
.Derek:
	farwritetext DerekGiftText
	sjump .end
.Tully:
	farwritetext TullyGiftText
	sjump .end
.Wilton:
	farwritetext WiltonGiftText
	sjump .end

PackFullMScript:
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_BIRDKEEPER_JOSE, .Jose
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BUG_CATCHER_WADE, .Wade
	ifequal PHONE_SCHOOLBOY_ALAN, .Alan
	ifequal PHONE_POKEFANM_DEREK, .Derek
	ifequal PHONE_FISHER_TULLY, .Tully
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	ifequal PHONE_FISHER_WILTON, .Wilton
	ifequal PHONE_BLACKBELT_KENJI, .Kenji
	; PHONE_HIKER_PARRY
	farwritetext ParryPackFullText
.end
	waitbutton
	closetext
	end
.Huey:
	farwritetext HueyPackFullText
	sjump .end
.Jose:
	farwritetext JosePackFullText
	sjump .end
.Joey:
	farwritetext JoeyPackFullText
	sjump .end
.Wade:
	farwritetext WadePackFullText
	sjump .end
.Alan:
	farwritetext AlanPackFullText
	sjump .end
.Derek:
	farwritetext DerekPackFullText
	sjump .end
.Tully:
	farwritetext TullyPackFullText
	sjump .end
.Vance:
	farwritetext VancePackFullText
	sjump .end
.Wilton:
	farwritetext WiltonPackFullText
	sjump .end
.Kenji:
	farwritetext KenjiPackFullText
	sjump .end

RematchGiftMScript:
	opentext
	readvar VAR_CALLERID
	ifequal PHONE_SAILOR_HUEY, .Huey
	ifequal PHONE_YOUNGSTER_JOEY, .Joey
	ifequal PHONE_BIRDKEEPER_VANCE, .Vance
	; PHONE_HIKER_PARRY
	farwritetext ParryRematchGiftText
.end
	promptbutton
	end
.Huey:
	farwritetext HueyRematchGiftText
	sjump .end
.Joey:
	farwritetext JoeyRematchGiftText
	sjump .end
.Vance:
	farwritetext VanceRematchGiftText
	sjump .end

AskNumber1FScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	; PHONE_PICNICKER_ERIN
	farwritetext ErinAskNumber1Text
	end
.Beverly:
	farwritetext BeverlyAskNumber1Text
	end
.Beth:
	farwritetext BethAskNumber1Text
	end
.Reena:
	farwritetext ReenaAskNumber1Text
	end
.Liz:
	farwritetext LizAskNumber1Text
	end
.Gina:
	farwritetext GinaAskNumber1Text
	end
.Dana:
	farwritetext DanaAskNumber1Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber1Text
	end

AskNumber2FScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	; PHONE_PICNICKER_ERIN
	farwritetext ErinAskNumber2Text
	end
.Beverly:
	farwritetext BeverlyAskNumber2Text
	end
.Beth:
	farwritetext BethAskNumber2Text
	end
.Reena:
	farwritetext ReenaAskNumber2Text
	end
.Liz:
	farwritetext LizAskNumber2Text
	end
.Gina:
	farwritetext GinaAskNumber2Text
	end
.Dana:
	farwritetext DanaAskNumber2Text
	end
.Tiffany:
	farwritetext TiffanyAskNumber2Text
	end

NumberAcceptedFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	; PHONE_PICNICKER_ERIN
	farwritetext ErinNumberAcceptedText
.end
	waitbutton
	closetext
	end
.Beverly:
	farwritetext BeverlyNumberAcceptedText
	sjump .end
.Beth:
	farwritetext BethNumberAcceptedText
	sjump .end
.Reena:
	farwritetext ReenaNumberAcceptedText
	sjump .end
.Liz:
	farwritetext LizNumberAcceptedText
	sjump .end
.Gina:
	farwritetext GinaNumberAcceptedText
	sjump .end
.Dana:
	farwritetext DanaNumberAcceptedText
	sjump .end
.Tiffany:
	farwritetext TiffanyNumberAcceptedText
	sjump .end

NumberDeclinedFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	; PHONE_PICNICKER_ERIN
	farwritetext ErinNumberDeclinedText
.end
	waitbutton
	closetext
	end
.Beverly:
	farwritetext BeverlyNumberDeclinedText
	sjump .end
.Beth:
	farwritetext BethNumberDeclinedText
	sjump .end
.Reena:
	farwritetext ReenaNumberDeclinedText
	sjump .end
.Liz:
	farwritetext LizNumberDeclinedText
	sjump .end
.Gina:
	farwritetext GinaNumberDeclinedText
	sjump .end
.Dana:
	farwritetext DanaNumberDeclinedText
	sjump .end
.Tiffany:
	farwritetext TiffanyNumberDeclinedText
	sjump .end

PhoneFullFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	; PHONE_PICNICKER_ERIN
	farwritetext ErinPhoneFullText
.end
	waitbutton
	closetext
	end
.Beverly:
	farwritetext BeverlyPhoneFullText
	sjump .end
.Beth:
	farwritetext BethPhoneFullText
	sjump .end
.Reena:
	farwritetext ReenaPhoneFullText
	sjump .end
.Liz:
	farwritetext LizPhoneFullText
	sjump .end
.Gina:
	farwritetext GinaPhoneFullText
	sjump .end
.Dana:
	farwritetext DanaPhoneFullText
	sjump .end
.Tiffany:
	farwritetext TiffanyPhoneFullText
	sjump .end

RematchFScript:
	loadtemptrainer
	encountermusic
	readvar VAR_CALLERID
	ifequal PHONE_COOLTRAINERF_BETH, .Beth
	ifequal PHONE_COOLTRAINERF_REENA, .Reena
	ifequal PHONE_PICNICKER_LIZ, .Liz
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	; PHONE_PICNICKER_ERIN
	farwritetext ErinRematchText
.end
	waitbutton
	closetext
	end
.Beth:
	farwritetext BethRematchText
	sjump .end
.Reena:
	farwritetext ReenaRematchText
	sjump .end
.Liz:
	farwritetext LizRematchText
	sjump .end
.Gina:
	farwritetext GinaRematchText
	sjump .end
.Dana:
	farwritetext DanaRematchText
	sjump .end
.Tiffany:
	farwritetext TiffanyRematchText
	sjump .end

GiftFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	; PHONE_PICNICKER_TIFFANY
	farwritetext TiffanyGiftText
.end
	promptbutton
	end
.Beverly:
	farwritetext BeverlyGiftText
	sjump .end
.Gina:
	farwritetext GinaGiftText
	sjump .end
.Dana:
	farwritetext DanaGiftText
	sjump .end

PackFullFScript:
	readvar VAR_CALLERID
	ifequal PHONE_POKEFAN_BEVERLY, .Beverly
	ifequal PHONE_PICNICKER_GINA, .Gina
	ifequal PHONE_LASS_DANA, .Dana
	ifequal PHONE_PICNICKER_TIFFANY, .Tiffany
	; PHONE_PICNICKER_ERIN
	farwritetext ErinPackFullText
.end
	waitbutton
	closetext
	end
.Beverly:
	farwritetext BeverlyPackFullText
	sjump .end
.Gina:
	farwritetext GinaPackFullText
	sjump .end
.Dana:
	farwritetext DanaPackFullText
	sjump .end
.Tiffany:
	farwritetext TiffanyPackFullText
	sjump .end

RematchGiftFScript:
	; PHONE_PICNICKER_ERIN
	opentext
	farwritetext ErinRematchGiftText
	promptbutton
	end

GymStatue1Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	farwritetext GymStatue_CityGymText
	waitbutton
	closetext
	end

GymStatue2Script:
	getcurlandmarkname STRING_BUFFER_3
	opentext
	farwritetext GymStatue_CityGymText
	promptbutton
	farwritetext GymStatue_WinningTrainersText
	waitbutton
	closetext
	end

ReceiveItemScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_ITEM
	waitsfx
	end

ReceiveTogepiEggScript:
	waitsfx
	farwritetext ReceivedItemText
	playsound SFX_GET_EGG
	waitsfx
	end

GameCornerCoinVendorScript:
	faceplayer
	opentext
	farwritetext CoinVendor_WelcomeText
	promptbutton
	checkitem COIN_CASE
	iftrue .IntroScript
	farwritetext CoinVendor_NoCoinCaseText
	waitbutton
	closetext
	end
.IntroScript:
	farwritetext CoinVendor_IntroText
.loop
	special DisplayMoneyAndCoinBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Buy50
	ifequal 2, .Buy500
	sjump .Cancel
.Buy50:
	checkcoins MAX_COINS - 50
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 1000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 50
	takemoney YOUR_MONEY, 1000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy50CoinsText
	waitbutton
	sjump .loop
.Buy500:
	checkcoins MAX_COINS - 500
	ifequal HAVE_MORE, .CoinCaseFull
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	givecoins 500
	takemoney YOUR_MONEY, 10000
	waitsfx
	playsound SFX_TRANSACTION
	farwritetext CoinVendor_Buy500CoinsText
	waitbutton
	sjump .loop
.NotEnoughMoney:
	farwritetext CoinVendor_NotEnoughMoneyText
	waitbutton
	closetext
	end
.CoinCaseFull:
	farwritetext CoinVendor_CoinCaseFullText
	waitbutton
	closetext
	end
.Cancel:
	farwritetext CoinVendor_CancelText
	waitbutton
	closetext
	end
.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 4, 15, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option
.MenuData:
	db STATICMENU_CURSOR ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"

GameCornerMemoryGameExplanationScript:
	faceplayer
	opentext
	farwritetext MemoryGame_WelcomeText
	yesorno
	iftrue .explain
.end
	farwritetext MemoryGame_ComeAgainText
	waitbutton
	closetext
	end
.explain
	farwritetext MemoryGame_ExplanationText
	promptbutton
	sjump .end

HappinessCheckScript:
	faceplayer
	opentext
	special GetFirstPokemonHappiness
	ifless 50, .Unhappy
	ifless 150, .KindaHappy
	farwritetext HappinessText3
	waitbutton
	closetext
	end
.KindaHappy:
	farwritetext HappinessText2
	waitbutton
	closetext
	end
.Unhappy:
	farwritetext HappinessText1
	waitbutton
	closetext
	end
