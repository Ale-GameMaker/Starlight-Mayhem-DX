-- ============================================================
-- STMDX - RANDOM NUMBERS
-- ============================================================

local secondRedMS = 108131

-- ============================================================
-- CONFIGURAÇÃO
-- ============================================================

local maxNumbers = 5

local numberFadeIn = 0.75
local numberFadeOut = 1.00

local numberMoveDistance = 65

local numberFont = 'sonic-1-hud-font.ttf'
local numberSize = 76

local screenWidth = 1280
local screenHeight = 720

-- Intervalo entre o surgimento de novos números
local spawnDelayMin = 0.35
local spawnDelayMax = 1.10

-- ============================================================
-- OBJETOS
-- ============================================================

local numberObjects = {}

-- ============================================================
-- CRIA OS NÚMEROS
-- ============================================================

function onCreatePost()

    for i = 1, maxNumbers do

        local tag = 'stmdxNumber' .. i

        makeLuaText(
            tag,
            '',
            220,
            0,
            0
        )

        setTextFont(
            tag,
            numberFont
        )

        setTextSize(
            tag,
            numberSize
        )

        setTextAlignment(
            tag,
            'center'
        )

        setObjectCamera(
            tag,
            'hud'
        )

        setProperty(
            tag .. '.alpha',
            0
        )

        addLuaText(
            tag
        )

        numberObjects[i] = {

            active = false,

            timer = 0,

            phase = 'waiting',

            number = 0,

            startX = 0,
            startY = 0,

            endX = 0,
            endY = 0,

            -- Cada número possui seu próprio atraso
            spawnTimer = math.random() *
                (spawnDelayMax - spawnDelayMin) +
                spawnDelayMin

        }

    end

end


-- ============================================================
-- POSIÇÃO ALEATÓRIA
-- ============================================================

function getRandomPosition()

    local x
    local y

    local valid = false

    while not valid do

        x = math.random(
            20,
            screenWidth - 240
        )

        y = math.random(
            20,
            screenHeight - 130
        )

        valid = true

        -- ====================================================
        -- BLOQUEIA O CENTRO
        -- ====================================================

        if x > 390 and x < 890 and
           y > 190 and y < 530 then

            valid = false

        end

        -- ====================================================
        -- BLOQUEIA CENTRO SUPERIOR
        -- ====================================================

        if x > 390 and x < 890 and
           y < 140 then

            valid = false

        end

        -- ====================================================
        -- BLOQUEIA CENTRO INFERIOR
        -- ====================================================

        if x > 390 and x < 890 and
           y > 580 then

            valid = false

        end

    end

    return x, y

end


-- ============================================================
-- COR DO NÚMERO
-- ============================================================

function updateNumberColor(tag, progress)

    if progress < 0 then
        progress = 0
    end

    if progress > 1 then
        progress = 1
    end

    -- ========================================================
    -- BRANCO -> VERMELHO
    -- ========================================================

    local r = 255

    local g = math.floor(
        255 * (1 - progress)
    )

    local b = math.floor(
        255 * (1 - progress)
    )

    local color = string.format(
        '%02X%02X%02X',
        r,
        g,
        b
    )

    setTextColor(
        tag,
        color
    )

    setProperty(
        tag .. '.color',
        getColorFromHex(color)
    )

end


-- ============================================================
-- INICIA UM NÚMERO
-- ============================================================

function spawnNumber(index)

    local data = numberObjects[index]

    if data == nil then
        return
    end

    local tag = 'stmdxNumber' .. index

    -- ========================================================
    -- NÚMERO ALEATÓRIO
    -- ========================================================

    data.number = math.random(
        1,
        10
    )

    setTextString(
        tag,
        tostring(data.number)
    )

    -- ========================================================
    -- POSIÇÃO
    -- ========================================================

    local x, y = getRandomPosition()

    data.endX = x
    data.endY = y

    -- Começa acima da posição final
    data.startX = x
    data.startY =
        y - numberMoveDistance

    -- ========================================================
    -- ESTADO
    -- ========================================================

    data.timer = 0
    data.phase = 'fadeIn'
    data.active = true

    -- ========================================================
    -- POSIÇÃO INICIAL
    -- ========================================================

    setProperty(
        tag .. '.x',
        data.startX
    )

    setProperty(
        tag .. '.y',
        data.startY
    )

    -- ========================================================
    -- ALPHA INICIAL
    -- ========================================================

    setProperty(
        tag .. '.alpha',
        0
    )

    -- Começa branco
    updateNumberColor(
        tag,
        0
    )

