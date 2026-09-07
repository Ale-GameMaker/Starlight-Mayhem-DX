function onCreate()
	addCharacterToList('duet','1')
	addCharacterToList('duet2','1')
	addCharacterToList('BFGF','0')
	addCharacterToList('BFGF2','0')
	precacheImage('characters/Max')
	precacheImage('characters/Abel')
	precacheImage('characters/Olley')
	precacheImage('CJ/night/bg')
	precacheImage('CJ/event/bg')
	precacheImage('CJ/stage')
	precacheImage('CJ/lights')
	precacheImage('CJ/event/light')
	precacheImage('CJ/frontboppers')
	precacheImage('CJ/RGBfrontboppers')
	precacheImage('CJ/headlights')
	precacheImage('CJ/headlightsRGB')
	precacheImage('characters/NoGFRGB')
	precacheImage('characters/new/NoGFRGB')
	-- background shit
	makeLuaSprite('stageback', 'CJ/night/bg', -550, -160);
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
makeAnimatedLuaSprite('NoGFRGB', 'characters/new/NoGFRGB',300, 175);
scaleObject('NoGFRGB',1,1)
addLuaSprite('NoGFRGB', false);
addAnimationByPrefix('NoGFRGB', 'idle', 'GF Dancing Beat', 24, true);
--
	makeLuaSprite('INTRO2', '', -950, -600)
luaSpriteMakeGraphic('INTRO2', 3000, 3000, '000000')
addLuaSprite('INTRO2', false)
setProperty('INTRO2.alpha',0)
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
addOffset('Max','down',4,-3)
addOffset('Max','left',45,43)
addOffset('Max','right',8,46)
addOffset('Max','up',6,24)
addOffset('Max','idle',3,-0)
playAnim('Max','idle', true)

addLuaSprite('Abel', false); 
addAnimationByPrefix('Abel', 'down', 'ABELDOWN',   24, false);
addAnimationByPrefix('Abel', 'left', 'ABELLEFT',   24, false);
addAnimationByPrefix('Abel', 'right', 'ABELRIGHT', 24, false);
addAnimationByPrefix('Abel', 'up', 'ABELUP',       24, false);
addAnimationByPrefix('Abel', 'idle', 'ABELIDLE',   24, true);
addOffset('Abel','down',0,-30)
addOffset('Abel','left',12,-16)
addOffset('Abel','right',-1,-28)
addOffset('Abel','up',0,14)
addOffset('Abel','idle',-7,-20)
 playAnim('Abel','idle', true)

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
------------------------------------------------------

