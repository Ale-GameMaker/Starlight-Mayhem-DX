import lime.app.Application;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;


// ============================================================
// CONFIGURAÇÃO
// ============================================================

var window = Application.current.window;

var targetWidth:Int = 960;
var targetHeight:Int = 540;

var shrinkTime:Float = 0.6;
var restoreTime:Float = 0.6;


// ============================================================
// CONFIGURAÇÃO DO SWAY NORMAL
// ============================================================

var swayStartTime:Float = 44835;

var swayAmplitudeX:Float = 20;
var swaySpeedX:Float = 2.0;

var swayAmplitudeY:Float = 14;
var swaySpeedY:Float = 2.4;


// ============================================================
// SWAY INTENSO
// ============================================================

var intenseSwayStartTime:Float = 108131;

var intenseAmplitudeX:Float = 75;
var intenseSpeedX:Float = 4.8;

var intenseAmplitudeY:Float = 55;
var intenseSpeedY:Float = 5.6;

var intenseTransitionTime:Float = 0.8;


// ============================================================
// ESTADO ORIGINAL
// ============================================================

var originalX:Int = window.x;
var originalY:Int = window.y;

var originalWidth:Int = window.width;
var originalHeight:Int = window.height;

var windowTween:FlxTween = null;


// ============================================================
// BASE DO SWAY
// ============================================================

var swayBaseX:Int = 0;
var swayBaseY:Int = 0;


// ============================================================
// ESTADO DO CHART EDITOR
// ============================================================

var chartEditorActive:Bool = false;


// ============================================================
// DIMINUI + CENTRALIZA
// ============================================================

function shrinkWindow()
{
    if (windowTween != null)
        windowTween.cancel();

    var startX:Int = window.x;
    var startY:Int = window.y;

    var startWidth:Int = window.width;
    var startHeight:Int = window.height;

    var bounds = window.display.bounds;

    var targetX:Int =
        Std.int(bounds.x + (bounds.width - targetWidth) / 2);

    var targetY:Int =
        Std.int(bounds.y + (bounds.height - targetHeight) / 2);

    var progress = {value: 0.0};

    windowTween = FlxTween.tween(
        progress,
        {value: 1.0},
        shrinkTime,
        {
            ease: FlxEase.sineInOut,

            onUpdate: function(_)
            {
                var p:Float = progress.value;

                var x:Int = Std.int(
                    startX + (targetX - startX) * p
                );

                var y:Int = Std.int(
                    startY + (targetY - startY) * p
                );

                var w:Int = Std.int(
                    startWidth + (targetWidth - startWidth) * p
                );

                var h:Int = Std.int(
                    startHeight + (targetHeight - startHeight) * p
                );

                window.resize(w, h);
                window.move(x, y);
            },

            onComplete: function(_)
            {
                window.resize(targetWidth, targetHeight);
                window.move(targetX, targetY);

                swayBaseX = targetX;
                swayBaseY = targetY;

                windowTween = null;
            }
        }
    );
}


// ============================================================
// SWAY DA JANELA
// ============================================================

function updateWindowSway()
{
    if (chartEditorActive)
        return;

    var songTime:Float = Conductor.songPosition;

    if (songTime < swayStartTime)
        return;


    var time:Float =
        (songTime - swayStartTime) / 1000.0;


    var currentAmplitudeX:Float = swayAmplitudeX;
    var currentAmplitudeY:Float = swayAmplitudeY;

    var currentSpeedX:Float = swaySpeedX;
    var currentSpeedY:Float = swaySpeedY;


    // ========================================================
    // SWAY INTENSO
    // ========================================================

    if (songTime >= intenseSwayStartTime)
    {
        var intenseTime:Float =
            (songTime - intenseSwayStartTime) / 1000.0;

        var transition:Float =
            Math.min(
                intenseTime / intenseTransitionTime,
                1.0
            );

        transition =
            transition * transition *
            (3.0 - 2.0 * transition);


        currentAmplitudeX =
            swayAmplitudeX +
            (intenseAmplitudeX - swayAmplitudeX) *
            transition;

        currentSpeedX =
            swaySpeedX +
            (intenseSpeedX - swaySpeedX) *
            transition;


        currentAmplitudeY =
            swayAmplitudeY +
            (intenseAmplitudeY - swayAmplitudeY) *
            transition;

        currentSpeedY =
            swaySpeedY +
            (intenseSpeedY - swaySpeedY) *
            transition;
    }


    // ========================================================
    // MOVIMENTO HORIZONTAL
    // ========================================================

    var offsetX:Float =
        Math.sin(time * currentSpeedX) *
        currentAmplitudeX;


    // ========================================================
    // MOVIMENTO VERTICAL
    // ========================================================

    var offsetY:Float =
        Math.sin(time * currentSpeedY) *
        currentAmplitudeY;


    // ========================================================
    // MOVE A JANELA
    // ========================================================

    window.move(
        Std.int(swayBaseX + offsetX),
        Std.int(swayBaseY + offsetY)
    );
}


