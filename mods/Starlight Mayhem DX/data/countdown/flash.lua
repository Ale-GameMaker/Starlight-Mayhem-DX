-- ============================================================
-- STMDX - FLASH DO SWAY INTENSO
-- ============================================================

local flashTime = 108131
local flashTriggered = false

function onUpdatePost()
    local songTime = getSongPosition()

    if songTime >= flashTime and not flashTriggered then
        flashTriggered = true

        cameraFlash('game', 'FFFFFF', 0.35, true)
    end
end

function onCountdownStarted()
    flashTriggered = false
end