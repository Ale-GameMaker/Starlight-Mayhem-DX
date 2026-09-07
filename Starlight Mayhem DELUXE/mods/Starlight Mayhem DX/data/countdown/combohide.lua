-- ============================================================
-- STMDX - HIDE COMBO / STREAK
-- ============================================================

function onCreatePost()

    -- Esconde o combo original
    setProperty(
        'comboGroup.visible',
        false
    )

end


function onUpdatePost()

    -- Garante que continue escondido
    setProperty(
        'comboGroup.visible',
        false
    )

end