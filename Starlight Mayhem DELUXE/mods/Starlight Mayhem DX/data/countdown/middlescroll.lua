-- ============================================================
-- STMDX - OLLEY VS EL PENDRIVE AZUL
-- CUSTOM HUD
-- ============================================================

-- ============================================================
-- CONFIGURAÇÃO DA TELA
-- ============================================================

local screenW = 1280
local screenH = 720


-- ============================================================
-- ÍCONES
-- ============================================================

local dadIconX = 20
local dadIconY = 20

local bfIconX = screenW - 170
local bfIconY = 20


-- ============================================================
-- BARRAS
-- ============================================================

local barWidth = 180
local barHeight = 14

local barOffsetY = 68
local barOverlap = 35


-- ============================================================
-- STRUMS
-- ============================================================

local strumSpacing = 112
local strumCount = 4


-- ============================================================
-- CORES
-- ============================================================

local bfColor = 'FFFFFF'
local dadColor = 'FFFFFF'


-- ============================================================
-- POSIÇÕES DAS BARRAS
-- ============================================================

local dadBarX = dadIconX + 115

local bfBarRight = bfIconX + barOverlap
local bfBarX = bfBarRight - barWidth


-- ============================================================
-- TIME
-- ============================================================

local timeFont = 'sonic-1-hud-font.ttf'

local timeX = 0
local timeY = 15
local timeWidth = screenW
local timeHeight = 40

local timeFontSize = 28


-- ============================================================
-- CONTROLE DO TEMPO
-- ============================================================

local timeVisible = false
local songDuration = 0


-- ============================================================
-- MS DAS MUDANÇAS DE COR
-- ============================================================

local firstRedMS = 44835
local secondRedMS = 108131


-- ============================================================
-- ESTADO DA COR
-- ============================================================

local timeColorState = 0


-- ============================================================
-- CORES DO CONTADOR
-- ============================================================

local normalTimeColor = 'FFFFFF'

local firstRedColor = 'B85C5C'

local secondRedColor = 'FF3030'


-- ============================================================
-- CONVERTE HEALTH COLOR ARRAY PARA HEX
-- ============================================================

local function colorArrayToHex(color)

    if color == nil then
        return 'FFFFFF'
    end

    local r = color[1] or 255
    local g = color[2] or 255
    local b = color[3] or 255

    return string.format(
        '%02X%02X%02X',
        r,
        g,
        b
    )

end


-- ============================================================
-- FORMATA CONTAGEM REGRESSIVA
-- ============================================================

local function formatCountdown(milliseconds)

    if milliseconds == nil then
        milliseconds = 0
    end

    if milliseconds < 0 then
        milliseconds = 0
    end

    local totalSeconds = math.ceil(
        milliseconds / 1000
    )

    local minutes = math.floor(
        totalSeconds / 60
    )

    local seconds = totalSeconds % 60

    return string.format(
        '%d:%02d',
        minutes,
        seconds
    )

end


-- ============================================================
-- ATUALIZA COR DO CONTADOR
-- ============================================================

local function updateTimeColor(songTime)

    if songTime == nil then
        return
    end


    -- ========================================================
    -- PRIMEIRO PONTO
    -- ========================================================

    if songTime >= firstRedMS
    and timeColorState < 1 then

        timeColorState = 1

        setTextColor(
            'stmdxTimeTxt',
            firstRedColor
        )

    end


    -- ========================================================
    -- SEGUNDO PONTO
    -- ========================================================

    if songTime >= secondRedMS
    and timeColorState < 2 then

        timeColorState = 2

        setTextColor(
            'stmdxTimeTxt',
            secondRedColor
        )

    end

end


-- ============================================================
-- CRIA HUD
-- ============================================================

