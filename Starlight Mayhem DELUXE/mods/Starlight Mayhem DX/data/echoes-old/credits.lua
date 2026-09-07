local triggered = false

function onCreatePost()

    -- CAIXA PRETA
    makeLuaSprite('creditBG', nil, 0, 0)
    makeGraphic('creditBG', 650, 150, '000000')
    setProperty('creditBG.alpha', 0.65)
    setObjectCamera('creditBG', 'hud')
    addLuaSprite('creditBG', true)

    -- TÍTULO
    makeLuaText('creditTitle', 'ECHOES (Old) DX', 650, 0, 0)
    setTextSize('creditTitle', 36)
    setTextFont('creditTitle', 'vcr.ttf')
    setTextAlignment('creditTitle', 'center')
    setObjectCamera('creditTitle', 'hud')
    addLuaText('creditTitle')

    -- COMPOSER
    makeLuaText('creditSub', 'Cover Composer: Ale_GamePlayer', 650, 0, 0)
    setTextSize('creditSub', 22)
    setTextFont('creditSub', 'vcr.ttf')
    setTextAlignment('creditSub', 'center')
    setObjectCamera('creditSub', 'hud')
    addLuaText('creditSub')

    -- ORIGEM
    makeLuaText('creditOrigin', [[Original Source: Friday Night Funkin': Vs CJ]], 650, 0, 0)
    setTextSize('creditOrigin', 18)
    setTextFont('creditOrigin', 'vcr.ttf')
    setTextAlignment('creditOrigin', 'center')
    setObjectCamera('creditOrigin', 'hud')
    addLuaText('creditOrigin')

    -- CENTRALIZAÇÃO
    local x = (screenWidth - 650) / 2
    local y = (screenHeight - 150) / 2

    setProperty('creditBG.x', x)
    setProperty('creditBG.y', y)

    setProperty('creditTitle.x', x)
    setProperty('creditTitle.y', y + 10)

    setProperty('creditSub.x', x)
    setProperty('creditSub.y', y + 50)

    setProperty('creditOrigin.x', x)
    setProperty('creditOrigin.y', y + 85)

    -- invisível inicial
    setProperty('creditBG.alpha', 0)
    setProperty('creditTitle.alpha', 0)
    setProperty('creditSub.alpha', 0)
    setProperty('creditOrigin.alpha', 0)

end

function opponentNoteHit()
    if triggered then return end
    triggered = true

    -- ENTRADA
    doTweenAlpha('bgIn', 'creditBG', 0.65, 0.25, 'quadOut')
    doTweenAlpha('tIn', 'creditTitle', 1, 0.25, 'quadOut')
    doTweenAlpha('sIn', 'creditSub', 1, 0.25, 'quadOut')
    doTweenAlpha('oIn', 'creditOrigin', 1, 0.25, 'quadOut')

    runTimer('hideCredits', 3)
end

function onTimerCompleted(tag)
    if tag == 'hideCredits' then

        doTweenAlpha('bgOut', 'creditBG', 0, 0.35, 'quadIn')
        doTweenAlpha('tOut', 'creditTitle', 0, 0.35, 'quadIn')
        doTweenAlpha('sOut', 'creditSub', 0, 0.35, 'quadIn')
        doTweenAlpha('oOut', 'creditOrigin', 0, 0.35, 'quadIn')

    end
end

function onTweenCompleted(tag)
    if tag == 'bgOut' then
        removeLuaSprite('creditBG', true)
        removeLuaText('creditTitle', true)
        removeLuaText('creditSub', true)
        removeLuaText('creditOrigin', true)
    end
end