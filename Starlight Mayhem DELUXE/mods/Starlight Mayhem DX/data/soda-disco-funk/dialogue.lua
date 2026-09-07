local dialogo = 1

local sepuede = false
local cutsceneStarted = false
local allowCountdown = false
local countdownReleased = false
local dialogueFinished = false

local letras = {}
local contador = 1


-- ============================================================
-- VOZ DA FALA ATUAL
-- ============================================================

function playDialogueSound(sound)

    -- Para qualquer fala anterior
    stopSound('dialogueVoice')

    -- Só tenta tocar se existir um nome válido
    if sound ~= nil and sound ~= '' then
        playSound(
            sound,
            1,
            'dialogueVoice'
        )
    end

end


-- ============================================================
-- BACKGROUND
-- ============================================================

function createScene(name)

    if luaSpriteExists('scene') then
        removeLuaSprite(
            'scene',
            true
        )
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
    -- BACKGROUND 2048x927
    --
    -- Escala pela altura:
    -- 927 * 0.582524 ≈ 540
    --
    -- A largura fica maior que 960.
    -- As laterais são cortadas.
    -- ========================================================

    scaleObject(
        'scene',
        0.582524,
        0.582524
    )

    setProperty(
        'scene.x',
        -116.5
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
-- ON CREATE
-- ============================================================

function onCreate()

    -- ========================================================
    -- BACKGROUND
    -- ========================================================

    createScene(
        'lebg2'
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

    -- Segurança
    if text == nil then
        text = ''
    end

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

    -- Texto vazio não pode deixar o diálogo preso
    if #letras == 0 then

        sepuede = true

        return

    end

    runTimer(
        'typing',
        0.04,
        0
    )

end


-- ============================================================
-- TAG
-- ============================================================

function tag(char)

    if luaSpriteExists('tag') then

        removeLuaSprite(
            'tag',
            true
        )

    end

    if char == nil or char == '' then
        return
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
-- LIMPA A CUTSCENE
-- ============================================================

function cleanupDialogue()

    if dialogueFinished then
        return
    end

    dialogueFinished = true

    cancelTimer(
        'typing'
    )

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

end


-- ============================================================
-- FINAL DA CUTSCENE
-- ============================================================

function finishDialogue()

    if allowCountdown then
        return
    end

    stopSound(
        'dialogueVoice'
    )

    cancelTimer(
        'typing'
    )

    -- Impede qualquer novo diálogo
    sepuede = false

    -- Fade
    if luaTextExists('dialogText') then

        doTweenAlpha(
            'fadeText',
            'dialogText',
            0,
            0.5
        )

    end

    if luaSpriteExists('dialogBox') then

        doTweenAlpha(
            'fadeBox',
            'dialogBox',
            0,
            0.5
        )

    end

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

    -- Libera o countdown.
    -- IMPORTANTE:
    -- Não chamamos startCountdown() manualmente.
    allowCountdown = true

    runTimer(
        'startSong',
        0.7,
        1
    )

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

        return

    end


    -- ========================================================
    -- FINAL DA CUTSCENE
    -- ========================================================

        if tagName == 'startSong' then

        cleanupDialogue()

        allowCountdown = true

        runTimer(
            'reallyStart',
            0.05,
            1
        )

        return
    end


    if tagName == 'reallyStart' then

        if allowCountdown and not countdownReleased then

            countdownReleased = true

            startCountdown()

        end

        return
    end

end


-- ============================================================
-- DIÁLOGOS
-- ============================================================

function nextDialogue()

    -- Segurança contra avanço depois do fim
    if dialogueFinished then
        return
    end


    -- ========================================================
    -- 1 - GWEN
    -- ========================================================

    if dialogo == 1 then

        changeScene(
            'lebg2'
        )

        showText(
            "Alright, here we go"
        )

        playDialogueSound(
            'dialogos/devs/gwen1'
        )

        tag(
            'gwenlmao'
        )


    -- ========================================================
    -- 2 - GWEN
    -- ========================================================

    elseif dialogo == 2 then

        showText(
            "Hello, player, well, how can i say this-"
        )

        playDialogueSound(
            'dialogos/devs/gwen2'
        )

        tag(
            'gwenlmao'
        )


    -- ========================================================
    -- 3 - GWEN
    -- ========================================================

    elseif dialogo == 3 then

        showText(
            'Since we ran out of oficial material of "Vs Luna", we needed to make our own'
        )

        playDialogueSound(
            'dialogos/devs/gwen3'
        )

        tag(
            'gwenlmao'
        )


    -- ========================================================
    -- 4 - GWEN
    -- ========================================================

    elseif dialogo == 4 then

        showText(
            "NOTICE! NONE OF THESE STUFF ARE MADE BY THEMASKEDCHRIS!!!"
        )

        playDialogueSound(
            'dialogos/devs/gwenYell'
        )

        tag(
            'gwenlmao'
        )


    -- ========================================================
    -- 5 - ZERO
    -- ========================================================

    elseif dialogo == 5 then

        showText(
            "why the yelling lmao"
        )

        playDialogueSound(
            'dialogos/devs/zerolol'
        )

        tag(
            'zerothefuck'
        )


    -- ========================================================
    -- 6 - GWEN
    -- ========================================================

    elseif dialogo == 6 then

        showText(
            "Hope you enjoy this fan \"rest-of-week\", cya!"
        )

        playDialogueSound(
            'dialogos/devs/gwen4'
        )

        tag(
            'gwenlmao'
        )


    -- ========================================================
    -- 7 - ZERO
    -- ========================================================

    elseif dialogo == 7 then

        showText(
            'Why don\'t skeletons fight each other?... They don\'t have the guts!. *laughs*'
        )

        playDialogueSound(
            'dialogos/devs/zerolmao'
        )

        tag(
            'zerothefuck'
        )


    -- ========================================================
    -- 8 - GWEN
    -- ========================================================

    elseif dialogo == 8 then

        showText(
            "DAMN, MAN, WHAT A STUPID JOKE!"
        )

        playDialogueSound(
            'dialogos/devs/gwenmad'
        )

        tag(
            'gwenlmao'
        )


    -- ========================================================
    -- 9 - FINAL
    -- ========================================================

    elseif dialogo == 9 then

        finishDialogue()

        return

    end


    -- Só incrementa depois de configurar a fala
    dialogo = dialogo + 1

end


-- ============================================================
-- INPUT
-- ============================================================

function onUpdatePost()

    -- Não processa input antes da cutscene
    if not cutsceneStarted then
        return
    end

    -- Não processa input depois do fim
    if dialogueFinished then
        return
    end


    -- ========================================================
    -- SPACE = COMPLETAR TEXTO
    -- ========================================================

    if keyboardJustPressed('SPACE')
    and not sepuede then

        completeText()

        return

    end


    -- ========================================================
    -- ENTER = PRÓXIMO DIÁLOGO
    -- ========================================================

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

    -- ========================================================
    -- CHART EDITOR
    -- ========================================================

    if getPropertyFromClass(
        'PlayState',
        'chartingMode'
    ) then

        return Function_Continue

    end


    -- ========================================================
    -- COUNTDOWN JÁ LIBERADO
    -- ========================================================

    if allowCountdown then

        -- Segurança contra chamadas múltiplas
        if countdownReleased then
            return Function_Continue
        end

        countdownReleased = true

        return Function_Continue

    end


    -- ========================================================
    -- INICIA A CUTSCENE
    -- ========================================================

    if not cutsceneStarted then

        cutsceneStarted = true

        -- ====================================================
        -- Música da cutscene
        --
        -- Mantida como estava no arquivo original.
        -- ====================================================

        playMusic(
            'givealilbitback',
            0.75,
            true
        )

        nextDialogue()

    end


    -- ========================================================
    -- BLOQUEIA O COUNTDOWN
    -- ========================================================

    return Function_Stop

end