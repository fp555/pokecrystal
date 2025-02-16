MACRO mon_prob
; percent, index
	db \1, \2 * 2
ENDM

GrassMonProbTable:
	table_width 2
	mon_prob 35,  0 ; 35% chance
	mon_prob 65,  1 ; 30% chance
	mon_prob 85,  2 ; 20% chance
	mon_prob 95,  3 ; 10% chance
	mon_prob 100, 4 ;  5% chance
	assert_table_length NUM_GRASSMON

WaterMonProbTable:
	table_width 2
	mon_prob 60,  0 ; 60% chance
	mon_prob 90,  1 ; 30% chance
	mon_prob 100, 2 ; 10% chance
	assert_table_length NUM_WATERMON
