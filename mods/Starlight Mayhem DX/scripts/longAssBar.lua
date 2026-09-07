local BAR_SCALE_X = 1.75
local BAR_SCALE_Y = 1.0

-- Distância entre o ícone e a barra
local ICON_GAP = 8


function onCreatePost()

    -- ============================================================
    -- HEALTH BAR
    -- ============================================================

    setProperty('healthBar.scale.x', BAR_SCALE_X)
    setProperty('healthBar.scale.y', BAR_SCALE_Y)

    screenCenter('healthBar', 'x')

    updateIconPositions()
end


function updateIconPositions()

    local barX = getProperty('healthBar.x')
    local barWidth = getProperty('healthBar.width')

    -- ============================================================
    -- ÍCONE DO OPONENTE
    -- Fora do canto esquerdo da barra
    -- ============================================================

    setProperty(
        'iconP2.x',
        barX - getProperty('iconP2.width') - ICON_GAP
    )


    -- ============================================================
    -- ÍCONE DO BF
    -- Fora do canto direito da barra
    -- ============================================================

    setProperty(
        'iconP1.x',
        barX + barWidth + ICON_GAP
    )
end


function onUpdatePost()

    -- Mantém a escala da barra
    setProperty('healthBar.scale.x', BAR_SCALE_X)
    setProperty('healthBar.scale.y', BAR_SCALE_Y)

    -- Mantém os ícones nos extremos
    updateIconPositions()
end