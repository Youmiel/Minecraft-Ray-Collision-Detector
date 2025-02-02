# === Do something before ticking ===
# trace ray path
# execute if entity @s[tag=test_mark] run particle mycelium ~ ~ ~ 0 0 0 0 1 force
# execute if entity @s[tag=mrcd_bullet] run particle wax_on ~ ~ ~ 0 0 0 0 1 force
# execute if entity @s[tag=mrcd_entity] run particle wax_off ~ ~ ~ 0 0 0 0 1 force
# execute if entity @s[tag=mrcd_entity_targeted] run particle scrape ~ ~ ~ 0 0 0 0 1 force
# execute if entity @s[tag=mrcd_entity_bullet] run particle enchanted_hit ~ ~ ~ 0 0 0 0 1 force

# === Ray tick ===
function mrcd:ray_tick

# === Do something after ticking ===
# trace ray path
execute if entity @s[tag=instant] at @s run particle end_rod ~ ~ ~ 0 0 0 0 1 force
execute if entity @s[tag=instant_marker] at @s run particle end_rod ~ ~ ~ 0 0 0 0 1 force

# Check entity hit
effect give @e[tag=mrcd_target_entity] glowing 1 0 true

# Check block hit
# execute as @e[tag=mrcd_touch_edge,tag=mrcd_touch_x_plus] at @s run say touched x+
# execute as @e[tag=mrcd_touch_edge,tag=mrcd_touch_x_minus] at @s run say touched x-
# execute as @e[tag=mrcd_touch_edge,tag=mrcd_touch_y_plus] at @s run say touched y+
# execute as @e[tag=mrcd_touch_edge,tag=mrcd_touch_y_minus] at @s run say touched y-
# execute as @e[tag=mrcd_touch_edge,tag=mrcd_touch_z_plus] at @s run say touched z+
# execute as @e[tag=mrcd_touch_edge,tag=mrcd_touch_z_minus] at @s run say touched z-

execute if entity @s[tag=mrcd_touch_edge] at @s run particle small_flame ~ ~ ~ 0 0 0 0 1 force
execute if entity @s[tag=mrcd_touch_entity] at @s run particle small_flame ~ ~ ~ 0 0 0 0 1 force

execute store result score aecCount test if entity @e[tag=mrcd_touch_y_plus, tag=mrcd_touch_edge]

# Once hited remove
kill @s[tag=mrcd_touch_edge]
kill @s[tag=mrcd_touch_entity]

# remove instant marker
kill @s[tag=instant_marker] 

# unknown reason but it works
tag @s remove test_mark 
