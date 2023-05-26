# Calculate the intersection point coordinate
#   Plane equation: x = #box_x1
#   Condition of crossing: #box_y0 <= y <= #box_y1  #box_z0 <= z <= #box_z1


scoreboard players operation #target_x mrcd_system = #box_x1 mrcd_system
function mrcd:private/calculate/x
execute if score #target_y mrcd_system >= #box_y0 mrcd_system if score #target_y mrcd_system <= #box_y1 mrcd_system if score #target_z mrcd_system >= #box_z0 mrcd_system if score #target_z mrcd_system <= #box_z1 mrcd_system run summon marker ~ ~ ~ {Tags:["mrcd_touch_mark","mrcd_touch_cube_edge","mrcd_touch_mark_new","mrcd_touch_x_plus"]}

execute as @e[tag=mrcd_touch_mark_new] run function mrcd:private/complex_cube/move
tag @e[tag=mrcd_touch_mark_new] remove mrcd_touch_mark_new