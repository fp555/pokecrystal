; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/types/type_matchups.asm)
; - TypeBoostItems (see data/types/type_boost_items.asm)
	const_def
	const NORMAL
	const FIGHTING
	const FLYING
	const POISON
	const GROUND
	const ROCK
	const BUG
	const GHOST
	const STEEL
	const CURSE_TYPE
	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC_TYPE
	const ICE
	const DRAGON
	const DARK
DEF NUM_TYPES EQU const_value

DEF POKEDEX_TYPE_STRING_LENGTH EQU 9

DEF TYPE_MASK EQU %00111111
DEF PHYSICAL  EQU %01000000
DEF SPECIAL   EQU %10000000
DEF STATUS    EQU %11000000