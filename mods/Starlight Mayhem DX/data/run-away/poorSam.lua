local drainStart = 258000 -- 4:18
local drainSpeed = 0.2
local minHealth = 0.37

local draining = false

function onUpdatePost(elapsed)
    if getSongPosition() >= drainStart then
        draining = true
    end

    if draining then
        local health = getProperty('health')

        -- Drena normalmente
        health = health - (drainSpeed * elapsed)

        -- Para exatamente na faixa de perigo
        if health <= minHealth then
            health = minHealth
        end

        setProperty('health', health)
    end
end