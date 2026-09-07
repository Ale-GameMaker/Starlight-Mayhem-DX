local middleScroll = true

function onCreatePost()

    if middleScroll then

        -- Esconde as notas do oponente
        for i = 0,3 do
            noteTweenAlpha(
                'opponentHide'..i,
                i,
                0,
                0.01
            )
        end


        -- Move as notas do jogador para o centro
        for i = 4,7 do

            local targetX = 412 + ((i-4) * 112)

            noteTweenX(
                'playerMiddle'..i,
                i,
                targetX,
                0.01
            )

        end

    end

end


function onUpdate()

    -- mantém as notas no lugar
    if middleScroll then

        for i = 4,7 do

            local targetX = 412 + ((i-4) * 112)

            setPropertyFromGroup(
                'strumLineNotes',
                i,
                'x',
                targetX
            )

        end

    end

end