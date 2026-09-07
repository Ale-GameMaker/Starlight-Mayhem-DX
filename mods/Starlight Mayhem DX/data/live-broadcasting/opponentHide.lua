function onUpdatePost()

    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end

end