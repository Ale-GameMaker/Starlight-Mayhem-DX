dialogo = 0
personaje = ''
imagenzz = 10

function onEvent(name, value1, value2)
    if name == 'Set GF Speed' then
        runTimer('thing', 0.0075, 0)
        lol = stringSplit(value1, '')
        addLuaText('cmamoxdxd', true)
        Remove()
    end
end

function Remove()
    perras = 1
    setTextString('cmamoxdxd', '')
end

function onCreate()
    playMusic('givealilbitback', 0.75, true)
    makeLuaSprite('INTROZ', '', -950, -600)
    luaSpriteMakeGraphic('INTROZ', 3000, 3000, '000000')
    addLuaSprite('INTROZ', false)
    setProperty('INTROZ.alpha', 0)
    setObjectCamera('INTROZ', 'other')
    lol = {}
    perras = 1
    sepuede = true
    makeLuaText('cmamoxdxd', '', 955, 230, 570)
    setTextFont('cmamoxdxd', 'pfont.ttf')
    setTextAlignment('cmamoxdxd')
    setTextBorder('cmamoxdxd', 2, '000000')
    setTextColor('cmamoxdxd', 'FFFFFF')
    setTextSize('cmamoxdxd', 43)
    setObjectCamera('cmamoxdxd', 'other')
end

local dialogueText = {
    "Not bad Ruby, that was pretty good!",
    "Really??",
    "Yeah I quite liked it, I think you are going in a good direction with this song.",
    "But, you brought me here to give you some good old constructive criticism, so let me lay it on ya.",
    "You are right, the feeling of the song is all messed up, it sounds too sad for it to be an anniversary song.",
    "It almost sounded like you were trying to break up with me, even though we aren't a couple haha.",
    "*Sigh*.. Yeah figured.",
    "Don't worry Ruby! We will work on this together, and make this a great song just for your boyfriend.",
    "T-Thanks CJ! Let's do this.",
    "\"It's complicated\" is originally a song from FNF soft, it shouldn't go without mention.",
    "Thank you for playing Starlight Mayhem, and see you in week 2!"
}

local characterMap = {
    [1] = 'cj',   
    [2] = 'ruby', 
    [3] = 'cj',   
    [4] = 'cj',   
    [5] = 'cj',   
    [6] = 'cj',   
    [7] = 'ruby', 
    [8] = 'cj',   
    [9] = 'ruby', 
    [10] = 'chris', 
    [11] = 'chris'
}

function onUpdate(elapsed)
    imagenzz = 'POSTSONGCUTSCENE'
    if peneXD then
    if sepuede then
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
            dialogo = dialogo + 1
            if dialogo <= #dialogueText then
                if characterMap[dialogo] then
                    personaje = characterMap[dialogo]
                end

                if dialogo < 12 then
                    makeLuaSprite('White4', '', 0, 530)
                    luaSpriteMakeGraphic('White4', 3000, 300, '000000')
                    addLuaSprite('White4', false)
                    setObjectCamera('White4', 'other')
                    setProperty('White4.alpha', 0.5)
                 if dialogo<10 then
                    makeAnimatedLuaSprite('tags', 'cutscenes/tags', 100, 500)
                    addAnimationByPrefix('tags', 'bf', '1tags bf0000', 24, false)
                    addAnimationByPrefix('tags', 'cj', '2tags cj', 24, false)
                    addAnimationByPrefix('tags', 'gf', '3tags gf', 24, false)
                    addAnimationByPrefix('tags', 'mistery', '4tags mystery', 24, false)
                    addAnimationByPrefix('tags', 'ruby', '5tags ruby', 24, false)
                    addAnimationByPrefix('tags', 'singer', '6tags singer', 24, false)
                    addAnimationByPrefix('tags', 'vade', '7tags vade', 24, false)
                    playAnim('tags', personaje, true)
                    setObjectCamera('tags', 'other')
                    scaleObject('tags', 0.1, 0.1)
                    addLuaSprite('tags', true)
                   end
                    setTextString('cmamoxdxd', dialogueText[dialogo])
                    triggerEvent('Set GF Speed', dialogueText[dialogo])
                    playDialogueSound(dialogo)
                end
            end
        end
if dialogo>9 and dialogo < 12 then
    makeLuaSprite('cris', 'cutscenes/chris', 50, 100)
    setObjectCamera('cris', 'other')
    scaleObject('cris', 1, 1)
    addLuaSprite('cris', false)
    removeLuaSprite('tags', true)

    makeLuaSprite('White4', '', 0, 530)
    luaSpriteMakeGraphic('White4', 3000, 300, '000000')
    addLuaSprite('White4', false)
    setObjectCamera('White4', 'other')
    setProperty('White4.alpha', 0.5)
end
        if dialogo >= 12 and dialogo < 35 then
            dialogo = 80
            doTweenAlpha('jXXDF', 'cmamoxdxd', 0, 0.25, 'linear')
            doTweenAlpha('j3f1f31f3', 'POSTSONGCUTSCENE', 0, 0.5, 'linear')
            doTweenAlpha('jfrasasdasdasdgr', 'White4', 0, 0.25, 'linear')
            doTweenAlpha('jfraadaddzzzsdadsgr', 'cris', 0, 0.25, 'linear')
        end
    end
end
end
function onTweenCompleted(tag)
    if tag == 'jXXDF' then
        runTimer('j', 0.5)
    end
end

function playDialogueSound(index)
    local sounds = {
        'dialogos/complicated/CJ5', 'dialogos/complicated/RUBY8', 'dialogos/complicated/CJ6', 'dialogos/complicated/CJ7',
        'dialogos/complicated/CJ8', 'dialogos/complicated/CJ9', 'dialogos/complicated/RUBY9', 'dialogos/complicated/CJ10',
        'dialogos/complicated/RUBY10', 'dialogos/complicated/CHRIS1', 'dialogos/complicated/CJ11'
    }
    if sounds[index] then
        playSound(sounds[index], 7, 'gf1')
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'j' then
        callMethodFromClass('flixel.FlxG', 'sound.music.stop', {''})
        setProperty('camHUD.alpha', 1)
        eme = true
    endSong()
    end
    if tag == 'thingNO' then
        if lol[perras] ~= nil then
            sepuede = false
            setTextString('cmamoxdxd', getTextString('cmamoxdxd') .. lol[perras])
            perras = perras + 1
        else
            sepuede = true
        end
    end
end

eme = false
imagenzz = 'POSTSONGCUTSCENE'
peneXD=false
function onEndSong()
    if eme == false then
        peneXD=true
        if dialogo == 0 then
            makeLuaSprite(tostring(imagenzz), 'cutscenes/' .. imagenzz, 0, 0)
            scaleObject(tostring(imagenzz), 0.5, 0.5)
            setObjectCamera(tostring(imagenzz), 'other')
            addLuaSprite(tostring(imagenzz), false)
            makeLuaSprite('White4', '', 0, 530)
            luaSpriteMakeGraphic('White4', 3000, 300, '000000')
            addLuaSprite('White4', false)
            setObjectCamera('White4', 'other')
            setProperty('White4.alpha', 0.5)
        end
        return Function_Stop
    end
end
