-- ============================================================
-- OPONENTE FLUTUANDO
-- ============================================================

local floatSpeed = 2.2
local floatAmount = 30

local floatTime = 0
local opponentBaseY = 0

function onCreatePost()
    opponentBaseY = getProperty('dad.y')
end

function onUpdate(elapsed)
    floatTime = floatTime + elapsed

    local offset = math.sin(floatTime * floatSpeed) * floatAmount

    setProperty('dad.y', opponentBaseY + offset)
end