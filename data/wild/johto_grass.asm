; Johto Pokémon in grass
; Probabilities in the tables:
; 35%, 30%, 20%, 10%, 5%

JohtoGrassWildMons:

	def_grass_wildmons SPROUT_TOWER_2F
	db 2 percent, 3 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 5, RATTATA
	db 5, RATTATA
	db 5, RATTATA
	db 5, RATTATA
	db 5, RATTATA
	; nite/evn
	db 5, GASTLY
	db 5, GASTLY
	db 5, RATTATA
	db 5, GASTLY
	db 5, GASTLY
	end_grass_wildmons

	def_grass_wildmons SPROUT_TOWER_3F
	db 2 percent, 3 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 6, RATTATA
	db 6, RATTATA
	db 6, RATTATA
	db 6, RATTATA
	db 6, RATTATA
	; nite/evn
	db 6, GASTLY
	db 6, GASTLY
	db 6, RATTATA
	db 6, GASTLY
	db 6, GASTLY
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_2F
	db 2 percent, 3 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 32, ARCANINE
	db 33, ARCANINE
	db 34, ARCANINE
	db 35, ARCANINE
	db 36, ARCANINE
	; nite/evn
	db 32, NINETALES
	db 33, NINETALES
	db 34, NINETALES
	db 35, NINETALES
	db 36, NINETALES
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_3F
	db 3 percent, 4 percent, 3 percent, 4 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 33, ARCANINE
	db 34, ARCANINE
	db 35, ARCANINE
	db 36, ARCANINE
	db 37, ARCANINE
	; nite/evn
	db 33, NINETALES
	db 34, NINETALES
	db 35, NINETALES
	db 36, NINETALES
	db 37, NINETALES
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_4F
	db 4 percent, 5 percent, 4 percent, 5 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 34, ARCANINE
	db 35, ARCANINE
	db 36, ARCANINE
	db 37, ARCANINE
	db 38, ARCANINE
	; nite/evn
	db 34, NINETALES
	db 35, NINETALES
	db 36, NINETALES
	db 37, NINETALES
	db 38, NINETALES
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_5F
	db 5 percent, 6 percent, 5 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 35, ARCANINE
	db 36, ARCANINE
	db 37, ARCANINE
	db 38, ARCANINE
	db 39, ARCANINE
	; nite/evn
	db 35, NINETALES
	db 36, NINETALES
	db 37, NINETALES
	db 38, NINETALES
	db 39, NINETALES
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_6F
	db 6 percent, 7 percent, 6 percent, 7 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 36, ARCANINE
	db 37, ARCANINE
	db 38, ARCANINE
	db 39, ARCANINE
	db 40, ARCANINE
	; nite/evn
	db 36, NINETALES
	db 37, NINETALES
	db 38, NINETALES
	db 39, NINETALES
	db 40, NINETALES
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_7F
	db 7 percent, 8 percent, 7 percent, 8 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 37, ARCANINE
	db 38, ARCANINE
	db 39, ARCANINE
	db 40, ARCANINE
	db 41, ARCANINE
	; nite/evn
	db 37, NINETALES
	db 38, NINETALES
	db 39, NINETALES
	db 40, NINETALES
	db 41, NINETALES
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_8F
	db 8 percent, 9 percent, 8 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 38, ARCANINE
	db 39, ARCANINE
	db 40, ARCANINE
	db 41, ARCANINE
	db 42, ARCANINE
	; nite/evn
	db 38, NINETALES
	db 39, NINETALES
	db 40, NINETALES
	db 41, NINETALES
	db 42, NINETALES
	end_grass_wildmons

	def_grass_wildmons TIN_TOWER_9F
	db 9 percent, 10 percent, 9 percent, 10 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 39, ARCANINE
	db 40, ARCANINE
	db 41, ARCANINE
	db 42, ARCANINE
	db 43, ARCANINE
	; nite/evn
	db 39, NINETALES
	db 40, NINETALES
	db 41, NINETALES
	db 42, NINETALES
	db 43, NINETALES
	end_grass_wildmons

	def_grass_wildmons BURNED_TOWER_1F
	db 5 percent, 4 percent, 5 percent, 4 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 13, KOFFING
	db 13, KOFFING
	db 13, RATTATA
	db 13, ZUBAT
	db 13, SLUGMA
	; nite/evn
	db 13, KOFFING
	db 13, KOFFING
	db 13, RATTATA
	db 13, ZUBAT
	db 13, SLUGMA
	end_grass_wildmons

	def_grass_wildmons BURNED_TOWER_B1F
	db 6 percent, 6 percent, 7 percent, 7 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 14, KOFFING
	db 14, ZUBAT
	db 14, RATTATA
	db 14, SLUGMA
	db 14, HOUNDOUR
	; nite/evn
	db 14, KOFFING
	db 14, ZUBAT
	db 14, RATTATA
	db 14, SLUGMA
	db 14, GASTLY
	end_grass_wildmons

	def_grass_wildmons NATIONAL_PARK
	db 10 percent, 9 percent, 10 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 12, NIDORAN_M
	db 12, NIDORAN_F
	db 12, LEDYBA
	db 12, PIDGEY
	db 12, SUNKERN
	; nite/evn
	db 12, HOOTHOOT
	db 12, PSYDUCK
	db 12, SPINARAK
	db 12, VENONAT
	db 12, ODDISH
	end_grass_wildmons

	def_grass_wildmons RUINS_OF_ALPH_OUTSIDE
	db 5 percent, 4 percent, 4 percent, 5 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 22, QUAGSIRE
	db 22, NATU
	db 22, PSYDUCK
	db 22, KADABRA
	db 22, SMEARGLE
	; nite/evn
	db 22, QUAGSIRE
	db 22, NATU
	db 22, PSYDUCK
	db 22, KADABRA
	db 22, MR__MIME
	end_grass_wildmons

	def_grass_wildmons RUINS_OF_ALPH_INNER_CHAMBER
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 5, UNOWN
	db 5, UNOWN
	db 5, UNOWN
	db 5, UNOWN
	db 5, UNOWN
	; nite/evn
	db 5, UNOWN
	db 5, UNOWN
	db 5, UNOWN
	db 5, UNOWN
	db 5, UNOWN
	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_1F
	db 6 percent, 6 percent, 7 percent, 7 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 7, GEODUDE
	db 7, SANDSHREW
	db 7, ZUBAT
	db 7, RATTATA
	db 7, ONIX
	; nite/evn
	db 7, RATTATA
	db 7, GEODUDE
	db 7, WOOPER
	db 7, ZUBAT
	db 7, ONIX
	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_B1F
	db 6 percent, 6 percent, 7 percent, 7 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 8, GEODUDE
	db 8, ZUBAT
	db 8, WOOPER
	db 8, ONIX
	db 8, RATTATA
	; nite/evn
	db 8, ZUBAT
	db 8, GEODUDE
	db 8, WOOPER
	db 8, ONIX
	db 8, RATTATA
	end_grass_wildmons

	def_grass_wildmons UNION_CAVE_B2F
	db 4 percent, 4 percent, 5 percent, 5 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 19, ZUBAT
	db 22, GOLBAT
	db 20, GEODUDE
	db 20, RATICATE
	db 20, ONIX
	; nite/evn
	db 19, ZUBAT
	db 22, GOLBAT
	db 20, QUAGSIRE
	db 20, RATICATE
	db 20, ONIX
	end_grass_wildmons

	def_grass_wildmons SLOWPOKE_WELL_B1F
	db 2 percent, 3 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 7, ZUBAT
	db 8, ZUBAT
	db 7, RATTATA
	db 7, SLOWPOKE
	db 8, SLOWPOKE
	; nite/evn
	db 7, ZUBAT
	db 8, ZUBAT
	db 7, RATTATA
	db 7, SLOWPOKE
	db 8, SLOWPOKE
	end_grass_wildmons

	def_grass_wildmons SLOWPOKE_WELL_B2F
	db 2 percent, 3 percent, 2 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 19, ZUBAT
	db 19, ZUBAT
	db 21, SLOWPOKE
	db 20, RATICATE
	db 22, GOLBAT
	; nite/evn
	db 19, ZUBAT
	db 19, ZUBAT
	db 21, SLOWPOKE
	db 20, RATICATE
	db 22, GOLBAT
	end_grass_wildmons

	def_grass_wildmons ILEX_FOREST
	db 5 percent, 4 percent, 5 percent, 4 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 7, CATERPIE
	db 7, WEEDLE
	db 9, PIDGEY
	db 9, LEDYBA
	db 9, PARAS
	; nite/evn
	db 9, ODDISH
	db 9, VENONAT
	db 9, HOOTHOOT
	db 9, PSYDUCK
	db 9, PARAS
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_1F_OUTSIDE
	db 7 percent, 7 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 17, RATTATA
	db 17, ZUBAT
	db 17, MACHOP
	db 17, SANDSHREW
	db 17, GEODUDE
	; nite/evn
	db 17, RATTATA
	db 17, ZUBAT
	db 15, MARILL
	db 17, SANDSHREW
	db 17, GEODUDE
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_1F_INSIDE
	db 7 percent, 7 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 20, RATICATE
	db 18, ZUBAT
	db 18, MACHOP
	db 18, SANDSHREW
	db 18, GEODUDE
	; nite/evn
	db 20, RATICATE
	db 18, ZUBAT
	db 15, MARILL
	db 18, SANDSHREW
	db 18, GEODUDE
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_2F_INSIDE
	db 7 percent, 7 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 30, RATICATE
	db 30, GOLBAT
	db 30, MACHOKE
	db 30, SANDSLASH
	db 30, GRAVELER
	; nite/evn
	db 30, RATICATE
	db 30, GOLBAT
	db 30, GRAVELER
	db 30, SANDSLASH
	db 30, AZUMARILL
	end_grass_wildmons

	def_grass_wildmons MOUNT_MORTAR_B1F
	db 7 percent, 7 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 20, RATICATE
	db 18, ZUBAT
	db 18, MACHOP
	db 18, SANDSHREW
	db 18, GEODUDE
	; nite/evn
	db 20, RATICATE
	db 18, ZUBAT
	db 15, MARILL
	db 18, SANDSHREW
	db 18, GEODUDE
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_1F
	db 2 percent, 2 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 19, ZUBAT
	db 22, GOLBAT
	db 21, SWINUB
	db 21, SEEL
	db 21, GASTLY
	; nite/evn
	db 19, ZUBAT
	db 22, GOLBAT
	db 21, DELIBIRD
	db 21, SEEL
	db 21, GASTLY
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B1F
	db 2 percent, 2 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 23, GOLBAT
	db 23, SWINUB
	db 23, SEEL
	db 25, HAUNTER
	db 23, JYNX
	; nite/evn
	db 23, GOLBAT
	db 23, DELIBIRD
	db 23, SEEL
	db 25, HAUNTER
	db 23, SNEASEL
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_MAHOGANY_SIDE
	db 2 percent, 2 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 24, GOLBAT
	db 24, SWINUB
	db 24, SEEL
	db 26, HAUNTER
	db 24, JYNX
	; nite/evn
	db 24, GOLBAT
	db 24, DELIBIRD
	db 24, SEEL
	db 26, HAUNTER
	db 24, SNEASEL
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B2F_BLACKTHORN_SIDE
	db 2 percent, 2 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 24, GOLBAT
	db 24, SWINUB
	db 24, SEEL
	db 26, HAUNTER
	db 24, JYNX
	; nite/evn
	db 24, GOLBAT
	db 24, DELIBIRD
	db 24, SEEL
	db 26, HAUNTER
	db 24, SNEASEL
	end_grass_wildmons

	def_grass_wildmons ICE_PATH_B3F
	db 2 percent, 2 percent, 3 percent, 3 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 25, GOLBAT
	db 25, SWINUB
	db 25, SEEL
	db 27, HAUNTER
	db 25, JYNX
	; nite/evn
	db 25, GOLBAT
	db 25, DELIBIRD
	db 25, SEEL
	db 27, HAUNTER
	db 25, SNEASEL
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_NW
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 23, KRABBY
	db 23, GOLBAT
	db 23, SEEL
	db 23, SHELLDER
	db 23, STARYU
	; nite/evn
	db 23, KRABBY
	db 23, GOLBAT
	db 23, KRABBY
	db 23, SHELLDER
	db 23, STARYU
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_NE
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 23, KRABBY
	db 23, GOLBAT
	db 23, SEEL
	db 23, SHELLDER
	db 23, STARYU
	; nite/evn
	db 23, KRABBY
	db 23, GOLBAT
	db 23, SEEL
	db 23, SHELLDER
	db 23, STARYU
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_SW
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 23, KRABBY
	db 23, GOLBAT
	db 23, SEEL
	db 23, SHELLDER
	db 23, STARYU
	; nite/evn
	db 23, KRABBY
	db 23, GOLBAT
	db 23, SEEL
	db 23, SHELLDER
	db 23, STARYU
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_CAVE
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 25, KRABBY
	db 25, GOLBAT
	db 25, SEEL
	db 25, SHELLDER
	db 25, STARYU
	; nite/evn
	db 25, KRABBY
	db 25, GOLBAT
	db 25, POLIWHIRL
	db 25, SHELLDER
	db 25, STARYU
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_SE
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 23, KRABBY
	db 23, GOLBAT
	db 23, SEEL
	db 23, SHELLDER
	db 23, STARYU
	; nite/evn
	db 23, KRABBY
	db 23, GOLBAT
	db 23, SEEL
	db 23, SHELLDER
	db 23, STARYU
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_B1F
	db 7 percent, 7 percent, 7 percent, 7 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 28, KINGLER
	db 28, GOLBAT
	db 28, SEEL
	db 28, SHELLDER
	db 28, STARYU
	; nite/evn
	db 28, KINGLER
	db 28, GOLBAT
	db 28, POLIWHIRL
	db 28, SHELLDER
	db 28, STARYU
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_B2F
	db 7 percent, 7 percent, 7 percent, 7 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 30, KINGLER
	db 30, GOLBAT
	db 30, SEEL
	db 30, SHELLDER
	db 30, STARYU
	; nite/evn
	db 30, KINGLER
	db 30, GOLBAT
	db 30, POLIWHIRL
	db 30, SHELLDER
	db 30, STARYU
	end_grass_wildmons

	def_grass_wildmons WHIRL_ISLAND_LUGIA_CHAMBER
	db 8 percent, 8 percent, 8 percent, 8 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 35, KINGLER
	db 35, CROBAT
	db 35, DEWGONG
	db 35, CLOYSTER
	db 35, STARMIE
	; nite/evn
	db 35, KINGLER
	db 35, CROBAT
	db 35, DEWGONG
	db 35, CLOYSTER
	db 35, STARMIE
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ROOM_1
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 45, GOLEM
	db 45, URSARING
	db 45, GOLDUCK
	db 45, DONPHAN
	db 20, LARVITAR
	; nite/evn
	db 45, CROBAT
	db 45, GOLEM
	db 45, GOLDUCK
	db 45, DONPHAN
	db 45, MISDREAVUS
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ROOM_2
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 48, GOLEM
	db 48, MACHAMP
	db 48, URSARING
	db 48, PARASECT
	db 25, LARVITAR
	; nite/evn
	db 48, CROBAT
	db 48, GOLDUCK
	db 48, PARASECT
	db 48, DONPHAN
	db 48, MISDREAVUS
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ROOM_3
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 50, CROBAT
	db 50, DONPHAN
	db 50, GOLEM
	db 25, LARVITAR
	db 30, PUPITAR
	; nite/evn
	db 50, CROBAT
	db 50, GOLDUCK
	db 50, GOLEM
	db 50, PARASECT
	db 50, MISDREAVUS
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_ITEM_ROOMS
	db 6 percent, 6 percent, 6 percent, 6 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 50, CROBAT
	db 50, QUAGSIRE
	db 50, GOLDUCK
	db 50, PARASECT
	db 50, URSARING
	; nite/evn
	db 50, CROBAT
	db 50, MISDREAVUS
	db 50, GOLDUCK
	db 50, PARASECT
	db 50, DONPHAN
	end_grass_wildmons

	def_grass_wildmons DARK_CAVE_VIOLET_ENTRANCE
	db 3 percent, 3 percent, 4 percent, 4 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 4, GEODUDE
	db 4, ZUBAT
	db 4, GEODUDE
	db 4, TEDDIURSA
	db 4, DUNSPARCE
	; nite/evn
	db 4, GEODUDE
	db 4, ZUBAT
	db 4, ZUBAT
	db 4, GASTLY
	db 4, DUNSPARCE
	end_grass_wildmons

	def_grass_wildmons DARK_CAVE_BLACKTHORN_ENTRANCE
	db 4 percent, 4 percent, 5 percent, 5 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 28, GOLBAT
	db 28, GRAVELER
	db 30, URSARING
	db 28, ONIX
	db 27, TEDDIURSA
	; nite/evn
	db 28, GOLBAT
	db 28, GRAVELER
	db 30, ONIX
	db 28, HAUNTER
	db 28, WOBBUFFET
	end_grass_wildmons

	def_grass_wildmons ROUTE_29
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 2, PIDGEY
	db 2, RATTATA
	db 2, SENTRET
	db 2, PIDGEY
	db 2, HOPPIP
	; nite/evn
	db 2, HOOTHOOT
	db 2, RATTATA
	db 2, HOOTHOOT
	db 2, RATTATA
	db 2, SENTRET
	end_grass_wildmons

	def_grass_wildmons ROUTE_30
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 3, CATERPIE
	db 3, LEDYBA
	db 3, PIDGEY
	db 3, WEEDLE
	db 3, HOPPIP
	; nite/evn
	db 3, HOOTHOOT
	db 3, SPINARAK
	db 3, POLIWAG
	db 3, HOOTHOOT
	db 3, ODDISH
	end_grass_wildmons

	def_grass_wildmons ROUTE_31
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 4, CATERPIE
	db 4, LEDYBA
	db 4, BELLSPROUT
	db 4, WEEDLE
	db 4, HOPPIP
	; nite/evn
	db 4, POLIWAG
	db 4, SPINARAK
	db 4, HOOTHOOT
	db 4, HOOTHOOT
	db 4, ODDISH
	end_grass_wildmons

	def_grass_wildmons ROUTE_32
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 6, EKANS
	db 6, RATTATA
	db 6, BELLSPROUT
	db 6, MAREEP
	db 6, HOPPIP
	; nite/evn
	db 6, WOOPER
	db 6, RATTATA
	db 6, BELLSPROUT
	db 6, HOOTHOOT
	db 6, ODDISH
	end_grass_wildmons

	def_grass_wildmons ROUTE_33
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 8, SPEAROW
	db 8, RATTATA
	db 8, EKANS
	db 8, NIDORAN_M
	db 8, NIDORAN_F
	; nite/evn
	db 8, HOOTHOOT
	db 8, RATTATA
	db 8, SPINARAK
	db 8, NIDORAN_F
	db 8, NIDORAN_M
	end_grass_wildmons

	def_grass_wildmons ROUTE_34
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 10, SNUBBULL
	db 10, RATTATA
	db 10, ABRA
	db 10, JIGGLYPUFF
	db 10, DITTO
	; nite/evn
	db 10, HOOTHOOT
	db 10, DROWZEE
	db 10, ABRA
	db 10, JIGGLYPUFF
	db 10, DITTO
	end_grass_wildmons

	def_grass_wildmons ROUTE_35
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 11, SNUBBULL
	db 11, GROWLITHE
	db 11, ABRA
	db 11, JIGGLYPUFF
	db 11, YANMA
	; nite/evn
	db 11, DROWZEE
	db 11, PSYDUCK
	db 11, ABRA
	db 11, JIGGLYPUFF
	db 11, YANMA
	end_grass_wildmons

	def_grass_wildmons ROUTE_36
	db 9 percent, 9 percent, 8 percent, 8 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 5, SPEAROW
	db 5, BELLSPROUT
	db 5, NIDORAN_M
	db 5, NIDORAN_F
	db 5, GROWLITHE
	; nite/evn
	db 5, HOOTHOOT
	db 5, SPINARAK
	db 5, NIDORAN_F
	db 5, NIDORAN_M
	db 5, VULPIX
	end_grass_wildmons

	def_grass_wildmons ROUTE_37
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 14, STANTLER
	db 13, LEDYBA
	db 13, PIDGEY
	db 13, SPEAROW
	db 13, VULPIX
	; nite/evn
	db 14, STANTLER
	db 13, SPINARAK
	db 13, HOOTHOOT
	db 14, VULPIX
	db 13, NATU
	end_grass_wildmons

	def_grass_wildmons ROUTE_38
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 16, RATTATA
	db 16, SPEAROW
	db 16, MAGNEMITE
	db 16, TAUROS
	db 16, MILTANK
	; nite/evn
	db 16, MEOWTH
	db 16, RATTATA
	db 16, MAGNEMITE
	db 16, HOOTHOOT
	db 16, MEOWTH
	end_grass_wildmons

	def_grass_wildmons ROUTE_39
	db 9 percent, 9 percent, 8 percent, 8 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 16, RATTATA
	db 16, SPEAROW
	db 16, MAGNEMITE
	db 16, TAUROS
	db 16, MILTANK
	; nite/evn
	db 16, MEOWTH
	db 16, RATTATA
	db 16, MAGNEMITE
	db 16, HOOTHOOT
	db 16, MEOWTH
	end_grass_wildmons

	def_grass_wildmons ROUTE_42
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 18, EKANS
	db 17, SPEAROW
	db 18, MANKEY
	db 18, FLAAFFY
	db 18, MACHOP
	; nite/evn
	db 18, ZUBAT
	db 18, MANKEY
	db 18, FLAAFFY
	db 18, MACHOP
	db 15, MARILL
	end_grass_wildmons

	def_grass_wildmons ROUTE_43
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 20, FURRET
	db 20, PIDGEOTTO
	db 20, FARFETCH_D
	db 20, FLAAFFY
	db 20, GIRAFARIG
	; nite/evn
	db 20, VENONAT
	db 20, NOCTOWL
	db 20, RATICATE
	db 20, MURKROW
	db 20, GIRAFARIG
	end_grass_wildmons

	def_grass_wildmons ROUTE_44
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 22, LICKITUNG
	db 22, TANGELA
	db 22, WEEPINBELL
	db 22, SKIPLOOM
	db 22, AIPOM
	; nite/evn
	db 22, GLOOM
	db 22, TANGELA
	db 22, WEEPINBELL
	db 21, PARAS
	db 22, CUBONE
	end_grass_wildmons

	def_grass_wildmons ROUTE_45
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 27, PRIMEAPE
	db 27, GLIGAR
	db 28, DONPHAN
	db 27, SKARMORY
	db 22, PHANPY
	; nite/evn
	db 27, GRAVELER
	db 25, CUBONE
	db 27, GLIGAR
	db 27, MURKROW
	db 28, MAROWAK
	end_grass_wildmons

	def_grass_wildmons ROUTE_46
	db 10 percent, 10 percent, 9 percent, 9 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 3, SPEAROW
	db 3, GEODUDE
	db 3, RATTATA
	db 3, NIDORAN_M
	db 3, NIDORAN_F
	; nite/evn
	db 3, HOOTHOOT
	db 3, GEODUDE
	db 3, RATTATA
	db 3, NIDORAN_F
	db 3, NIDORAN_M
	end_grass_wildmons

	def_grass_wildmons SILVER_CAVE_OUTSIDE ; Route 28
	db 12 percent, 12 percent, 12 percent, 12 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 41, TANGELA
	db 37, PONYTA
	db 41, ARBOK
	db 41, RAPIDASH
	db 41, DODRIO
	; nite/evn
	db 41, POLITOED
	db 41, TANGELA
	db 41, GOLBAT
	db 41, HOUNDOOM
	db 41, SKARMORY
	end_grass_wildmons

	db -1 ; end
