local dialogue1 = 'dialogos/tmc1'
local dialogue2 = 'dialogos/tmc2'
local dialogue3 = 'dialogos/tmc3'
local dialogue4 = 'dialogos/VADE1'
local dialogue5 = 'dialogos/tmc5'
local dialogue6 = 'dialogos/VADE2'
local dialogue7 = 'dialogos/tmc7'
local dialogue8 = 'dialogos/tmc8'
local dialogue9 = 'dialogos/tmc9'
local dialogue10 = 'dialogos/tmc10'
local dialogue11 = 'dialogos/tmc11'

local allowCountdown = false

function onStartCountdown()
	if not allowCountdown and not seenCutscene then
		setProperty('inCutscene', true)
		runTimer('startDialogue', 0.8)

		return Function_Stop
	end

	return Function_Continue
end

function onTimerCompleted(tag)
	if tag == 'startDialogue' then
		startDialogue('dialogue')
		playSound(dialogue1, 1, 'dialogue')
	end
end

function onNextDialogue(count)
	if count == 1 then
		playSound(dialogue2, 1, 'dialogue')
	elseif count == 2 then
		playSound(dialogue3, 1, 'dialogue')
	elseif count == 3 then
		playSound(dialogue4, 1, 'dialogue')
	elseif count == 4 then
		playSound(dialogue5, 1, 'dialogue')
	elseif count == 5 then
		playSound(dialogue6, 1, 'dialogue')
	elseif count == 6 then
		playSound(dialogue7, 1, 'dialogue')
	elseif count == 7 then
		playSound(dialogue8, 1, 'dialogue')
	elseif count == 8 then
		playSound(dialogue9, 1, 'dialogue')
	elseif count == 9 then
		playSound(dialogue10, 1, 'dialogue')
	elseif count == 10 then
		playSound(dialogue11, 1, 'dialogue')
	end
end