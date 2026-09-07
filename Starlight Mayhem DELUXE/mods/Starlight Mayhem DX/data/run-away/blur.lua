function onCreate()

    makeLuaSprite('zeroBlur', 'zeroBlur', 0, 0)

    setObjectCamera('zeroBlur', 'other')
    setObjectOrder('zeroBlur', 999)

    setGraphicSize('zeroBlur', screenWidth, screenHeight)
    updateHitbox('zeroBlur')

    setProperty('zeroBlur.alpha', 0.8)

    addLuaSprite('zeroBlur', true)

end