end
local sk = {'down', 'left', 'right', 'up'}
function onEvent(name,v1,v2)
	if name == 'Screen Shake' then
		if v1== 'abel' then
		local randomAnimIndex = getRandomInt(1, #sk) 
        playAnim('Abel', sk[randomAnimIndex], true)
	end
	if v1== 'max'then
		local randomAnimIndex = getRandomInt(1, #sk) 
		playAnim('Max', sk[randomAnimIndex], true)
	end
	if v1== 'olley'then
		local randomAnimIndex = getRandomInt(1, #sk) 
		playAnim('Olley', sk[randomAnimIndex], true)
	end
end
	if name == 'Alt Idle Animation' then
if v1 == 'r' then
	makeLuaSprite('stageback', 'CJ/event/bg', -550, -160);
	setLuaSpriteScrollFactor('stageback', 0.5, 0.5);
	
	makeLuaSprite('stage', 'CJ/event/stage', -650, -390);
	scaleObject('stage',1.05, 1.1)
	
	makeLuaSprite('stagefront', 'CJ/event/light', -650, -390);
	scaleObject('stagefront',1.05, 1.1)
	
	makeAnimatedLuaSprite('frontboppers', 'CJ/RGBfrontboppers',-700, 930);
	scaleObject('frontboppers',1.1,1.1)
	makeAnimatedLuaSprite('headlights', 'CJ/headlightsRGB',-560, -110);
	
	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stage', false);
	
	  addLuaSprite('frontboppers', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('frontboppers', 'idle', 'frontboppers', 24, true);
	  addLuaSprite('headlights', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('headlights', 'idle', 'lightsrepeated', 30, true);
	--
	makeAnimatedLuaSprite('NoGFRGB', 'characters/NoGFRGB',300, 398);
	scaleObject('NoGFRGB',1,1)
	addLuaSprite('NoGFRGB', false);
	addAnimationByPrefix('NoGFRGB', 'idle', 'GF Cheer', 24, true);
	--
	makeLuaSprite('INTRO2', '', -950, -600)
	luaSpriteMakeGraphic('INTRO2', 3000, 3000, '000000')
	addLuaSprite('INTRO2', false)
	setProperty('INTRO2.alpha',0)
	--
	makeAnimatedLuaSprite('Max', 'characters/Max' )
	makeAnimatedLuaSprite('Abel', 'characters/Abel' )
	makeAnimatedLuaSprite('Olley', 'characters/Olley')
	
	scaleObject('Olley',1.2, 1.2)
	
	addLuaSprite('Max', false); 
	addAnimationByPrefix('Max', 'down', 'altMAXDOWN',  24, false);
	addAnimationByPrefix('Max', 'left', 'altMAXLEFT',  24, false);
	addAnimationByPrefix('Max', 'right','altMAXRIGHT', 24, false);
	addAnimationByPrefix('Max', 'up',   'altMAXUP',    24, false);
	addAnimationByPrefix('Max', 'idle', 'altMAXIDLE',  24, true);
	addOffset('Max','down',4,-3)
	addOffset('Max','left',45,43)
	addOffset('Max','right',8,46)
	addOffset('Max','up',6,24)
	addOffset('Max','idle',3,-0)
	playAnim('Max','idle', true)
	
	addLuaSprite('Abel', false); 
	addAnimationByPrefix('Abel', 'down', 'altABELDOWN',   24, false);
	addAnimationByPrefix('Abel', 'left', 'altABELLEFT',   24, false);
	addAnimationByPrefix('Abel', 'right','altABELRIGHT', 24, false);
	addAnimationByPrefix('Abel', 'up',   'altABELUP',       24, false);
	addAnimationByPrefix('Abel', 'idle', 'altABELIDLE',   24, true);
	addOffset('Abel','down',0,-30)
	addOffset('Abel','left',12,-16)
	addOffset('Abel','right',-1,-28)
	addOffset('Abel','up',0,14)
	addOffset('Abel','idle',-7,-20)
	 playAnim('Abel','idle', true)
	
	  addLuaSprite('Olley', false);
	addAnimationByPrefix('Olley', 'down', 'altOLLEYDOWN',   24, false);
	addAnimationByPrefix('Olley', 'left', 'altOLLEYLEFT',   24, false);
	addAnimationByPrefix('Olley', 'right','altOLLEYRIGHT', 24, false);
	addAnimationByPrefix('Olley', 'up',   'altOLLEYUP',       24, false);
	addAnimationByPrefix('Olley', 'idle', 'altOLLEYDLE',    24, true);
	addOffset('Olley','down',-7,-21)
	addOffset('Olley','left',-6,-24)
	addOffset('Olley','right',-7,-18)
	addOffset('Olley','up',-7,-23)
	addOffset('Olley','idle',-9,-19)
	playAnim('Olley','idle', true)
end
if v1 == 'n' then
	makeLuaSprite('stageback', 'CJ/night/bg', -550, -160);
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
makeAnimatedLuaSprite('NoGFRGB', 'characters/new/NoGFRGB',300, 175);
scaleObject('NoGFRGB',1,1)
addLuaSprite('NoGFRGB', false);
addAnimationByPrefix('NoGFRGB', 'idle', 'GF Dancing Beat', 24, true);
--
	makeLuaSprite('INTRO2', '', -950, -600)
luaSpriteMakeGraphic('INTRO2', 3000, 3000, '000000')
addLuaSprite('INTRO2', false)
setProperty('INTRO2.alpha',0)
--
makeAnimatedLuaSprite('Max', 'characters/Max' )
makeAnimatedLuaSprite('Abel', 'characters/Abel' )
makeAnimatedLuaSprite('Olley', 'characters/Olley')

scaleObject('Olley',1.2, 1.2)

addLuaSprite('Max', false); 
addAnimationByPrefix('Max', 'down', 'MAXDOWN',  24, false);
addAnimationByPrefix('Max', 'left', 'MAXLEFT',  24, false);
addAnimationByPrefix('Max', 'right', 'MAXRIGHT',24, false);
addAnimationByPrefix('Max', 'up', 'MAXUP',      24, false);
addAnimationByPrefix('Max', 'idle', 'MAXIDLE',  24, true);
addOffset('Max','down',4,-3)
addOffset('Max','left',45,43)
addOffset('Max','right',8,46)
addOffset('Max','up',6,24)
addOffset('Max','idle',3,-0)
playAnim('Max','idle', true)

addLuaSprite('Abel', false); 
addAnimationByPrefix('Abel', 'down', 'ABELDOWN',   24, false);
addAnimationByPrefix('Abel', 'left', 'ABELLEFT',   24, false);
addAnimationByPrefix('Abel', 'right', 'ABELRIGHT', 24, false);
addAnimationByPrefix('Abel', 'up', 'ABELUP',       24, false);
addAnimationByPrefix('Abel', 'idle', 'ABELIDLE',   24, true);
addOffset('Abel','down',0,-30)
addOffset('Abel','left',12,-16)
addOffset('Abel','right',-1,-28)
addOffset('Abel','up',0,14)
addOffset('Abel','idle',-7,-20)
 playAnim('Abel','idle', true)

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
	end
end
function onStepHit()
	if curStep == 224 then

	doTweenAlpha('das','INTRO2',1, 1)
	setProperty("defaultCamZoom",getProperty('camGame.zoom')+ 0.35)
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

if curBeat >0 and curBeat <160 then
        
	if animIndex == 0 then
		runTimer('downm',0.2)
		playAnim('Max', 'up', true)

elseif animIndex == 1 then
	runTimer('rightm',0.2)
		playAnim('Max', 'left', true)

elseif animIndex == 2 then
	runTimer('upm',0.2)
		playAnim('Max', 'down', true)

elseif animIndex == 3 then
	runTimer('leftm',0.2)

		playAnim('Max', 'right', true)
	end
end
	if curBeat > 192 and curBeat <432 then
		local animIndex = curBeat % 4     
		if animIndex == 0 then
			runTimer('downm',0.2)
			playAnim('Max', 'up', true)

	elseif animIndex == 1 then
		runTimer('rightm',0.2)
			playAnim('Max', 'left', true)

	elseif animIndex == 2 then
		runTimer('upm',0.2)
			playAnim('Max', 'down', true)

	elseif animIndex == 3 then
		runTimer('leftm',0.2)

			playAnim('Max', 'right', true)
		end
	end
	
   
	if curBeat >0 and curBeat <64 then
		if curBeat % 1 == 0 then
			local randomAnimIndex = getRandomInt(1, #sk) 
				playAnim('Olley', sk[randomAnimIndex], true)
				runTimer('oleyxd',0.2)
		end
		end
		if curBeat >160 and curBeat <431 then
			if curBeat % 1 == 0 then
				local randomAnimIndex = getRandomInt(1, #sk) 
					playAnim('Olley', sk[randomAnimIndex], true)
					runTimer('oleyxd',0.2)
			end
			end
end
function onTimerCompleted(animIndexa)
	if animIndexa == 'oleyxd' then
		local randomAnimIndex = getRandomInt(1, #sk) 
        playAnim('Olley', sk[randomAnimIndex], true)
	end
	if animIndexa == 'upm' then
		playAnim('Max', 'up', true)

elseif animIndexa == 'leftm' then
			playAnim('Max', 'left', true)

elseif animIndexa == 'downm' then

		playAnim('Max', 'down', true)

elseif animIndexa == 'rightm' then
	playAnim('Max', 'right', true)
	end
end
function onUpdate(elapsed)
	if songName == 'Artificial Lust Old' then
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
	
if curStep >224 and curStep <256 then
	setProperty('cameraSpeed',0.6)
	setProperty('camFollow.x',395)
	setProperty('camFollow.y', 366);
end
if curStep >256 and curStep <290 then
	doTweenAlpha('das','INTRO2',0, 0.125)
	setProperty('cameraSpeed',18)
	setProperty("defaultCamZoom",0.62) 
end
if curStep >290 then
	setProperty('cameraSpeed',1)
end
	setProperty('gf.x',80000000)
	if getProperty("defaultCamZoom") <0.62 then 
		setProperty("defaultCamZoom",0.62) 
	end
end