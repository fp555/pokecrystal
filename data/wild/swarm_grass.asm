; Pokémon swarms in grass

SwarmGrassWildMons:
	; Dunsparce swarm
	map_id DARK_CAVE_VIOLET_ENTRANCE
	db 10 percent, 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	; nite/evn
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	db 3, DUNSPARCE
	; Yanma swarm
	map_id ROUTE_35
	db 10 percent, 10 percent, 10 percent, 10 percent ; encounter rates: morn/day/nite/evn
	; morn/day
	db 11, YANMA
	db 11, YANMA
	db 11, YANMA
	db 11, YANMA
	db 11, YANMA
	; nite/evn
	db 11, YANMA
	db 11, YANMA
	db 11, YANMA
	db 11, YANMA
	db 11, YANMA

	db -1 ; end
