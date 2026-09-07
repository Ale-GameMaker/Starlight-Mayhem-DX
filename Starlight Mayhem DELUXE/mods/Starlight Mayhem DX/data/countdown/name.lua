local originalTitle = "Friday Night Funkin': Starlight Mayhem DX"
local songTitle = "SONICTHEHEDGEHOG"

function onCreatePost()
    setPropertyFromClass(
        'openfl.Lib',
        'application.window.title',
        songTitle
    )
end

function onUpdate()
    if keyboardJustPressed('7') then
        setPropertyFromClass(
            'openfl.Lib',
            'application.window.title',
            originalTitle
        )
    end
end

function onEndSong()
    setPropertyFromClass(
        'openfl.Lib',
        'application.window.title',
        originalTitle
    )

    return Function_Continue
end