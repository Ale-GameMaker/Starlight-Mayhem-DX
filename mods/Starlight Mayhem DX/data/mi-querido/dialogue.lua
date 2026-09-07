local dialogo = 1

local sepuede = false
local cutsceneStarted = false
local allowCountdown = false

local letras = {}
local contador = 1


-- ============================================================
-- VOZ DA FALA ATUAL
-- ============================================================

function playDialogueSound(sound)

    stopSound('dialogueVoice')

    playSound(
        sound,
        1,
        'dialogueVoice'
    )

end


-- ============================================================
-- BACKGROUND
-- ============================================================

function createScene(name)

    if luaSpriteExists('scene') then
        removeLuaSprite('scene', true)
    end

    makeLuaSprite(
        'scene',
        'cutscenes/' .. name,
        0,
        0
    )

    setObjectCamera(
        'scene',
        'other'
    )

    -- ========================================================
    -- PEGA O TAMANHO REAL DA TELA
    -- ========================================================

    local screenWidth = getPropertyFromClass(
        'flixel.FlxG',
        'width'
    )

    local screenHeight = getPropertyFromClass(
        'flixel.FlxG',
        'height'
    )

    -- ========================================================
    -- 2560x1440 -> resolução atual
    -- ========================================================

    local scaleX = screenWidth / 2560
    local scaleY = screenHeight / 1440

    scaleObject(
        'scene',
        scaleX,
        scaleY
    )

    setProperty(
        'scene.x',
        0
    )

    setProperty(
        'scene.y',
        0
    )

    addLuaSprite(
        'scene',
        false
    )

end


function changeScene(name)

    createScene(name)

end


-- ============================================================
-- TAG
--
-- name (1) = Vade
-- name (2) = Luna
-- name (3) = CJ
-- ============================================================

function tag(char)

    if luaSpriteExists('tag') then

        removeLuaSprite(
            'tag',
            true
        )

    end

    makeLuaSprite(
        'tag',
        'cutscenes/' .. char,
        50,
        450
    )

    setObjectCamera(
        'tag',
        'other'
    )

    scaleObject(
        'tag',
        0.25,
        0.25
    )

    addLuaSprite(
        'tag',
        true
    )

end


-- ============================================================
-- CREATE
-- ============================================================

function onCreate()

    -- Background inicial
    createScene(
        'slide (1)'
    )


    -- ========================================================
    -- CAIXA DE DIÁLOGO
    -- ========================================================

    makeLuaSprite(
        'dialogBox',
        '',
        0,
        530
    )

    luaSpriteMakeGraphic(
        'dialogBox',
        3000,
        300,
        '000000'
    )

    setObjectCamera(
        'dialogBox',
        'other'
    )

    setProperty(
        'dialogBox.alpha',
        0.5
    )

    addLuaSprite(
        'dialogBox',
        true
    )


    -- ========================================================
    -- TEXTO
    -- ========================================================

    makeLuaText(
        'dialogText',
        '',
        1100,
        160,
        570
    )

    setTextFont(
        'dialogText',
        'pfont.ttf'
    )

    setTextAlignment(
        'dialogText',
        'center'
    )

    setTextBorder(
        'dialogText',
        2,
        '000000'
    )

    setTextColor(
        'dialogText',
        'FFFFFF'
    )

    setTextSize(
        'dialogText',
        38
    )

    setObjectCamera(
        'dialogText',
        'other'
    )

    addLuaText(
        'dialogText'
    )

end


-- ============================================================
-- TYPEWRITER
-- ============================================================

function showText(text)

    letras = {}

    for i = 1, #text do

        table.insert(
            letras,
            string.sub(
                text,
                i,
                i
            )
        )

    end

    setTextString(
        'dialogText',
        ''
    )

    contador = 1
    sepuede = false

    cancelTimer(
        'typing'
    )

    runTimer(
        'typing',
        0.04,
        0
    )

end


-- ============================================================
-- COMPLETAR TEXTO
-- ============================================================

function completeText()

    cancelTimer(
        'typing'
    )

    local textoCompleto = ''

    for i = 1, #letras do

        textoCompleto =
            textoCompleto .. letras[i]

    end

    setTextString(
        'dialogText',
        textoCompleto
    )

    contador = #letras + 1

    sepuede = true

end


-- ============================================================
-- TIMERS
-- ============================================================

