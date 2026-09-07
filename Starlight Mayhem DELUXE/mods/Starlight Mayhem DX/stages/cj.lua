function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'CJ/morning/bg', -550, -160);
	setLuaSpriteScrollFactor('stageback', 0.5, 0.5);
	
	makeLuaSprite('stage', 'CJ/stage', -650, -390);
scaleObject('stage',1.05, 1.1)

	makeAnimatedLuaSprite('stagefront', 'CJ/lights', -650, -350);
	scaleObject('stagefront',1.05, 1.1)
	
	makeAnimatedLuaSprite('frontboppers', 'CJ/frontboppers',-700, 930);
	scaleObject('frontboppers',1.1,1.1)
    makeAnimatedLuaSprite('headlights', 'CJ/headlights',-560, -110);

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addAnimationByPrefix('stagefront', 'idle', 'lights UliseGas', 1, true);
	addLuaSprite('stage', false);

	  addLuaSprite('frontboppers', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('frontboppers', 'idle', 'frontboppers', 24, true);
	  addLuaSprite('headlights', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('headlights', 'idle', 'lightsrepeated', 30, true);
--


makeAnimatedLuaSprite('Max', 'characters/Max' )
makeAnimatedLuaSprite('Abel', 'characters/Abel' )
makeAnimatedLuaSprite('Olley', 'characters/Olley')

scaleObject('Olley',1.2, 1.2)

addLuaSprite('Max', false); 
addAnimationByPrefix('Max', 'down', 'MAXDOWN',  14, false);
addAnimationByPrefix('Max', 'left', 'MAXLEFT',  14, false);
addAnimationByPrefix('Max', 'right', 'MAXRIGHT',14, false);
addAnimationByPrefix('Max', 'up', 'MAXUP',      14, false);
addAnimationByPrefix('Max', 'idle', 'MAXIDLE',  24, true);

addLuaSprite('Abel', false); 
addAnimationByPrefix('Abel', 'down', 'ABELDOWN',   24, false);
addAnimationByPrefix('Abel', 'left', 'ABELLEFT',   24, false);
addAnimationByPrefix('Abel', 'right', 'ABELRIGHT', 24, false);
addAnimationByPrefix('Abel', 'up', 'ABELUP',       24, false);
addAnimationByPrefix('Abel', 'idle', 'ABELIDLE',   24, true);

  addLuaSprite('Olley', false);
addAnimationByPrefix('Olley', 'down', 'OLLEYDOWN',   24, false);
addAnimationByPrefix('Olley', 'left', 'OLLEYLEFT',   24, false);
addAnimationByPrefix('Olley', 'right', 'OLLEYRIGHT', 24, false);
addAnimationByPrefix('Olley', 'up', 'OLLEYUP',       24, false);
addAnimationByPrefix('Olley', 'idle', 'OLLEYDLE',    24, true);
addOffset('Olley','down',-7,-21)
addOffset('Olley','left',-6,-24)
addOffset('Olley','right',-7,-18)
addOffset('Olley','up',-7,-23)
addOffset('Olley','idle',-9,-19)
playAnim('Olley','idle', true)
end
local sk = {'down', 'left', 'right', 'up'}
function onEvent(skibidi,v1)
	if skibidi == 'Screen Shake' then
		if v1== 'olley'then
		local randomAnimIndex = getRandomInt(1, #sk) 
        playAnim('Olley', sk[randomAnimIndex], true)
	end
end
end
function onBeatHit()
	local animIndex = curBeat % 4     
	local AbelAnimName = getProperty('Abel.animation.curAnim.name')
	if AbelAnimName ~= 'idle' and getProperty('Abel.animation.curAnim.finished') == true then
		playAnim('Abel','idle', true)
    end

    local OlleyAnimName = getProperty('Olley.animation.curAnim.name')
    if OlleyAnimName ~= 'idle' and getProperty('Olley.animation.curAnim.finished') == true then
		playAnim('Olley','idle', true)
    end

    local MaxAnimName = getProperty('Max.animation.curAnim.name')
    if MaxAnimName ~= 'idle' and getProperty('Max.animation.curAnim.finished') == true  then
		playAnim('Max','idle', true)
    end
	if curBeat %8== 0 then
		local randomAnimIndex = getRandomInt(1, #sk) 
        playAnim('Olley', sk[randomAnimIndex], true)
	end
    if curBeat > 31 and curBeat <128 then
        
if curBeat % 2 == 0 then
    playAnim('Max', 'up', true)
	setProperty('Max.x', 1100)
setProperty('Max.y', 170+3)
elseif curBeat % 3 == 0 then
    playAnim('Max', 'left', true)
	setProperty('Max.x', 1050 + 4)
setProperty('Max.y', 150)
elseif curBeat % 4 == 0 then
    playAnim('Max', 'down', true)
	setProperty('Max.x', 1100 + 1)
setProperty('Max.y', 200 - 6)
elseif curBeat % 5 == 0 then
	setProperty('Max.x', 1100 + 5)
setProperty('Max.y', 150)
    playAnim('Max', 'right', true)
end
end
if curBeat > 159 and curBeat <320 then
        
	if animIndex == 0 then
		runTimer('upm',0.2)
		playAnim('Max', 'up', true)
		setProperty('Max.x', 1100)
	setProperty('Max.y', 170+3)
elseif animIndex == 1 then
	runTimer('leftm',0.2)
		playAnim('Max', 'left', true)
		setProperty('Max.x', 1050 + 4)
	setProperty('Max.y', 150)
elseif animIndex == 2 then
	runTimer('downm',0.2)
		playAnim('Max', 'down', true)
		setProperty('Max.x', 1100 + 1)
	setProperty('Max.y', 200 - 6)
elseif animIndex == 3 then
	runTimer('rightm',0.2)
		setProperty('Max.x', 1100 + 5)
	setProperty('Max.y', 150)
		playAnim('Max', 'right', true)
	end
	end
	
   
if curBeat <320 then
if animIndex == 0 then
    setProperty('Abel.x', -370)
    setProperty('Abel.y', 170)
	runTimer('down',0.15)
    playAnim('Abel', 'up', true)
elseif animIndex == 1 then
    setProperty('Abel.x', -385)
    setProperty('Abel.y', 200-10)
	runTimer('left',0.15)
    playAnim('Abel', 'left', true)
elseif animIndex == 2 then
    setProperty('Abel.x', -370)
    setProperty('Abel.y', 205)
	runTimer('up',0.15)
    playAnim('Abel', 'down', true)
elseif animIndex == 3 then
    setProperty('Abel.x', -370)
    setProperty('Abel.y', 205)
	runTimer('right',0.15)
    playAnim('Abel', 'right', true)
end
end
end
function onTimerCompleted(animIndexa)
	if animIndexa == 'upm' then
		playAnim('Max', 'up', true)
		setProperty('Max.x', 1100)
	setProperty('Max.y', 170+3)
elseif animIndexa == 'leftm' then
			playAnim('Max', 'left', true)
		setProperty('Max.x', 1050 + 4)
	setProperty('Max.y', 150)
elseif animIndexa == 'downm' then

		playAnim('Max', 'down', true)
		setProperty('Max.x', 1100 + 1)
	setProperty('Max.y', 200 - 6)
elseif animIndexa == 'rightm' then
		setProperty('Max.x', 1100 + 5)
	setProperty('Max.y', 150)
		playAnim('Max', 'right', true)
	end

	if animIndexa == 'up' then
		setProperty('Abel.x', -370)
		setProperty('Abel.y', 170)
		playAnim('Abel', 'up', true)
	elseif animIndexa == 'left' then
		setProperty('Abel.x', -385)
		setProperty('Abel.y', 200-10)
	
		playAnim('Abel', 'left', true)
	elseif animIndexa == 'down' then
		setProperty('Abel.x', -370)
		setProperty('Abel.y', 205)
	
		playAnim('Abel', 'down', true)
	elseif animIndexa == 'right' then
		setProperty('Abel.x', -370)
		setProperty('Abel.y', 205)
		
		playAnim('Abel', 'right', true)
	end
end
function onUpdate(elapsed)
if songName == 'Inverted Ascension Old' then
	removeLuaSprite('Olley', false);
end
    local AbelAnimName = getProperty('Abel.animation.curAnim.name')
    if AbelAnimName == 'idle' then
		setProperty('Abel.x', -370)
		setProperty('Abel.y', 205)
    end

    local OlleyAnimName = getProperty('Olley.animation.curAnim.name')

    if OlleyAnimName == 'idle' then
		setProperty('Olley.x', 1420)
		setProperty('Olley.y', 320)
    end

	local MaxAnimName = getProperty('Max.animation.curAnim.name')

if MaxAnimName == 'idle' then
	setProperty('Max.x', 1100)
    setProperty('Max.y', 200)
end

	if getProperty("defaultCamZoom") <0.62 then 
		setProperty("defaultCamZoom",0.62) 
	end
end