# If we want a ray that will travel a distance over time (ticks), we set that distance and call ray_tick every tick
# For example if we want a ray that travels 10b/s = 10b/20t = 0.5b/t and then end. (b = blocks, s = seconds, t = ray_tick call)
# To do this we summon an area_effect_cloud that lasts 10 ticks (Duration tag) = 0.5 /t *10 t = 5b/10 t = 10b/20t = 10b/s

# Summon each diferent ray. In this example, we let the ray follow the player's sight
execute as @a[nbt={SelectedItem:{id:"minecraft:stick"}}] at @s run function mrcd:example/ray_simple
execute as @a[nbt={SelectedItem:{id:"minecraft:blaze_rod"}}] at @s run function mrcd:example/ray_bullet
execute as @a[nbt={SelectedItem:{id:"minecraft:bone"}}] at @s run function mrcd:example/ray_entity
execute if entity @a[nbt={SelectedItem:{id:"minecraft:bamboo"}}] run tag @e[type=armor_stand] add mrcd_target
execute as @a[nbt={SelectedItem:{id:"minecraft:bamboo"}}] at @s run function mrcd:example/ray_entity_targeted
execute as @a[nbt={SelectedItem:{id:"minecraft:arrow"}}] at @s run function mrcd:example/ray_bullet_entity_multiple
execute as @a[nbt={SelectedItem:{id:"minecraft:spectral_arrow"}}] at @s run function mrcd:example/bullet_entity

# The best way to cast an instant ray is not setting any duration of the AEC (then it only lasts for 1 gametick), so we can save the length of cammands
execute as @a[nbt={SelectedItem:{id:"minecraft:feather"}}] at @s run function mrcd:example/bullet_entity_instant

# Tick each ray and then do something
execute as @e[tag=test_mark] at @s run function mrcd:example/tick_rays

# Clear glowing after x seconds
effect clear @e[nbt={ActiveEffects:[{Id:24,Duration:19}]}] glowing

# Remove target entities for entity_targeted ray
tag @e[type=armor_stand] remove mrcd_target