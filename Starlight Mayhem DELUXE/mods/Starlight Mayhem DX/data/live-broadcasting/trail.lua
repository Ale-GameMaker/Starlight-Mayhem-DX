-- =========================================
-- GILBERT AFTERIMAGE
-- Psych Engine 1.0.4
-- =========================================

local trailTimer = 0

-- Quanto menor, mais sombras aparecem
local trailDelay = 0.045


function onCreatePost()

    -- =========================================
    -- INICIALIZA O HAXE
    -- =========================================

    runHaxeCode([[
        import flixel.FlxSprite;
        import flixel.tweens.FlxTween;
        import flixel.tweens.FlxEase;

        function createGilbertTrail()
        {
            var dad = game.dad;

            if (dad == null)
                return;

            var ghost = new FlxSprite();

            // =====================================
            // FRAME ATUAL DO GILBERT
            // =====================================

            ghost.frames = dad.frames;
            ghost.frame = dad.frame;

            // =====================================
            // POSIÇÃO
            // =====================================

            ghost.x = dad.x;
            ghost.y = dad.y;

            // =====================================
            // ESCALA
            // =====================================

            ghost.scale.x = dad.scale.x;
            ghost.scale.y = dad.scale.y;

            // =====================================
            // OFFSET
            // =====================================

            ghost.offset.x = dad.offset.x;
            ghost.offset.y = dad.offset.y;

            // =====================================
            // ORIGIN
            // =====================================

            ghost.origin.x = dad.origin.x;
            ghost.origin.y = dad.origin.y;

            // =====================================
            // TRANSFORMAÇÕES
            // =====================================

            ghost.flipX = dad.flipX;
            ghost.flipY = dad.flipY;
            ghost.angle = dad.angle;

            // =====================================
            // CÂMERA
            // =====================================

            ghost.cameras = dad.cameras;

            // =====================================
            // OPACIDADE
            // =====================================

            ghost.alpha = 0.50;

            // =====================================
            // ADICIONA A SOMBRA
            // =====================================

            game.add(ghost);

            // =====================================
            // FADE OUT
            // =====================================

            FlxTween.tween(
                ghost,
                {alpha: 0},
                0.20,
                {
                    ease: FlxEase.linear,

                    onComplete: function(_)
                    {
                        ghost.kill();
                        ghost.destroy();
                    }
                }
            );
        }
    ]])

end


function onUpdatePost(elapsed)

    trailTimer = trailTimer + elapsed

    if trailTimer >= trailDelay then

        trailTimer = 0

        runHaxeFunction(
            'createGilbertTrail',
            {}
        )

    end

end