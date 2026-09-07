local camMove = 15 -- intensidade do movimento
local camReturn = true

function onCreate()

    setProperty('camFollow.x', getProperty('camFollow.x'))
    setProperty('camFollow.y', getProperty('camFollow.y'))

end


function moveCamera(direction)

    local x = getProperty('camFollow.x')
    local y = getProperty('camFollow.y')


    if direction == 0 then -- esquerda
        setProperty('camFollow.x', x - camMove)

    elseif direction == 1 then -- baixo
        setProperty('camFollow.y', y + camMove)

    elseif direction == 2 then -- cima
        setProperty('camFollow.y', y - camMove)

    elseif direction == 3 then -- direita
        setProperty('camFollow.x', x + camMove)

    end


    if camReturn then
        runTimer('returnCam',0.08)
    end

end



-- BF acertando notas
function goodNoteHit(id, direction, noteType, isSustainNote)

    if not isSustainNote then
        moveCamera(direction)
    end

end



-- DEV acertando notas
function opponentNoteHit(id, direction, noteType, isSustainNote)

    if not isSustainNote then
        moveCamera(direction)
    end

end



function onTimerCompleted(tag)

    if tag == 'returnCam' then

        triggerEvent('Camera Follow Pos','','')

    end

end