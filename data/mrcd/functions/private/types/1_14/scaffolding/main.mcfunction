scoreboard players set #box_x0 mrcd_system 0
scoreboard players set #box_y0 mrcd_system 875
scoreboard players set #box_z0 mrcd_system 0
scoreboard players set #box_x1 mrcd_system 1000
scoreboard players set #box_y1 mrcd_system 1000
scoreboard players set #box_z1 mrcd_system 1000
function mrcd:private/complex_cube/main

scoreboard players set #box_x0 mrcd_system 0
scoreboard players set #box_y0 mrcd_system 0
scoreboard players set #box_z0 mrcd_system 0
scoreboard players set #box_x1 mrcd_system 125
scoreboard players set #box_y1 mrcd_system 875
scoreboard players set #box_z1 mrcd_system 125
function mrcd:private/complex_cube/main

scoreboard players set #box_x0 mrcd_system 875
scoreboard players set #box_y0 mrcd_system 0
scoreboard players set #box_z0 mrcd_system 0
scoreboard players set #box_x1 mrcd_system 1000
scoreboard players set #box_y1 mrcd_system 875
scoreboard players set #box_z1 mrcd_system 125
function mrcd:private/complex_cube/main

scoreboard players set #box_x0 mrcd_system 0
scoreboard players set #box_y0 mrcd_system 0
scoreboard players set #box_z0 mrcd_system 875
scoreboard players set #box_x1 mrcd_system 125
scoreboard players set #box_y1 mrcd_system 875
scoreboard players set #box_z1 mrcd_system 1000
function mrcd:private/complex_cube/main

scoreboard players set #box_x0 mrcd_system 875
scoreboard players set #box_y0 mrcd_system 0
scoreboard players set #box_z0 mrcd_system 875
scoreboard players set #box_x1 mrcd_system 1000
scoreboard players set #box_y1 mrcd_system 875
scoreboard players set #box_z1 mrcd_system 1000
function mrcd:private/complex_cube/main

execute if block ~ ~ ~ scaffolding[bottom=true] run function mrcd:private/types/1_14/scaffolding/bottom

execute if entity @e[tag=mrcd_touch_mark] run tag @s add mrcd_touch_edge
execute if entity @e[tag=mrcd_touch_mark] run tag @s add mrcd_touch_edge_complex


tag @s add mrcd_block_collision_done