function onCreatePost()
    -- remove strums
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
    end
end

function onUpdatePost(elapsed)
    -- off screen
    for i = 0, 3 do
        setPropertyFromGroup('strumLineNotes', i, 'x', -1000)
    end

    --  notes off screen
    for i = 0, getProperty('notes.length') - 1 do
        if not getPropertyFromGroup('notes', i, 'mustPress') then
            setPropertyFromGroup('notes', i, 'x', -1000)
        end
    end
end