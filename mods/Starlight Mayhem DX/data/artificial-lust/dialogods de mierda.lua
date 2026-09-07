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
    if isStoryMode then
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
end

local dialogueText = {
    "Now that was a sick performance Ruby! You keep on improving more and more every time.",
    "Boop!",
    "I wasn't expecting that! You're definitely better than my mom.",
    "Huh?  You... mean that?!  T-thanks...",
    "Especially since it's coming from the daughter of MM herself, Its a big honor..",
    "Yet... you still beat me to it...",
    "And that’s where I come in! Haha!",
    "So, what do you say Ruby? How about we step our game up together?",
    "Pardon...?!",
    "Me and you both, taking them on 2V1!!",
    "Beep!?!",
    "That is so totally against the rules, But you can take them on, right?",
    "Boop!",
    "Alright now, let’s rock on for one final time!",
    "wait!",
    "...",
    "...",
    ".......beep?",
    "You know, on another thought…",
    "A 2 versus 1 isn't really fair, is it..?",
    "Let me join you in a duet, my love!",
    "I'm a little rusty, but remember, my genes are no joke!",
    "beep!",
    "Hmm... not bad, not bad.  Come on Girlfriend, show us what you’ve got!",
    "I'll do my best!",
    "Beep boop beep!",
    "So Ruby, do you want me to carry you just like they do?",
    "N-no thanks, it’s alright I’m fine standing up here.",
    "Sweet. Alright my dudes, let’s end this mayhem right here, right now!",
    "Y-yeah!",
    "Loser buys dinner!"
}

local imageMap = {
    [7] = 11,
    [10] = 12,
    [15] = 13,    
    [21] = 14,
    [24] = 15,
}

local characterMap = {
    [1] = 'cj',   
    [2] = 'bf',   
    [3] = 'gf',   
    [4] = 'ruby', 
    [5] = 'ruby', 
    [6] = 'ruby',   
    [7] = 'cj',   
    [8] = 'cj',   
    [9] = 'ruby', 
    [10] = 'cj',  
    [11] = 'bf',  
    [12] = 'gf',  
    [13] = 'bf',  
    [14] = 'cj',  
    [15] = 'gf',  
    [16] = 'cj',
    [17] = 'ruby',  
    [18] = 'bf',  
    [19] = 'gf',  
    [20] = 'gf',  
    [21] = 'gf',  
    [22] = 'gf',  
    [23] = 'bf',  
    [24] = 'cj',
    [25] = 'gf',  
    [26] = 'bf',
    [27] = 'cj',  
    [28] = 'ruby',
    [29] = 'cj',
    [30] = 'ruby',
    [31] = 'gf',
}

function onUpdate(elapsed)
    if isStoryMode then
        if sepuede then
            if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') then
                dialogo = dialogo + 1
                if dialogo <= #dialogueText then
                    if imageMap[dialogo] then
                        imagenzz = imageMap[dialogo]
                    end
                    if characterMap[dialogo] then
                        personaje = characterMap[dialogo]
                    end

                    if dialogo < 32 then
                        makeLuaSprite(tostring(imagenzz), 'cutscenes/' .. imagenzz, 0, 0)
                        scaleObject(tostring(imagenzz), 0.75, 0.75)
                        setObjectCamera(tostring(imagenzz), 'other')
                        addLuaSprite(tostring(imagenzz), false)

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

            if dialogo >= 32 and dialogo< 35 then
				dialogo=80
                doTweenAlpha('jXXDF', 'cmamoxdxd' , 0, 0.25, 'linear')
                removeLuaSprite('11', false)
                removeLuaSprite('12', false)
                removeLuaSprite('13', false)
                removeLuaSprite('14', false)
                removeLuaSprite('10', false)
                doTweenAlpha('j3f1f31f3', '15' , 0,  0.25, 'linear')
                doTweenAlpha('jfrasasdasdasdgr', 'White4' , 0,  0.25, 'linear')
                doTweenAlpha('jfraadaddzzzsdadsgr', 'tags' , 0,  0.25, 'linear')
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
        'dialogos/cj26', 'boop', 'dialogos/gf14', 'dialogos/rubymissing',
        'dialogos/ruby6', 'dialogos/ruby7', 'dialogos/cj27', 'dialogos/cj28',
        'dialogos/ruby8', 'dialogos/cj29', 'boop', 'dialogos/gf15', 'boop',
        'dialogos/cj30', 'dialogos/gf16', 'dialogos/cj31', 'dialogos/ruby9',
        'boop','dialogos/gf17', 'dialogos/gf18', 'dialogos/gf19', 'dialogos/gf20',
        'boop', 'dialogos/cj32', 'dialogos/gf22', 'boop', 'dialogos/cj33',
        'dialogos/ruby10', 'dialogos/cj34', 'dialogos/ruby11', 'dialogos/gf23'
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
imagenzz = 10

function onStartCountdown()
    if eme == false and isStoryMode then
        if dialogo == 0 then
            makeLuaSprite(tostring(imagenzz), 'cutscenes/' .. imagenzz, 0, 0)
            scaleObject(tostring(imagenzz), 0.75, 0.75)
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
