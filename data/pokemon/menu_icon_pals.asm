MACRO icon_pals
	dn PAL_ICON_\1, PAL_ICON_\2
ENDM

MonMenuIconPals: ; colors are from constants/icon.constants.asm
	table_width 1, MonMenuIconPals
	;         normal, shiny
	icon_pals TEAL, GREEN   ; BULBASAUR
	icon_pals TEAL, GREEN   ; IVYSAUR
	icon_pals TEAL, GREEN   ; VENUSAUR
	icon_pals RED, BROWN    ; CHARMANDER
	icon_pals RED, PINK     ; CHARMELEON
	icon_pals RED, PURPLE   ; CHARIZARD
	icon_pals BLUE, GREEN   ; SQUIRTLE
	icon_pals BLUE, GREEN   ; WARTORTLE
	icon_pals BLUE, TEAL    ; BLASTOISE
	icon_pals GREEN, BROWN  ; CATERPIE
	icon_pals GREEN, BROWN  ; METAPOD
	icon_pals BLUE, PINK    ; BUTTERFREE
	icon_pals RED, PINK     ; WEEDLE
	icon_pals BROWN, GREEN  ; KAKUNA
	icon_pals RED, TEAL     ; BEEDRILL
	icon_pals BROWN, GREEN  ; PIDGEY
	icon_pals BROWN, GREEN  ; PIDGEOTTO
	icon_pals BROWN, GREEN  ; PIDGEOT
	icon_pals PURPLE, GREEN ; RATTATA
	icon_pals BROWN, RED    ; RATICATE
	icon_pals BROWN, BROWN  ; SPEAROW
	icon_pals BROWN, GREEN  ; FEAROW
	icon_pals PURPLE, GREEN ; EKANS
	icon_pals PURPLE, GREEN ; ARBOK
	icon_pals RED, PINK     ; PIKACHU
	icon_pals RED, BROWN    ; RAICHU
	icon_pals BROWN, TEAL   ; SANDSHREW
	icon_pals BROWN, RED    ; SANDSLASH
	icon_pals BLUE, PINK    ; NIDORAN_F
	icon_pals BLUE, PINK    ; NIDORINA
	icon_pals BLUE, GREEN   ; NIDOQUEEN
	icon_pals PURPLE, BLUE  ; NIDORAN_M
	icon_pals PURPLE, BLUE  ; NIDORINO
	icon_pals PURPLE, BLUE  ; NIDOKING
	icon_pals PINK, GREEN   ; CLEFAIRY
	icon_pals PINK, GREEN   ; CLEFABLE
	icon_pals RED, BROWN    ; VULPIX
	icon_pals BROWN, GRAY   ; NINETALES
	icon_pals PINK, GREEN   ; JIGGLYPUFF
	icon_pals PINK, GREEN   ; WIGGLYTUFF
	icon_pals BLUE, GREEN   ; ZUBAT
	icon_pals BLUE, GREEN   ; GOLBAT
	icon_pals GREEN, BROWN  ; ODDISH
	icon_pals RED, BROWN    ; GLOOM
	icon_pals RED, BROWN    ; VILEPLUME
	icon_pals RED, GREEN    ; PARAS
	icon_pals RED, GREEN    ; PARASECT
	icon_pals PURPLE, BLUE  ; VENONAT
	icon_pals PURPLE, BLUE  ; VENOMOTH
	icon_pals BROWN, BLUE   ; DIGLETT
	icon_pals BROWN, BLUE   ; DUGTRIO
	icon_pals BROWN, PINK   ; MEOWTH
	icon_pals BROWN, PINK   ; PERSIAN
	icon_pals BROWN, BLUE   ; PSYDUCK
	icon_pals BLUE, TEAL    ; GOLDUCK
	icon_pals BROWN, GREEN  ; MANKEY
	icon_pals BROWN, GREEN  ; PRIMEAPE
	icon_pals RED, GREEN    ; GROWLITHE
	icon_pals RED, GREEN    ; ARCANINE
	icon_pals BLUE, BLUE    ; POLIWAG
	icon_pals BLUE, BLUE    ; POLIWHIRL
	icon_pals BLUE, TEAL    ; POLIWRATH
	icon_pals BROWN, PINK   ; ABRA
	icon_pals BROWN, PINK   ; KADABRA
	icon_pals BROWN, PINK   ; ALAKAZAM
	icon_pals GRAY, GREEN   ; MACHOP
	icon_pals GRAY, GREEN   ; MACHOKE
	icon_pals GRAY, GREEN   ; MACHAMP
	icon_pals GREEN, BROWN  ; BELLSPROUT
	icon_pals GREEN, BROWN  ; WEEPINBELL
	icon_pals GREEN, BROWN  ; VICTREEBEL
	icon_pals BLUE, TEAL    ; TENTACOOL
	icon_pals BLUE, GREEN   ; TENTACRUEL
	icon_pals BROWN, RED    ; GEODUDE
	icon_pals BROWN, RED    ; GRAVELER
	icon_pals BROWN, RED    ; GOLEM
	icon_pals RED, BROWN    ; PONYTA
	icon_pals RED, PURPLE   ; RAPIDASH
	icon_pals PINK, PURPLE  ; SLOWPOKE
	icon_pals PINK, PURPLE  ; SLOWBRO
	icon_pals BLUE, BROWN   ; MAGNEMITE
	icon_pals BLUE, BROWN   ; MAGNETON
	icon_pals BROWN, GRAY   ; FARFETCH_D
	icon_pals BROWN, GREEN  ; DODUO
	icon_pals BROWN, GREEN  ; DODRIO
	icon_pals BLUE, GRAY    ; SEEL
	icon_pals BLUE, GRAY    ; DEWGONG
	icon_pals PURPLE, GREEN ; GRIMER
	icon_pals PURPLE, GREEN ; MUK
	icon_pals PURPLE, BROWN ; SHELLDER
	icon_pals PURPLE, BLUE  ; CLOYSTER
	icon_pals PURPLE, BLUE  ; GASTLY
	icon_pals PURPLE, BLUE  ; HAUNTER
	icon_pals PURPLE, PINK  ; GENGAR
	icon_pals GRAY, GREEN   ; ONIX
	icon_pals BROWN, PINK   ; DROWZEE
	icon_pals BROWN, PINK   ; HYPNO
	icon_pals RED, GREEN    ; KRABBY
	icon_pals RED, GREEN    ; KINGLER
	icon_pals RED, BLUE     ; VOLTORB
	icon_pals RED, BLUE     ; ELECTRODE
	icon_pals PINK, GREEN   ; EXEGGCUTE
	icon_pals GREEN, BROWN  ; EXEGGUTOR
	icon_pals BROWN, TEAL   ; CUBONE
	icon_pals BROWN, GREEN  ; MAROWAK
	icon_pals BROWN, GREEN  ; HITMONLEE
	icon_pals BROWN, GREEN  ; HITMONCHAN
	icon_pals PINK, GREEN   ; LICKITUNG
	icon_pals PURPLE, BLUE  ; KOFFING
	icon_pals PURPLE, BLUE  ; WEEZING
	icon_pals GRAY, BROWN   ; RHYHORN
	icon_pals GRAY, GRAY    ; RHYDON
	icon_pals PINK, GREEN   ; CHANSEY
	icon_pals BLUE, GREEN   ; TANGELA
	icon_pals BROWN, GRAY   ; KANGASKHAN
	icon_pals BLUE, PINK    ; HORSEA
	icon_pals BLUE, PINK    ; SEADRA
	icon_pals RED, BROWN    ; GOLDEEN
	icon_pals RED, BROWN    ; SEAKING
	icon_pals BROWN, BLUE   ; STARYU
	icon_pals PURPLE, BLUE  ; STARMIE
	icon_pals PINK, GREEN   ; MR__MIME
	icon_pals GREEN, GREEN  ; SCYTHER
	icon_pals PURPLE, PINK  ; JYNX
	icon_pals BROWN, GREEN  ; ELECTABUZZ
	icon_pals RED, PINK     ; MAGMAR
	icon_pals BROWN, BLUE   ; PINSIR
	icon_pals BROWN, GREEN  ; TAUROS
	icon_pals RED, GREEN    ; MAGIKARP
	icon_pals BLUE, RED     ; GYARADOS
	icon_pals BLUE, PINK    ; LAPRAS
	icon_pals PINK, BLUE    ; DITTO
	icon_pals BROWN, GRAY   ; EEVEE
	icon_pals BLUE, PURPLE  ; VAPOREON
	icon_pals BROWN, GREEN  ; JOLTEON
	icon_pals RED, BROWN    ; FLAREON
	icon_pals PINK, PURPLE  ; PORYGON
	icon_pals BLUE, GRAY    ; OMANYTE
	icon_pals BLUE, GRAY    ; OMASTAR
	icon_pals BROWN, GREEN  ; KABUTO
	icon_pals BROWN, GREEN  ; KABUTOPS
	icon_pals GRAY, PURPLE  ; AERODACTYL
	icon_pals BROWN, BLUE   ; SNORLAX
	icon_pals BLUE, BLUE    ; ARTICUNO
	icon_pals BROWN, RED    ; ZAPDOS
	icon_pals RED, PINK     ; MOLTRES
	icon_pals BLUE, PURPLE  ; DRATINI
	icon_pals BLUE, PURPLE  ; DRAGONAIR
	icon_pals RED, GREEN    ; DRAGONITE
	icon_pals PURPLE, GREEN ; MEWTWO
	icon_pals PINK, BLUE    ; MEW
	icon_pals GREEN, BROWN  ; CHIKORITA
	icon_pals GREEN, BROWN  ; BAYLEEF
	icon_pals GREEN, BROWN  ; MEGANIUM
	icon_pals RED, PURPLE   ; CYNDAQUIL
	icon_pals RED, PURPLE   ; QUILAVA
	icon_pals RED, PURPLE   ; TYPHLOSION
	icon_pals BLUE, GREEN   ; TOTODILE
	icon_pals BLUE, GREEN   ; CROCONAW
	icon_pals BLUE, TEAL    ; FERALIGATR
	icon_pals BROWN, PINK   ; SENTRET
	icon_pals BROWN, PINK   ; FURRET
	icon_pals BROWN, GREEN  ; HOOTHOOT
	icon_pals BROWN, GREEN  ; NOCTOWL
	icon_pals RED, BROWN    ; LEDYBA
	icon_pals RED, BROWN    ; LEDIAN
	icon_pals GREEN, PURPLE ; SPINARAK
	icon_pals PINK, PURPLE   ; ARIADOS
	icon_pals PURPLE, PINK  ; CROBAT
	icon_pals BLUE, TEAL    ; CHINCHOU
	icon_pals BLUE, TEAL    ; LANTURN
	icon_pals RED, BROWN    ; PICHU
	icon_pals PINK, GREEN   ; CLEFFA
	icon_pals PINK, GREEN   ; IGGLYBUFF
	icon_pals RED, BLUE     ; TOGEPI
	icon_pals RED, BLUE     ; TOGETIC
	icon_pals GREEN, GREEN  ; NATU
	icon_pals GREEN, GREEN  ; XATU
	icon_pals BLUE, BLUE    ; MAREEP
	icon_pals PINK, PINK    ; FLAAFFY
	icon_pals BROWN, GRAY   ; AMPHAROS
	icon_pals GREEN, BLUE   ; BELLOSSOM
	icon_pals BLUE, GREEN   ; MARILL
	icon_pals BLUE, BROWN   ; AZUMARILL
	icon_pals GREEN, PINK   ; SUDOWOODO
	icon_pals GREEN, GRAY   ; POLITOED
	icon_pals PINK, GREEN   ; HOPPIP
	icon_pals GREEN, PURPLE ; SKIPLOOM
	icon_pals BLUE, PINK    ; JUMPLUFF
	icon_pals PURPLE, PINK  ; AIPOM
	icon_pals GREEN, BROWN  ; SUNKERN
	icon_pals GREEN, BROWN  ; SUNFLORA
	icon_pals RED, BLUE     ; YANMA
	icon_pals BLUE, PINK    ; WOOPER
	icon_pals BLUE, PURPLE  ; QUAGSIRE
	icon_pals PINK, GREEN   ; ESPEON
	icon_pals BROWN, BLUE   ; UMBREON
	icon_pals BLUE, PURPLE  ; MURKROW
	icon_pals PINK, BLUE    ; SLOWKING
	icon_pals PURPLE, GREEN ; MISDREAVUS
	icon_pals GRAY, BLUE    ; UNOWN
	icon_pals BLUE, PURPLE  ; WOBBUFFET
	icon_pals PINK, BLUE    ; GIRAFARIG
	icon_pals GREEN, RED    ; PINECO
	icon_pals RED, GREEN    ; FORRETRESS
	icon_pals BLUE, PINK    ; DUNSPARCE
	icon_pals PINK, BLUE    ; GLIGAR
	icon_pals GRAY, BROWN   ; STEELIX
	icon_pals PINK, BLUE    ; SNUBBULL
	icon_pals PURPLE, GRAY  ; GRANBULL
	icon_pals BLUE, PINK    ; QWILFISH
	icon_pals RED, GREEN    ; SCIZOR
	icon_pals RED, BLUE     ; SHUCKLE
	icon_pals BLUE, PURPLE  ; HERACROSS
	icon_pals BLUE, PINK    ; SNEASEL
	icon_pals BROWN, GREEN  ; TEDDIURSA
	icon_pals BROWN, GREEN  ; URSARING
	icon_pals RED, GRAY     ; SLUGMA
	icon_pals RED, BLUE     ; MAGCARGO
	icon_pals BROWN, BLUE   ; SWINUB
	icon_pals BROWN, GREEN  ; PILOSWINE
	icon_pals PINK, BLUE    ; CORSOLA
	icon_pals BLUE, GRAY    ; REMORAID
	icon_pals RED, GREEN    ; OCTILLERY
	icon_pals RED, PINK     ; DELIBIRD
	icon_pals BLUE, TEAL    ; MANTINE
	icon_pals RED, GREEN    ; SKARMORY
	icon_pals RED, BLUE     ; HOUNDOUR
	icon_pals RED, BLUE     ; HOUNDOOM
	icon_pals BLUE, PURPLE  ; KINGDRA
	icon_pals BLUE, TEAL    ; PHANPY
	icon_pals BLUE, BROWN   ; DONPHAN
	icon_pals PINK, BLUE    ; PORYGON2
	icon_pals BROWN, GREEN  ; STANTLER
	icon_pals BROWN, GREEN  ; SMEARGLE
	icon_pals PINK, BLUE    ; TYROGUE
	icon_pals BROWN, PURPLE ; HITMONTOP
	icon_pals PURPLE, PINK  ; SMOOCHUM
	icon_pals BROWN, BROWN  ; ELEKID
	icon_pals RED, BROWN    ; MAGBY
	icon_pals PINK, BLUE    ; MILTANK
	icon_pals PINK, PINK    ; BLISSEY
	icon_pals BROWN, BROWN  ; RAIKOU
	icon_pals RED, RED      ; ENTEI
	icon_pals BLUE, BLUE    ; SUICUNE
	icon_pals GREEN, GREEN  ; LARVITAR
	icon_pals BLUE, PURPLE  ; PUPITAR
	icon_pals GREEN, PURPLE ; TYRANITAR
	icon_pals BLUE, PINK    ; LUGIA
	icon_pals RED, BROWN    ; HO_OH
	icon_pals GREEN, PINK   ; CELEBI
	assert_table_length NUM_POKEMON
	icon_pals RED,    RED   ; 252
	icon_pals GREEN,  BLUE  ; EGG
	icon_pals RED,    RED   ; 254
