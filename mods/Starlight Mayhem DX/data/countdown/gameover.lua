

--hscript was being weird so im doing this in lua ig?
local timer = 20
local startcounting = false
local countdowntime = 0
function onCreatePost()
    precacheImage("gameover/gameover", true)
end
function onGameOverStart()
    setProperty("isEnding",true)

    setProperty("boyfriend.visible",false)
    makeAnimatedLuaSprite("gameover", 'gameover/sonic1')
    addAnimationByPrefix("gameover", "1", "1",8)
    addAnimationByPrefix("gameover", "2", "2",8)
    addAnimationByPrefix("gameover", "3", "3",12)
    addAnimationByPrefix("gameover", "4", "4",24)
    addAnimationByPrefix("gameover", "5", "5",12)
    playAnim("gameover", "1")
    scaleObject("gameover", 8.0, 8.0, true)
    setScrollFactor("gameover", 0,0)
    addLuaSprite("gameover")
    screenCenter("gameover", 'xy')
    setProperty('gameover.antialiasing',false)
    setProperty('gameover.alpha',0)

    setPropertyFromClass('flixel.FlxG', 'camera.x', 0)
	setPropertyFromClass('flixel.FlxG', 'camera.y', 0)
	setPropertyFromClass('flixel.FlxG', 'camera.zoom', 1)

    runTimer("start",1)

    makeLuaText("countdown", "10", screenWidth, 0, 200)
    setTextSize("countdown", 48)
    setScrollFactor('countdown',0,0)
    addLuaText("countdown")
    setTextFont("countdown", "sonic-1-hud-font.ttf")
    setTextBorder("countdown", 0, "")
    setProperty('countdown.alpha',0)


    makeLuaText("retry", "RETRY?", screenWidth, 0, 600)
    setTextSize("retry", 64)
    setScrollFactor('retry',0,0)
    addLuaText("retry")
    setTextFont("retry", "sonic-1-hud-font.ttf")
    setTextBorder("retry", 0, "")
    setProperty('retry.alpha',0)

end


function onTimerCompleted(r)
    if r == 'start' then
        doTweenAlpha("tween", "gameover", 1, 3)

    end
    
end

function onTweenCompleted(r)
    if r == 'tween' then
        doTweenAlpha("tween2", "countdown", 1, 3)
        doTweenAlpha("tween3", "retry", 1, 3)
        startcounting = true
    end
    if r == 'byecount' then
        runHaxeCode([[
            FlxG.resetState();
        ]])
    end
    
end


function onUpdate(elapsed)

    countdowntime = math.floor(timer/2)
    if countdowntime == 0 then
        runHaxeCode([[
            Sys.exit(0);
        ]])
        --startcounting = false
        setProperty('countdown.alpha',0)
        setProperty('gameover.alpha',0)
        setProperty('retry.alpha',0)
    end
    setTextString("countdown", "-"..countdowntime..'-')
    if startcounting then
        timer = timer - elapsed
        if countdowntime ~= 0 and keyJustPressed('accept') then
            startcounting = false
            doTweenAlpha("byecount", "countdown", 0, 0.01)
            doTweenAlpha("byeretry", "retry", 0, 0.01)
            doTweenAlpha("byesonic", "gameover", 0, 0.01)
        end
    end


    if timer <= 2.25 then
        playAnim("gameover", "5")
    elseif timer <= 4 then
        playAnim("gameover", "4")
    elseif timer <= 10 then
        playAnim("gameover", "3") 
    elseif timer <= 15 then
        playAnim("gameover", "2") 
    end
end