-- Frame 0 = Normal
-- Frame 1 = Defeat
-- Frame 2 = Victory

function onUpdatePost()
    local hp = getProperty('health')

    -- =========================================
    -- PLAYER (P1)
    -- =========================================

    if hp < 0.4 then
        setProperty('iconP1.animation.curAnim.curFrame', 1) -- Defeat

    elseif hp > 1.6 then
        setProperty('iconP1.animation.curAnim.curFrame', 2) -- Victory

    else
        setProperty('iconP1.animation.curAnim.curFrame', 0) -- Normal
    end


    -- =========================================
    -- OPPONENT (P2)
    -- =========================================

    if hp > 1.6 then
        setProperty('iconP2.animation.curAnim.curFrame', 1) -- Defeat

    elseif hp < 0.4 then
        setProperty('iconP2.animation.curAnim.curFrame', 2) -- Victory

    else
        setProperty('iconP2.animation.curAnim.curFrame', 0) -- Normal
    end
end