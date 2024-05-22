; Pokémon traded from RBY do not have held items, so GSC usually interprets the
; catch rate as an item. However, if the catch rate appears in this table, the
; item associated with the table entry is used instead.

TimeCapsule_CatchRateItems:
	db ITEM_19, LEFTOVERS
	db ITEM_2D, BITTER_BERRY
	db ITEM_32, GOLD_BERRY
	db ITEM_5A, GOLD_BERRY
	db ITEM_64, GOLD_BERRY
	db ITEM_78, GOLD_BERRY
	db ITEM_87, GOLD_BERRY
	db ITEM_BE, GOLD_BERRY
	db CURSE,   GOLD_BERRY ; was ITEM_C3
	db DIG,     GOLD_BERRY ; was ITEM_DC
	db ITEM_FA, GOLD_BERRY
	db -1,      BERRY
	db 0 ; end