function onTimerCompleted(tagName)

    -- ========================================================
    -- TYPEWRITER
    -- ========================================================

    if tagName == 'typing' then

        if letras[contador] ~= nil then

            setTextString(
                'dialogText',
                getTextString('dialogText') ..
                letras[contador]
            )

            contador = contador + 1

        else

            cancelTimer(
                'typing'
            )

            sepuede = true

        end

    end


    -- ========================================================
    -- FINAL DA CUTSCENE
    -- ========================================================

    if tagName == 'startSong' then

        stopSound(
            'dialogueVoice'
        )


        if luaSpriteExists('dialogBox') then

            removeLuaSprite(
                'dialogBox',
                true
            )

        end


        if luaTextExists('dialogText') then

            removeLuaText(
                'dialogText'
            )

        end


        if luaSpriteExists('scene') then

            removeLuaSprite(
                'scene',
                true
            )

        end


        if luaSpriteExists('tag') then

            removeLuaSprite(
                'tag',
                true
            )

        end


        allowCountdown = true

        runTimer(
            'reallyStart',
            0.05,
            1
        )

    end


    -- ========================================================
    -- COMEÇA A MÚSICA
    -- ========================================================

    if tagName == 'reallyStart' then

        if allowCountdown then

            startCountdown()

        end

    end

end


-- ============================================================
-- DIÁLOGOS
-- ============================================================

