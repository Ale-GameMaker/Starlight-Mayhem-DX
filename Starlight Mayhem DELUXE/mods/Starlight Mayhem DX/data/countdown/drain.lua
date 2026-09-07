local drainAmount = 0.02
local minHealth = 0.3

function opponentNoteHit()
    local health = getProperty('health')

    health = health - drainAmount

    if health < minHealth then
        health = minHealth
    end

    setProperty('health', health)
end