// ============================================================
// CHART EDITOR
// ============================================================

function isChartEditor():Bool
{
    if (FlxG.state == null)
        return false;

    var className:String =
        Type.getClassName(Type.getClass(FlxG.state));

    if (className == null)
        return false;

    return className.indexOf("Chart") >= 0
        || className.indexOf("Charting") >= 0;
}


// ============================================================
// REDIMENSIONA PARA O MONITOR
// ============================================================

function resizeForChartEditor()
{
    if (windowTween != null)
        windowTween.cancel();

    var bounds = window.display.bounds;

    var monitorX:Int = bounds.x;
    var monitorY:Int = bounds.y;

    var monitorWidth:Int = bounds.width;
    var monitorHeight:Int = bounds.height;

    var startX:Int = window.x;
    var startY:Int = window.y;

    var startWidth:Int = window.width;
    var startHeight:Int = window.height;

    var progress = {value: 0.0};

    windowTween = FlxTween.tween(
        progress,
        {value: 1.0},
        0.5,
        {
            ease: FlxEase.sineInOut,

            onUpdate: function(_)
            {
                var p:Float = progress.value;

                var x:Int = Std.int(
                    startX + (monitorX - startX) * p
                );

                var y:Int = Std.int(
                    startY + (monitorY - startY) * p
                );

                var w:Int = Std.int(
                    startWidth + (monitorWidth - startWidth) * p
                );

                var h:Int = Std.int(
                    startHeight + (monitorHeight - startHeight) * p
                );

                window.resize(w, h);
                window.move(x, y);
            },

            onComplete: function(_)
            {
                window.resize(monitorWidth, monitorHeight);
                window.move(monitorX, monitorY);

                windowTween = null;
            }
        }
    );
}


// ============================================================
// VERIFICA ESTADO
// ============================================================

function checkWindowState()
{
    var editor:Bool = isChartEditor();

    if (editor && !chartEditorActive)
    {
        chartEditorActive = true;

        resizeForChartEditor();
    }
    else if (!editor && chartEditorActive)
    {
        chartEditorActive = false;
    }
}


// ============================================================
// UPDATE
// ============================================================

function onUpdatePost(elapsed)
{
    checkWindowState();
    updateWindowSway();
}


// ============================================================
// RESTAURA JANELA
// ============================================================

function restoreWindow()
{
    if (windowTween != null)
        windowTween.cancel();

    var startX:Int = window.x;
    var startY:Int = window.y;

    var startWidth:Int = window.width;
    var startHeight:Int = window.height;

    var progress = {value: 0.0};

    windowTween = FlxTween.tween(
        progress,
        {value: 1.0},
        restoreTime,
        {
            ease: FlxEase.sineInOut,

            onUpdate: function(_)
            {
                var p:Float = progress.value;

                var x:Int = Std.int(
                    startX + (originalX - startX) * p
                );

                var y:Int = Std.int(
                    startY + (originalY - startY) * p
                );

                var w:Int = Std.int(
                    startWidth + (originalWidth - startWidth) * p
                );

                var h:Int = Std.int(
                    startHeight + (originalHeight - startHeight) * p
                );

                window.resize(w, h);
                window.move(x, y);
            },

            onComplete: function(_)
            {
                window.resize(originalWidth, originalHeight);
                window.move(originalX, originalY);

                windowTween = null;
            }
        }
    );
}


// ============================================================
// RESET
// ============================================================

function resetWindow()
{
    if (windowTween != null)
        windowTween.cancel();

    window.resize(originalWidth, originalHeight);
    window.move(originalX, originalY);

    chartEditorActive = false;

    windowTween = null;
}


// ============================================================
// INÍCIO DA MÚSICA
// ============================================================

function onCountdownStarted()
{
    shrinkWindow();
}


// ============================================================
// FIM DA MÚSICA
// ============================================================

function onEndSong()
{
    restoreWindow();

    return Function_Continue;
}


// ============================================================
// GAME OVER
// ============================================================

function onGameOverStart()
{
    resetWindow();
}