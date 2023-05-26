# This function adds a ray at the executor's position which can detect blocks with hitboxes and entities instantly.
# Call: execute as ... at ... run function ...
# 
# Check mrcd:example/ray_simple for more description.

# The maximum length of ray is 5 b(/gt, as the instant AEC only lasts for 1 gametick, the acutal length is 5)

execute at @s anchored eyes run summon marker ^ ^ ^50 {Tags:["test_mark","init","mrcd_bullet","mrcd_entity","instant_marker"]}

execute as @e[tag=init,limit=1] store result score @s mrcd_x0 run data get entity @s Pos[0] 1000
execute as @e[tag=init,limit=1] store result score @s mrcd_y0 run data get entity @s Pos[1] 1000
execute as @e[tag=init,limit=1] store result score @s mrcd_z0 run data get entity @s Pos[2] 1000

execute at @s anchored eyes run tp @e[tag=init,limit=1] ^ ^ ^ ~ ~

execute store result score #var0 mrcd_system run data get entity @e[tag=init,limit=1] Pos[0] 1000
execute store result score #var1 mrcd_system run data get entity @e[tag=init,limit=1] Pos[1] 1000
execute store result score #var2 mrcd_system run data get entity @e[tag=init,limit=1] Pos[2] 1000
scoreboard players operation @e[tag=init,limit=1] mrcd_x0 -= #var0 mrcd_system
scoreboard players operation @e[tag=init,limit=1] mrcd_y0 -= #var1 mrcd_system
scoreboard players operation @e[tag=init,limit=1] mrcd_z0 -= #var2 mrcd_system

tag @e[tag=init] remove init