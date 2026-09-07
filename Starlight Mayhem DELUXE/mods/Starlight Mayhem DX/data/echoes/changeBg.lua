local changed = false

function onUpdatePost(elapsed)
    if not changed and getSongPosition() >= 119172 then
        changed = true

        removeLuaSprite('stageback', true)

        makeLuaSprite('stageback', 'CJ/night/bg', -550, -160)
        setLuaSpriteScrollFactor('stageback', 0.5, 0.5)

        addLuaSprite('stageback', false)
        setObjectOrder('stageback', 0)
    end
end