function nextDialogue()

    -- ========================================================
    -- 1 - CJ
    -- ========================================================

    if dialogo == 1 then

        showText(
            "So i said: Hey! Don't touch my lettuce!"
        )

        playDialogueSound(
            'dialogos/luna/cj1'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 2 - VADE
    -- ========================================================

    elseif dialogo == 2 then

        showText(
            "*chuckle*"
        )

        playDialogueSound(
            'dialogos/luna/vade1'
        )

        tag(
            'name (1)'
        )


    -- ========================================================
    -- 3 - CJ
    -- ========================================================

    elseif dialogo == 3 then

        showText(
            "Anyways, we are like five minutes away from that nice restaurant I talked to you about.. wanna go?"
        )

        playDialogueSound(
            'dialogos/luna/cj2'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 4 - VADE
    -- ========================================================

    elseif dialogo == 4 then

        showText(
            "Sure! I'm Always up to compare my cooking with mere peasants!"
        )

        playDialogueSound(
            'dialogos/luna/vade2'
        )

        tag(
            'name (1)'
        )


    -- ========================================================
    -- 5 - CJ
    -- ========================================================

    elseif dialogo == 5 then

        showText(
            "*chuckle*"
        )

        playDialogueSound(
            'dialogos/luna/cj3'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 6 - LUNA
    -- ========================================================

    elseif dialogo == 6 then

        changeScene(
            'slide (2)'
        )

        showText(
            "Oh my god, it's YOU!!"
        )

        playDialogueSound(
            'dialogos/luna/luna1'
        )

        tag(
            'name (2)'
        )


    -- ========================================================
    -- 7 - CJ
    -- ========================================================

    elseif dialogo == 7 then

        showText(
            "huh?"
        )

        playDialogueSound(
            'dialogos/luna/cj4'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 8 - LUNA
    -- ========================================================

    elseif dialogo == 8 then

        showText(
            "Um, excuse me, do you happen to be the CJ from On Command?"
        )

        playDialogueSound(
            'dialogos/luna/luna2'
        )

        tag(
            'name (2)'
        )


    -- ========================================================
    -- 9 - CJ
    -- ========================================================

    elseif dialogo == 9 then

        showText(
            "Uhhh, yes? How did you recognize me?"
        )

        playDialogueSound(
            'dialogos/luna/cj5'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 10 - LUNA
    -- ========================================================

    elseif dialogo == 10 then

        showText(
            "YOU ARE THE REAL DEAL! OMG I'm your biggest fan!!! I would love to see you rock out on your next show!!!"
        )

        playDialogueSound(
            'dialogos/luna/luna3'
        )

        tag(
            'name (2)'
        )


    -- ========================================================
    -- 11 - CJ
    -- ========================================================

    elseif dialogo == 11 then

        showText(
            "Great to see a fan..! What's your name btw?"
        )

        playDialogueSound(
            'dialogos/luna/cj6'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 12 - LUNA
    -- ========================================================

    elseif dialogo == 12 then

        showText(
            "Oh! Allow me to introduce myself. My name is Luna. and I love you SOOOOO muuuuch!!"
        )

        playDialogueSound(
            'dialogos/luna/luna4'
        )

        tag(
            'name (2)'
        )


    -- ========================================================
    -- 13 - LUNA
    -- ========================================================

    elseif dialogo == 13 then

        showText(
            "Can you please go on a date with me!? Pretty PRETTY please with a cherry on top!?"
        )

        playDialogueSound(
            'dialogos/luna/luna5'
        )

        tag(
            'name (2)'
        )


    -- ========================================================
    -- 14 - CJ
    -- ========================================================

    elseif dialogo == 14 then

        showText(
            "Wowowoah! Slow down a bit! As you can see, I have my girlfriend Vade here..!"
        )

        playDialogueSound(
            'dialogos/luna/cj7'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 15 - VADE
    -- ========================================================

    elseif dialogo == 15 then

        showText(
            "Calm down a bit miss, CJ here is mine! Ugh, the nerve..!"
        )

        playDialogueSound(
            'dialogos/luna/vade3'
        )

        tag(
            'name (1)'
        )


    -- ========================================================
    -- 16 - LUNA
    -- ========================================================

    elseif dialogo == 16 then

        showText(
            "Wanna rap battle with me CJ? You know I am Always ready to sing with my biggest Idol"
        )

        playDialogueSound(
            'dialogos/luna/luna6'
        )

        tag(
            'name (2)'
        )


    -- ========================================================
    -- 17 - CJ
    -- ========================================================

    elseif dialogo == 17 then

        showText(
            "Hey, I really wouldn't rap battle for love..."
        )

        playDialogueSound(
            'dialogos/luna/cj8'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 18 - VADE
    -- ========================================================

    elseif dialogo == 18 then

        showText(
            "He accepts! CJ always loves a good challenge"
        )

        playDialogueSound(
            'dialogos/luna/vade4'
        )

        tag(
            'name (1)'
        )


    -- ========================================================
    -- 19 - LUNA
    -- ========================================================

    elseif dialogo == 19 then

        showText(
            "YAY! I'll siiing with CJ! WOOO!!"
        )

        playDialogueSound(
            'dialogos/luna/luna7'
        )

        tag(
            'name (2)'
        )


    -- ========================================================
    -- 20 - CJ
    -- ========================================================

    elseif dialogo == 20 then

        showText(
            ".... Do I get a say in this....?"
        )

        playDialogueSound(
            'dialogos/luna/cj9'
        )

        tag(
            'name (3)'
        )


    -- ========================================================
    -- 21 - FINAL
    -- ========================================================

    elseif dialogo == 21 then

        stopSound(
            'dialogueVoice'
        )

        doTweenAlpha(
            'fadeText',
            'dialogText',
            0,
            0.5
        )

        doTweenAlpha(
            'fadeBox',
            'dialogBox',
            0,
            0.5
        )

        if luaSpriteExists('scene') then

            doTweenAlpha(
                'fadeScene',
                'scene',
                0,
                0.5
            )

        end

        if luaSpriteExists('tag') then

            doTweenAlpha(
                'fadeTag',
                'tag',
                0,
                0.5
            )

        end

        runTimer(
            'startSong',
            0.7,
            1
        )

        return

    end


    dialogo = dialogo + 1

end


-- ============================================================
-- INPUT
-- ============================================================

function onUpdatePost()

    -- SPACE = completa a fala

    if keyboardJustPressed('SPACE')
    and not sepuede then

        completeText()

        return

    end


    -- ENTER = próxima fala

    if keyboardJustPressed('ENTER')
    and sepuede then

        stopSound(
            'dialogueVoice'
        )

        nextDialogue()

    end

end


-- ============================================================
-- COUNTDOWN
-- ============================================================

function onStartCountdown()

    -- Chart Editor
    if getPropertyFromClass(
        'PlayState',
        'chartingMode'
    ) then

        return Function_Continue

    end


    -- Cutscene já terminou
    if allowCountdown then

        return Function_Continue

    end


    -- Começa a cutscene
    if not cutsceneStarted then

        cutsceneStarted = true

        playMusic(
            'givealilbitback',
            0.75,
            true
        )

        nextDialogue()

    end


    -- Bloqueia o countdown
    return Function_Stop

end