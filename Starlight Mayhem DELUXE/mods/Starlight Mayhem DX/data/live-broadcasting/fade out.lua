local fadeStarted = false

function onCreate()
    -- Tela preta cobrindo toda a tela
    makeLuaSprite('blackScreen', nil, 0, 0)
    makeGraphic('blackScreen', screenWidth, screenHeight, '000000')
    setObjectCamera('blackScreen', 'other')
    addLuaSprite('blackScreen', true)
end

function onUpdate(elapsed)
    if not fadeStarted and getSongPosition() >= 11098 then
        fadeStarted = true

        -- Fade out da tela preta
        doTweenAlpha('blackScreenFade', 'blackScreen', 0, 1.0, 'linear')
    end
end

function onTweenCompleted(tag)
    if tag == 'blackScreenFade' then
        removeLuaSprite('blackScreen', true)
    end
end