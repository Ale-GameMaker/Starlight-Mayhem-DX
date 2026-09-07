local trailTimer = 0

-- Quanto menor, mais sombras
local trailDelay = 0.045


function onCreatePost()

    runHaxeCode([[

        import flixel.FlxSprite;
        import flixel.tweens.FlxTween;
        import flixel.tweens.FlxEase;
        import objects.Character;

        var trailLifetime = 0.70;
        var trailAlpha = 0.50;


        function createCharacterTrail(character)
        {
            if (character == null)
                return;

            var ghost = new FlxSprite();

            ghost.frames = character.frames;
            ghost.frame = character.frame;

            ghost.x = character.x;
            ghost.y = character.y;

            ghost.scale.x = character.scale.x;
            ghost.scale.y = character.scale.y;

            ghost.offset.x = character.offset.x;
            ghost.offset.y = character.offset.y;

            ghost.origin.x = character.origin.x;
            ghost.origin.y = character.origin.y;

            ghost.flipX = character.flipX;
            ghost.flipY = character.flipY;
            ghost.angle = character.angle;

            ghost.cameras = character.cameras;

            ghost.alpha = trailAlpha;

            var index = game.members.indexOf(character);

            if (index >= 0)
                game.insert(index, ghost);
            else
                game.add(ghost);

            FlxTween.tween(
                ghost,
                {alpha: 0},
                trailLifetime,
                {
                    ease: FlxEase.linear,

                    onComplete: function(tween)
                    {
                        ghost.kill();
                        ghost.destroy();
                    }
                }
            );
        }


        function createAllCharacterTrails()
        {
            if (game.boyfriend != null)
                createCharacterTrail(game.boyfriend);

            if (game.dad != null)
                createCharacterTrail(game.dad);

            if (game.gf != null)
                createCharacterTrail(game.gf);
        }

    ]])

end


function onUpdatePost(elapsed)

    -- Começa na Section 56
    if curSection < 56 then
        trailTimer = 0
        return
    end

    trailTimer = trailTimer + elapsed

    if trailTimer >= trailDelay then

        trailTimer = 0

        runHaxeFunction(
            'createAllCharacterTrails',
            {}
        )

    end

end