function onCreatePost()

    -- ========================================================
    -- ESCONDE HUD ORIGINAL
    -- ========================================================

    setProperty(
        'scoreTxt.visible',
        false
    )

    setProperty(
        'healthBar.visible',
        false
    )

    setProperty(
        'healthBarBG.visible',
        false
    )

    setProperty(
        'timeBar.visible',
        false
    )

    setProperty(
        'timeBarBG.visible',
        false
    )

    setProperty(
        'timeTxt.visible',
        false
    )


    -- ========================================================
    -- PEGA AS CORES DOS PERSONAGENS
    -- ========================================================

    bfColor = colorArrayToHex(
        getProperty(
            'boyfriend.healthColorArray'
        )
    )

    dadColor = colorArrayToHex(
        getProperty(
            'dad.healthColorArray'
        )
    )


    -- ========================================================
    -- CONTADOR
    -- ========================================================

    makeLuaText(
        'stmdxTimeTxt',
        '0:00',
        timeWidth,
        timeX,
        timeY
    )

    setTextFont(
        'stmdxTimeTxt',
        timeFont
    )

    setTextSize(
        'stmdxTimeTxt',
        timeFontSize
    )

    setTextAlignment(
        'stmdxTimeTxt',
        'center'
    )

    setTextBorder(
        'stmdxTimeTxt',
        0,
        '000000'
    )

    setTextColor(
        'stmdxTimeTxt',
        normalTimeColor
    )

    setObjectCamera(
        'stmdxTimeTxt',
        'hud'
    )

    addLuaText(
        'stmdxTimeTxt',
        true
    )


    -- ========================================================
    -- ESCONDIDO DURANTE O COUNTDOWN
    -- ========================================================

    setProperty(
        'stmdxTimeTxt.visible',
        false
    )


    -- ========================================================
    -- DAD - FUNDO
    -- ========================================================

    makeLuaSprite(
        'dadHealthBarBG',
        nil,
        dadBarX,
        dadIconY + barOffsetY
    )

    makeGraphic(
        'dadHealthBarBG',
        barWidth,
        barHeight,
        '202020'
    )

    setObjectCamera(
        'dadHealthBarBG',
        'hud'
    )

    setProperty(
        'dadHealthBarBG.alpha',
        0.85
    )

    addLuaSprite(
        'dadHealthBarBG',
        true
    )


    -- ========================================================
    -- DAD - VIDA
    -- ========================================================

    makeLuaSprite(
        'dadHealthBar',
        nil,
        dadBarX,
        dadIconY + barOffsetY
    )

    makeGraphic(
        'dadHealthBar',
        barWidth,
        barHeight,
        dadColor
    )

    setObjectCamera(
        'dadHealthBar',
        'hud'
    )

    setProperty(
        'dadHealthBar.origin.x',
        0
    )

    addLuaSprite(
        'dadHealthBar',
        true
    )


    -- ========================================================
    -- BF - FUNDO
    -- ========================================================

    makeLuaSprite(
        'bfHealthBarBG',
        nil,
        bfBarX,
        bfIconY + barOffsetY
    )

    makeGraphic(
        'bfHealthBarBG',
        barWidth,
        barHeight,
        '202020'
    )

    setObjectCamera(
        'bfHealthBarBG',
        'hud'
    )

    setProperty(
        'bfHealthBarBG.alpha',
        0.85
    )

    addLuaSprite(
        'bfHealthBarBG',
        true
    )


    -- ========================================================
    -- BF - VIDA
    -- ========================================================

    makeLuaSprite(
        'bfHealthBar',
        nil,
        bfBarX,
        bfIconY + barOffsetY
    )

    makeGraphic(
        'bfHealthBar',
        barWidth,
        barHeight,
        bfColor
    )

    setObjectCamera(
        'bfHealthBar',
        'hud'
    )

    addLuaSprite(
        'bfHealthBar',
        true
    )


    -- ========================================================
    -- COLOCA AS BARRAS ATRÁS DOS ÍCONES
    -- ========================================================

    setObjectOrder(
        'dadHealthBarBG',
        getObjectOrder('iconP2') - 2
    )

    setObjectOrder(
        'dadHealthBar',
        getObjectOrder('iconP2') - 1
    )

    setObjectOrder(
        'bfHealthBarBG',
        getObjectOrder('iconP1') - 2
    )

    setObjectOrder(
        'bfHealthBar',
        getObjectOrder('iconP1') - 1
    )

end


-- ============================================================
-- MÚSICA COMEÇOU
-- ============================================================

function onSongStart()

    -- ========================================================
    -- RESETA COR
    -- ========================================================

    timeColorState = 0

    setTextColor(
        'stmdxTimeTxt',
        normalTimeColor
    )


    -- ========================================================
    -- MOSTRA O CONTADOR
    -- ========================================================

    timeVisible = true

    setProperty(
        'stmdxTimeTxt.visible',
        true
    )


    -- ========================================================
    -- PEGA A DURAÇÃO
    -- ========================================================

    songDuration = getProperty(
        'songLength'
    )

    if songDuration == nil then
        songDuration = 0
    end

end


-- ============================================================
-- UPDATE
-- ============================================================

