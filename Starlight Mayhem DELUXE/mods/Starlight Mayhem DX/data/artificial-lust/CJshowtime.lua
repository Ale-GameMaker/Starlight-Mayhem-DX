local firstText = false
local secondText = false
local thirdText = false
local waitingForOpponent = false

function onCreate()
    makeLuaText('showText', '', 900, 0, 0)

    setTextSize('showText', 38)
    setTextAlignment('showText', 'center')
    setTextBorder('showText', 2, '000000')

    setObjectCamera('showText', 'hud')
    addLuaText('showText')

    setProperty('showText.alpha', 0)
end

function onCreatePost()
    if downscroll then
        setProperty('showText.y', 570)
    else
        setProperty('showText.y', 90)
    end

    screenCenter('showText', 'x')
end

function onUpdate()
    local pos = getSongPosition()

    -- HEH...
    if pos >= 17684 and not firstText then
        firstText = true

        setTextString('showText', 'Heh...')
        screenCenter('showText', 'x')
        setProperty('showText.alpha', 1)

        runTimer('hideHeh', 0.8)
    end


    -- IT'S SHOWTIME!!
    if pos >= 18552 and not secondText then
        secondText = true

        setTextString('showText', "IT'S SHOWTIME!!")
        screenCenter('showText', 'x')
        setProperty('showText.alpha', 1)

        runTimer('hideShowtime', 1.658)
    end


    -- SHOWTIME!
    if pos >= 115578 and not thirdText then
        thirdText = true
        waitingForOpponent = true

        setTextString('showText', "SHOWTIME!")
        screenCenter('showText', 'x')
        setProperty('showText.alpha', 1)
    end
end


function opponentNoteHit()
    if waitingForOpponent then
        waitingForOpponent = false

        doTweenAlpha('textFade', 'showText', 0, 0.3, 'linear')
    end
end


function onTimerCompleted(tag)
    if tag == 'hideHeh' then
        doTweenAlpha('textFade', 'showText', 0, 0.3, 'linear')

    elseif tag == 'hideShowtime' then
        doTweenAlpha('textFade', 'showText', 0, 0.3, 'linear')
    end
end