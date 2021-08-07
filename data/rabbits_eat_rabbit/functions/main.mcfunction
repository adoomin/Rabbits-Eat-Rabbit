scoreboard objectives add ReRExcOnce dummy
scoreboard objectives add ReR dummy

#Initial Entity Tag
execute as @e[type=minecraft:rabbit,tag=!ReRExcOnce] at @s if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:rabbit"}},distance=0..0.5] run tag @s add ReR
execute as @e[type=minecraft:rabbit,tag=!ReRExcOnce] at @s if entity @e[type=minecraft:item,nbt={Item:{id:"minecraft:cooked_rabbit"}},distance=0..0.5] run tag @s add ReR

#Execute Once
scoreboard players add @e[tag=ReR,tag=!ReRExcOnce] ReRExcOnce 1
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:rabbit"}}] at @s run data merge entity @e[tag=ReR,distance=0..0.5,limit=1] {Silent:1b,NoAI:1b}
execute as @e[type=minecraft:item,nbt={Item:{id:"minecraft:cooked_rabbit"}}] at @s run data merge entity @e[tag=ReR,distance=0..0.5,limit=1] {Silent:1b,NoAI:1b}
execute as @e[tag=ReR,tag=!ReRExcOnce] at @s run particle minecraft:angry_villager ~ ~ ~ 0 0 0 0.1 1 normal
execute as @e[tag=ReR,tag=!ReRExcOnce] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:rabbit"}},distance=0..0.5]
execute as @e[tag=ReR,tag=!ReRExcOnce] at @s run kill @e[type=minecraft:item,nbt={Item:{id:"minecraft:cooked_rabbit"}},distance=0..0.5]

tag @e[scores={ReRExcOnce=1..},tag=!ReRExcOnce] add ReRExcOnce
scoreboard players reset @e[tag=ReRExcOnce] ReRExcOnce
tag @e[scores={ReRExcOnce=0}] remove ReRExcOnce

#Loop
scoreboard players add @e[tag=ReR,tag=!ReRMurder] ReR 1
execute as @e[tag=ReR,tag=!ReRMurder,scores={ReR=..60}] at @s run effect give @s minecraft:resistance 1 255 true
execute as @e[tag=ReR,tag=!ReRMurder,scores={ReR=61}] run data merge entity @s {NoAI:0b,RabbitType:99}
execute as @e[tag=ReR,tag=!ReRMurder,scores={ReR=61}] at @s run particle minecraft:firework ~ ~ ~ 0 0 0 0.3 50 normal
execute as @e[tag=ReR,tag=!ReRMurder,scores={ReR=61}] at @s run playsound minecraft:entity.wither.spawn block @p
tag @e[tag=ReR,tag=!ReRMurder,scores={ReR=61}] add ReRMurder
execute as @e[tag=ReR,tag=ReRMurder] at @s run effect give @s minecraft:resistance 1 3 true
execute as @e[tag=ReR,tag=ReRMurder] at @s run effect give @s minecraft:speed 1 5 true
execute as @e[tag=ReR,tag=ReRMurder] at @s run particle dust 1.000 0.000 0.000 1 ~ ~2 ~ 1 1 1 1 2 normal