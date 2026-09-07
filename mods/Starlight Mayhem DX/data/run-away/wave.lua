local amplitude = 15
local speed = 5

local startTime = 44835
local baseY = {}

function onCreatePost()
    for i = 4, 7 do
        baseY[i] = getPropertyFromGroup('strumLineNotes', i, 'y')
    end
end

function onUpdate(elapsed)
    local songTime = getSongPosition()

    if songTime >= startTime then
        local time = songTime / 1000

        for i = 4, 7 do
            local offset = math.sin(time * speed + i * 0.5) * amplitude

            setPropertyFromGroup(
                'strumLineNotes',
                i,
                'y',
                baseY[i] + offset
            )
        end
    end
end