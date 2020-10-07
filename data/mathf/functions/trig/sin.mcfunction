
#> Sine
#  Input (degrees at Scale 100) = i0 mathf.io
#  Output (number from 0-1 at Scale 1000) = o0 mathf.io

scoreboard players operation i0 mathf.io %= #36000 mathf.const
execute if score i0 mathf.io matches 9001..18000 run function mathf:trig/private/i-90-180
execute if score i0 mathf.io matches 18001..27000 run function mathf:trig/private/i-180-270
execute if score i0 mathf.io matches 27001..36000 run function mathf:trig/private/i-270-360


function mathf:deg-to-rad
scoreboard players operation temp mathf.data = o0 mathf.io


scoreboard players operation sinPower mathf.data = temp mathf.data
scoreboard players set powerCount mathf.data 1
function mathf:trig/private/sin-loop

scoreboard players operation t1 mathf.data = angPow3 mathf.data
scoreboard players operation t1 mathf.data /= #6 mathf.const

scoreboard players operation t2 mathf.data = angPow5 mathf.data
scoreboard players operation t2 mathf.data /= #120 mathf.const

scoreboard players operation t3 mathf.data = angPow7 mathf.data
scoreboard players operation t3 mathf.data /= #5040 mathf.const

scoreboard players operation t4 mathf.data = angPow9 mathf.data
scoreboard players operation t4 mathf.data /= #362880 mathf.const


scoreboard players operation temp mathf.data -= t1 mathf.data
scoreboard players operation temp mathf.data += t2 mathf.data
scoreboard players operation temp mathf.data -= t3 mathf.data
scoreboard players operation temp mathf.data += t4 mathf.data

scoreboard players operation o0 mathf.io = temp mathf.data
