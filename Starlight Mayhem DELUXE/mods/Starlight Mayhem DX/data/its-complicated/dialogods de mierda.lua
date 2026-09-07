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
    "Thank you for coming out here CJ, I know you are busy, but this request I have for you is a bit important.",
    "Yeah what's up Ruby, ready for some 1 on 1 practice?",
    "Not quite, you see, I have been writing a song... a song for Mark!",
    "Something special for our anniversary, to thank him for everything he has done for me.",
    "I wanted to write something sentimental and happy, but I'm not sure if the song is going in the right place though.",
    "The feeling of the song is all... complicated.",
    "So you want me to help you with it?",
    "Yeah... I want this to be perfect... just for him.",
    "I see, well Ruby, you called the right guy for the job!",
    "Let's make this the best song ever! Just for Mark! Now show me what you got!",
    "A-Alright"
}

local imageMap = {
    [7] = 11,
    [10] = 12,
    [15] = 13,    
    [21] = 14,
    [24] = 15,
}

local characterMap = {
    [1] = 'ruby', 
    [2] = 'cj',   
    [3] = 'ruby', 
    [4] = 'ruby', 
    [5] = 'ruby', 
    [6] = 'ruby',   
    [7] = 'cj',   
    [8] = 'ruby', 
    [9] = 'cj',  
    [10] = 'cj',  
    [11] = 'ruby'
}

function onUpdate(elapsed)
    imagenzz = 'PRESSONGCUTSCENE'
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

                        setTextString('cmamoxdxd', dialogueText[dialogo])
                        triggerEvent('Set GF Speed', dialogueText[dialogo])
                        playDialogueSound(dialogo)
                    end
                end
            end

            if dialogo >= 12 and dialogo < 35 then
                dialogo = 80
                doTweenAlpha('jXXDF', 'cmamoxdxd', 0, 0.25, 'linear')
                doTweenAlpha('j3f1f31f3', 'PRESSONGCUTSCENE', 0, 0.5, 'linear')
                doTweenAlpha('jfrasasdasdasdgr', 'White4', 0, 0.25, 'linear')
                doTweenAlpha('jfraadaddzzzsdadsgr', 'tags', 0, 0.25, 'linear')
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
        'dialogos/complicated/RUBY1', 'dialogos/complicated/CJ1', 'dialogos/complicated/RUBY2', 'dialogos/complicated/RUBY3',
        'dialogos/complicated/RUBY4', 'dialogos/complicated/RUBY5', 'dialogos/complicated/CJ2', 'dialogos/complicated/RUBY6',
        'dialogos/complicated/CJ3', 'dialogos/complicated/CJ4', 'dialogos/complicated/RUBY7'
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
        startCountdown()
    end
    if tag == 'thing' then
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
imagenzz = 'PRESSONGCUTSCENE'

function onStartCountdown()
    if eme == false then
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
function onEndSong()
addLuaScript('data/its-complicated/Nueva carpeta/dialogods de mierda - copia')
end