local shown = false
local creditTime = 13241 

function onUpdatePost(elapsed)
    if not shown and getSongPosition() >= creditTime then
        shown = true

        makeLuaText('songCredits',
[[♪ Echoes DX

Cover by
Ale_GamePlayer2003


Original Song by
Miyno & Saster


From
Friday Night Funkin':
Starlight Mayhem]],
        900, 190, 120)

        setTextAlignment('songCredits', 'center')
        setTextSize('songCredits', 32)
        setTextBorder('songCredits', 2, '000000')
        setObjectCamera('songCredits', 'other')

        -- Centraliza o texto
        screenCenter('songCredits', 'xy')

        setProperty('songCredits.alpha', 0)
        addLuaText('songCredits')

        -- Fade de entrada
        doTweenAlpha('creditsIn', 'songCredits', 1, 0.5, 'linear')

        -- Fica 5 segundos na tela
        runTimer('removeCredits', 5)
    end
end

function onTimerCompleted(tag)
    if tag == 'removeCredits' then
        doTweenAlpha('creditsOut', 'songCredits', 0, 0.5, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'creditsOut' then
        removeLuaText('songCredits', true)
    end
end