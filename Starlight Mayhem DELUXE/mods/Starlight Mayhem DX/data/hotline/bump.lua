local START_MS = 56000
local END_MS = 65250

-- M.I.L.F. = 180 BPM
local BEAT_INTERVAL = 333.33

local ZOOM_AMOUNT = 0.08
local ZOOM_IN_TIME = 0.07
local ZOOM_OUT_TIME = 0.10

local nextBeat = START_MS
local active = false

function onUpdatePost()

    local songPos = getSongPosition()

    if songPos >= START_MS and songPos <= END_MS then

        if not active then
            active = true
            nextBeat = START_MS
        end

        if songPos >= nextBeat then

            nextBeat = nextBeat + BEAT_INTERVAL

            doTweenZoom(
                'milfBeatIn',
                'camGame',
                getProperty('defaultCamZoom') + ZOOM_AMOUNT,
                ZOOM_IN_TIME,
                'quadOut'
            )

            runTimer('milfBeatOut', ZOOM_IN_TIME)
        end

    elseif songPos > END_MS and active then

        active = false

        doTweenZoom(
            'milfBeatReset',
            'camGame',
            getProperty('defaultCamZoom'),
            0.12,
            'quadOut'
        )
    end
end

function onTimerCompleted(tag)

    if tag == 'milfBeatOut' then

        doTweenZoom(
            'milfBeatOut',
            'camGame',
            getProperty('defaultCamZoom'),
            ZOOM_OUT_TIME,
            'quadIn'
        )

    end
end