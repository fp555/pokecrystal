LoadSpecialMapPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .not_dark
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr z, .darkness
.not_dark
	ld a, [wMapTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER_INSIDE
	jr z, .battle_tower_inside
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_MANSION
	jr z, .mansion_mobile
	; do nothing
	and a
	ret
.darkness
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, .DarknessPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
.pokecom_2f
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, .PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
.battle_tower_inside
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, .BattleTowerInsidePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
.ice_path
	ld a, [wEnvironment]
	and $7
	cp INDOOR ; Hall of Fame
	ret z ; do nothing
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, .IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
.house
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, .HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
.radio_tower
	ld a, BANK(wBGPals1)
	ld de, wBGPals1
	ld hl, .RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
.mansion_mobile
	farcall LoadMansionPalette
	scf
	ret
.DarknessPalette: INCLUDE "gfx/tilesets/darkness.pal"
.PokeComPalette: INCLUDE "gfx/tilesets/pokecom_center.pal"
.BattleTowerInsidePalette: INCLUDE "gfx/tilesets/battle_tower_inside.pal"
.IcePathPalette: INCLUDE "gfx/tilesets/ice_path.pal"
.HousePalette: INCLUDE "gfx/tilesets/house.pal"
.RadioTowerPalette: INCLUDE "gfx/tilesets/radio_tower.pal"

LoadSpecialNPCPalette:
	call GetMapTimeOfDay
	bit IN_DARKNESS_F, a
	jr z, .do_nothing
	ld a, [wStatusFlags]
	bit STATUSFLAGS_FLASH_F, a
	jr nz, .do_nothing
	;darkness
	ld a, BANK(wOBPals1)
	ld de, wOBPals1
	ld hl, .NPCDarknessPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	scf
	ret
.do_nothing
	and a
	ret
.NPCDarknessPalette: INCLUDE "gfx/overworld/npc_sprites_darkness.pal"