end


-- ============================================================
-- FINALIZA UM NÚMERO
-- ============================================================

function removeNumber(index)

    local data = numberObjects[index]

    if data == nil then
        return
    end

    local tag = 'stmdxNumber' .. index

    data.active = false
    data.phase = 'waiting'
    data.timer = 0

    -- Novo atraso individual
    data.spawnTimer =
        math.random() *
        (spawnDelayMax - spawnDelayMin) +
        spawnDelayMin

    setProperty(
        tag .. '.alpha',
        0
    )

end


-- ============================================================
-- UPDATE
-- ============================================================

function onUpdate(elapsed)

    local musicTime =
        getPropertyFromClass(
            'flixel.FlxG',
            'sound.music.time'
        )

    if musicTime == nil then
        musicTime = 0
    end

    -- ========================================================
    -- ANTES DO SEGUNDO MS
    -- ========================================================

    if musicTime < secondRedMS then

        for i = 1, maxNumbers do

            local data = numberObjects[i]

            if data ~= nil then

                if data.active then
                    removeNumber(i)
                end

                -- Impede qualquer número de aparecer antes
                data.phase = 'waiting'
                data.spawnTimer = 0

            end

        end

        return

    end

    -- ========================================================
    -- ATUALIZA OS NÚMEROS ATIVOS
    -- ========================================================

    for i = 1, maxNumbers do

        local data = numberObjects[i]

        if data ~= nil and data.active then

            local tag =
                'stmdxNumber' .. i

            data.timer =
                data.timer + elapsed

            -- =================================================
            -- FADE IN
            -- =================================================

            if data.phase == 'fadeIn' then

                local progress =
                    data.timer / numberFadeIn

                if progress > 1 then
                    progress = 1
                end

                -- Movimento para baixo
                local currentY =
                    data.startY +
                    (
                        numberMoveDistance *
                        progress
                    )

                setProperty(
                    tag .. '.x',
                    data.startX
                )

                setProperty(
                    tag .. '.y',
                    currentY
                )

                setProperty(
                    tag .. '.alpha',
                    progress
                )

                -- Branco durante entrada
                updateNumberColor(
                    tag,
                    0
                )

                -- =================================================
                -- TERMINOU O FADE IN
                -- =================================================

                if data.timer >= numberFadeIn then

                    data.timer = 0

                    data.phase = 'fadeOut'

                end

            -- =================================================
            -- FADE OUT
            -- =================================================

            elseif data.phase == 'fadeOut' then

                local progress =
                    data.timer / numberFadeOut

                if progress > 1 then
                    progress = 1
                end

                -- Continua descendo
                local currentY =
                    data.endY +
                    (
                        numberMoveDistance *
                        progress
                    )

                setProperty(
                    tag .. '.x',
                    data.endX
                )

                setProperty(
                    tag .. '.y',
                    currentY
                )

                -- Alpha diminuindo
                setProperty(
                    tag .. '.alpha',
                    1 - progress
                )

                -- Branco -> vermelho
                updateNumberColor(
                    tag,
                    progress
                )

                -- =================================================
                -- TERMINOU
                -- =================================================

                if data.timer >= numberFadeOut then

                    removeNumber(i)

                end

            end

        end

    end

    -- ========================================================
    -- GERENCIA OS SLOTS VAZIOS
    -- ========================================================

    for i = 1, maxNumbers do

        local data = numberObjects[i]

        if data ~= nil and
           not data.active then

            -- =================================================
            -- CADA SLOT TEM SEU PRÓPRIO TIMER
            -- =================================================

            if data.spawnTimer > 0 then

                data.spawnTimer =
                    data.spawnTimer - elapsed

            else

                spawnNumber(i)

            end

        end

    end

end