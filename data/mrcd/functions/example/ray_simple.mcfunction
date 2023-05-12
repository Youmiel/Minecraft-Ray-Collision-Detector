# This function adds a simple ray at the executor's position which can detect blocks.
# Call: execute as ... at ... run function ...
# 
# The steps of creating a ray along an entity's sight are as follows:
# [1] Summon the marker n blocks ahead the entity (in command, it is ^ ^ ^N)
# [2] Store the coordinates of the marker in scoreboard mrcd_x0/y0/z0 with correct scale factor
# [3] Teleport the marker to the entity's eye position and rotation (which is, tp ... ^ ^ ^ ~ ~)
# [4] Store the coordinates of the marker in temporary variables with correct scale factor (in this example, it is #var0, #var1, #var2 in mrcd_system)
# [5] Subtract the mrcd_x0/y0/z0 by the value in temporary variables
# [6] Do post-processing, e.g. remove temporary tags
#
# Generally speaking, this procedure calculates the delta vector of the marker position using local coordinates

# The speed of ray is 0.5 b/gt, since it lasts for 10 ticks (Duration), it will travel at max 5 blocks

# [1]
execute at @s anchored eyes run summon area_effect_cloud ^ ^ ^.5 {Tags:["test_mark","init","mrcd_ignore"],Duration:10}

# [2]
execute as @e[tag=init,limit=1] store result score @s mrcd_x0 run data get entity @s Pos[0] 1000
execute as @e[tag=init,limit=1] store result score @s mrcd_y0 run data get entity @s Pos[1] 1000
execute as @e[tag=init,limit=1] store result score @s mrcd_z0 run data get entity @s Pos[2] 1000

# [3]
execute at @s anchored eyes run tp @e[tag=init,limit=1] ^ ^ ^ ~ ~

# [4] [5]
execute store result score #var0 mrcd_system run data get entity @e[tag=init,limit=1] Pos[0] 1000
execute store result score #var1 mrcd_system run data get entity @e[tag=init,limit=1] Pos[1] 1000
execute store result score #var2 mrcd_system run data get entity @e[tag=init,limit=1] Pos[2] 1000
scoreboard players operation @e[tag=init,limit=1] mrcd_x0 -= #var0 mrcd_system
scoreboard players operation @e[tag=init,limit=1] mrcd_y0 -= #var1 mrcd_system
scoreboard players operation @e[tag=init,limit=1] mrcd_z0 -= #var2 mrcd_system

# [6]
tag @e[tag=init] remove init
