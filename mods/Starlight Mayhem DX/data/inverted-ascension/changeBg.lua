local changed = false

function onUpdatePost(elapsed)
    if not changed and getSongPosition() >= 106666 then -- Troque pelo ms desejado
        changed = true

        removeLuaSprite('stageback', true)

        makeLuaSprite('stageback', 'CJ/dusk/bg', -550, -160)
        setLuaSpriteScrollFactor('stageback', 0.5, 0.5)

        addLuaSprite('stageback', false)
        setObjectOrder('stageback', 0)
    end
end