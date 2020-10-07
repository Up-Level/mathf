
#> Rotation to Vector
#  Input is as follows:
#  x Rotation (Scale 100) = inp0 mathf.io
#  y Rotation (Scale 100) = inp1 mathf.io
#  
#  Output is as follows:
#  Vector x (Scale 100) = out0 mathf.io
#  Vector y (Scale 100) = out1 mathf.io
#  Vector z (Scale 100) = out2 mathf.io

# Cheat by using minecraft's ^ coord system
summon armor_stand 0 16 2000 {Tags:["rotDummy","mathf.entity0"],Invulnerable:1b,Invisible:1b,Marker:1b}
execute store result entity @e[tag=mathf.entity0,limit=1] Rotation[0] float 0.01 run scoreboard players get inp0 mathf.io
execute store result entity @e[tag=mathf.entity0,limit=1] Rotation[1] float 0.01 run scoreboard players get inp1 mathf.io

execute as @e[tag=mathf.entity0,limit=1] at @s run summon armor_stand ^ ^ ^1 {Tags:["rotDummy","mathf.entity1"],Invulnerable:1b,Invisible:1b,Marker:1b}

function mathf:minecraft/vector-between-entities

kill @e[tag=rotDummy]

execute if score debugInfo mathf.config matches 1 run tellraw @a ["Vector: (",{"score":{"name":"out0","objective":"mathf.io"}},", ", {"score":{"name":"out1","objective":"mathf.io"}},", ", {"score":{"name":"out2","objective":"mathf.io"}},")"]