function onUpdatePost()

    -- ========================================================
    -- ESCONDE STRUMS DO DAD
    -- ========================================================

    for i = 0, 3 do

        setPropertyFromGroup(
            'opponentStrums',
            i,
            'x',
            -1000
        )

    end


    -- ========================================================
    -- CENTRALIZA AS STRUMS DO PLAYER
    -- ========================================================

    local strumWidth = getPropertyFromGroup(
        'playerStrums',
        0,
        'width'
    )

    if strumWidth == nil or strumWidth <= 0 then
        strumWidth = 112
    end

    local totalWidth =
        strumWidth +
        (strumSpacing * (strumCount - 1))

    local centerX =
        screenW / 2

    local startX =
        centerX -
        (totalWidth / 2)

    for i = 0, 3 do

        setPropertyFromGroup(
            'playerStrums',
            i,
            'x',
            startX + (i * strumSpacing)
        )

    end


    -- ========================================================
    -- ESCONDE NOTAS DO DAD
    -- ========================================================

    local notesLength =
        getProperty('notes.length')

    if notesLength ~= nil then

        for i = 0, notesLength - 1 do

            if not getPropertyFromGroup(
                'notes',
                i,
                'mustPress'
            ) then

                setPropertyFromGroup(
                    'notes',
                    i,
                    'x',
                    -1000
                )

            end

        end

    end


    -- ========================================================
    -- ÍCONES
    -- ========================================================

    setProperty(
        'iconP2.x',
        dadIconX
    )

    setProperty(
        'iconP2.y',
        dadIconY
    )

    setProperty(
        'iconP1.x',
        bfIconX
    )

    setProperty(
        'iconP1.y',
        bfIconY
    )


    -- ========================================================
    -- CONTADOR REGRESSIVO
    -- ========================================================

    if timeVisible then

        -- ====================================================
        -- ATUALIZA DURAÇÃO
        -- ====================================================

        local currentLength =
            getProperty('songLength')

        if currentLength ~= nil
        and currentLength > 0 then

            songDuration = currentLength

        end


        -- ====================================================
        -- PEGA POSIÇÃO REAL DA MÚSICA
        -- ====================================================

        local musicTime =
            getPropertyFromClass(
                'flixel.FlxG',
                'sound.music.time'
            )


        -- ====================================================
        -- FALLBACK
        -- ====================================================

        if musicTime == nil then

            musicTime =
                getPropertyFromClass(
                    'Conductor',
                    'songPosition'
                )

        end


        if musicTime == nil then
            musicTime = 0
        end


        -- ====================================================
        -- TEMPO RESTANTE
        -- ====================================================

        local remainingTime =
            songDuration - musicTime


        if remainingTime < 0 then
            remainingTime = 0
        end


        -- ====================================================
        -- ATUALIZA TEXTO
        -- ====================================================

        if songDuration > 0 then

            setTextString(
                'stmdxTimeTxt',
                formatCountdown(
                    remainingTime
                )
            )

        end


        -- ====================================================
        -- ATUALIZA COR
        -- ========================================================

        updateTimeColor(
            musicTime
        )


        -- ====================================================
        -- POSIÇÃO
        -- ====================================================

        setProperty(
            'stmdxTimeTxt.x',
            timeX
        )

        setProperty(
            'stmdxTimeTxt.y',
            timeY
        )

    end


    -- ========================================================
    -- DAD - POSIÇÃO DA BARRA
    -- ========================================================

    setProperty(
        'dadHealthBarBG.x',
        dadBarX
    )

    setProperty(
        'dadHealthBarBG.y',
        dadIconY + barOffsetY
    )

    setProperty(
        'dadHealthBar.x',
        dadBarX
    )

    setProperty(
        'dadHealthBar.y',
        dadIconY + barOffsetY
    )


    -- ========================================================
    -- BF - POSIÇÃO DO BG
    -- ========================================================

    setProperty(
        'bfHealthBarBG.x',
        bfBarX
    )

    setProperty(
        'bfHealthBarBG.y',
        bfIconY + barOffsetY
    )


    -- ========================================================
    -- HEALTH
    -- ========================================================

    local health =
        getProperty('health')

    if health == nil then
        health = 1
    end

    if health < 0 then
        health = 0
    end

    if health > 2 then
        health = 2
    end


    -- ========================================================
    -- PORCENTAGENS
    -- ========================================================

    local bfPercent =
        health / 2

    local dadPercent =
        1 - bfPercent


    -- ========================================================
    -- DAD - VIDA
    -- ========================================================

    setProperty(
        'dadHealthBar.scale.x',
        dadPercent
    )

    setProperty(
        'dadHealthBar.x',
        dadBarX
    )

    setProperty(
        'dadHealthBar.y',
        dadIconY + barOffsetY
    )


    -- ========================================================
    -- BF / OLLEY - VIDA
    -- ========================================================

    local bfWidth =
        barWidth * bfPercent

    local bfFillX =
        bfBarRight - bfWidth

    setProperty(
        'bfHealthBar.scale.x',
        bfPercent
    )

    setProperty(
        'bfHealthBar.x',
        bfFillX
    )

    setProperty(
        'bfHealthBar.y',
        bfIconY + barOffsetY
    )

end