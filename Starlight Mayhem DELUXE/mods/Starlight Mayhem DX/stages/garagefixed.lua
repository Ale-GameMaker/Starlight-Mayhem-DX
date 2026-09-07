gfx=448
gfy=140
function onCreate()

	makeLuaSprite('stage', 'CJ/gstage/lebg2', -650, -200);
scaleObject('stage',1, 1)
	
	makeAnimatedLuaSprite('frontboppers', 'CJ/frontboppers',-700, 930);
	scaleObject('frontboppers',1.1,1.1)
    makeAnimatedLuaSprite('headlights', 'CJ/gstage/LIGHTSHINE',-600, -220);

	addLuaSprite('stagefront', false);
	addAnimationByPrefix('stagefront', 'idle', 'lights UliseGas', 1, true);
	addLuaSprite('stage', false);

	addAnimationByPrefix('frontboppers', 'idle', 'frontboppers', 24, true);
	  addLuaSprite('headlights', false); --Added offscreen before it starts moving.
	addAnimationByPrefix('headlights', 'idle', '', 24, true);
--
makeAnimatedLuaSprite('headlights2', 'CJ/gstage/LIGHTSHINE',-200, -220);
addLuaSprite('headlights2', false); --Added offscreen before it starts moving.
addAnimationByPrefix('headlights2', 'idle', '', 24, true);
--
makeAnimatedLuaSprite('gf2', 'Characters/GF_assets',gfx,gfy); 
makeAnimatedLuaSprite('Max', 'CJ/gstage/Mark_Faith',-440, 265); 
scaleObject('Max',0.9, 0.9)
makeAnimatedLuaSprite('Abel', 'CJ/gstage/Olley',900, 90); 
makeAnimatedLuaSprite('Olley', 'CJ/gstage/Vade',1150, 50);
 --Added offscreen before it starts moving.

addAnimationByPrefix('gf2', 'up', 'GF Up Note',      24,false);
addAnimationByPrefix('gf2', 'down', 'GF Down Note',  24,false);
addAnimationByPrefix('gf2', 'left',  'GF left note', 24,false);
addAnimationByPrefix('gf2', 'right', 'GF Right Note',24,false);
addAnimationByIndices('gf2', 'idle', 'GF Dancing Beat','30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29',24);


addLuaSprite('Max', false); --Added offscreen before it starts moving.
addAnimationByPrefix('Max', 'idle', '', 24,   false);
addLuaSprite('Abel', false); --Added offscreenfalseore it starts moving.
addAnimationByPrefix('Abel', 'idle', '', 24,  false);
  addLuaSprite('Olley', false); --Added offscrfalsebefore it starts moving.
addAnimationByPrefix('Olley', 'idle', '', 24, false);
addLuaSprite('gf2', false);
end
function onBeatHit()
	if curBeat %2 == 0 then
		playAnim('Max','idle',true)
		playAnim('Abel','idle',true)
		playAnim('Olley','idle',true)
	end
end
function onEvent(name,v1,v2)
	if name == 'Screen Shake' then
if v1 == 'camararuby' then
	setProperty("defaultCamZoom",0.67) 
	triggerEvent('Camera Follow Pos', '613', '459')
end
if v1 == 'camaragf'then
	setProperty("defaultCamZoom",0.8) 
	triggerEvent('Camera Follow Pos', '809', '400')
end
if v1 == 'camaraduo'then
	setProperty("defaultCamZoom",0.7) 
	triggerEvent('Camera Follow Pos', '613', '459')
end
if v1 == 'camaraduo2'then
	setProperty("defaultCamZoom",0.72) 
	triggerEvent('Camera Follow Pos', '970', '460')
end
if v1 == 'camaracj'then
	setProperty("defaultCamZoom",0.64) 
	triggerEvent('Camera Follow Pos', '593', '439')
end
if v1 == 'camarabf'then
	setProperty("defaultCamZoom",0.64) 
	triggerEvent('Camera Follow Pos', '941.5', '441')
end
if v2 == 'cj' then
	setProperty("defaultCamZoom",0.64) 
	triggerEvent('Camera Follow Pos', '593', '439')
	if getProperty('iconP2.angle') == 0 then
	doTweenAngle('asd','iconP2',360,0.25,quintOut)
	end
	if getProperty('iconP2.angle') == 360 then
		doTweenAngle('asd','iconP2',0,0.25,quintOut)
		end
	runHaxeCode([[
		game.iconP2.changeIcon('cj');
	]])
	setProperty('dad.healthColorArray', {0, 75, 255})
	triggerEvent('Change Character', 'dad', getProperty('dad.curCharacter'))
end
if v2 == 'r' then
	setProperty("defaultCamZoom",0.67) 
	triggerEvent('Camera Follow Pos', '613', '459')
	if getProperty('iconP2.angle') == 0 then
		doTweenAngle('asd','iconP2',360,0.25,quintOut)
		end
		if getProperty('iconP2.angle') == 360 then
			doTweenAngle('asd','iconP2',0,0.25,quintOut)
			end
	runHaxeCode([[
		game.iconP2.changeIcon('ruby');
	]])
	setProperty('dad.healthColorArray', {155, 0, 255})
	triggerEvent('Change Character', 'dad', getProperty('dad.curCharacter'))
end
if v2 == 'cr' then
	setProperty("defaultCamZoom",0.7) 
	triggerEvent('Camera Follow Pos', '613', '459')
	if getProperty('iconP2.angle') == 0 then
		doTweenAngle('asd','iconP2',360,0.25,quintOut)
		end
		if getProperty('iconP2.angle') == 360 then
			doTweenAngle('asd','iconP2',0,0.25,quintOut)
			end
	runHaxeCode([[
		game.iconP2.changeIcon('duet');
	]])
	setProperty('dad.healthColorArray', {0, 75, 255})
	triggerEvent('Change Character', 'dad', getProperty('dad.curCharacter'))
end
end
--------------
if v2 == 'b' then
	setProperty("defaultCamZoom",0.64) 
	triggerEvent('Camera Follow Pos', '941.5', '441')
	if getProperty('iconP1.angle') == 0 then
	doTweenAngle('asasdadda','iconP1',360,0.25,quintOut)
	end
	if getProperty('iconP1.angle') == 360 then
		doTweenAngle('asdaadsasd','iconP1',0,0.25,quintOut)
		end
	runHaxeCode([[
		game.iconP1.changeIcon('bf');
	]])
	setProperty('boyfriend.healthColorArray', {49, 176, 209})
	triggerEvent('Change Character', 'boyfriend', getProperty('boyfriend.curCharacter'))
end
if v2 == 'g' then
	setProperty("defaultCamZoom",0.8) 
	triggerEvent('Camera Follow Pos', '809', '400')
	if getProperty('iconP1.angle') == 0 then
		doTweenAngle('asasdasdd','iconP1',360,0.25,quintOut)
		end
		if getProperty('iconP1.angle') == 360 then
			doTweenAngle('aasdasdsd','iconP1',0,0.25,quintOut)
			end
	runHaxeCode([[
		game.iconP1.changeIcon('gf');
	]])
	setProperty('boyfriend.healthColorArray', {165, 0, 77})
	triggerEvent('Change Character', 'boyfriend', getProperty('boyfriend.curCharacter'))
end
if v2 == 'bg' then
	setProperty("defaultCamZoom",0.72) 
	triggerEvent('Camera Follow Pos', '970', '460')
	if getProperty('iconP1.angle') == 0 then
		doTweenAngle('asddasasdd','iconP1',360,0.25,quintOut)
		end
		if getProperty('iconP1.angle') == 360 then
			doTweenAngle('asadasdd','iconP1',0,0.25,quintOut)
			end
	runHaxeCode([[
		game.iconP1.changeIcon('bfgf');
	]])
	setProperty('boyfriend.healthColorArray', {49, 176, 209})
	triggerEvent('Change Character', 'boyfriend', getProperty('boyfriend.curCharacter'))
end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'codagf' then
		if noteData == 0 then
	playAnim('gf2','left',true)
	
	setProperty('gf2.x',gfx)
	setProperty('gf2.y',gfy+10)
				end
				if noteData == 1 then
					setProperty('gf2.x',gfx)
					setProperty('gf2.y',gfy+10)
					playAnim('gf2','down',true)
				end
				if noteData == 2 then
					setProperty('gf2.x',gfx)
					setProperty('gf2.y',gfy-13)
					playAnim('gf2','up',true)
				end
				if noteData == 3 then
					setProperty('gf2.x',gfx)
					setProperty('gf2.y',gfy+10)
					playAnim('gf2','right',true)
				end
			
	end
	if noteType == 'codaduo2' then

		if noteData == 0 then
			playAnim('gf2','left',true)
			
			setProperty('gf2.x',gfx)
			setProperty('gf2.y',gfy+10)
						end
						if noteData == 1 then
							setProperty('gf2.x',gfx)
							setProperty('gf2.y',gfy+10)
							playAnim('gf2','down',true)
						end
						if noteData == 2 then
							setProperty('gf2.x',gfx)
							setProperty('gf2.y',gfy-13)
							playAnim('gf2','up',true)
						end
						if noteData == 3 then
							setProperty('gf2.x',gfx)
							setProperty('gf2.y',gfy+10)
							playAnim('gf2','right',true)
						end
			end
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	
	if noteType == 'codaruby' then

		if noteData == 0 then
			triggerEvent('Play Animation','singLEFT', 'gf')
				end
				if noteData == 1 then
					triggerEvent('Play Animation','singDOWN', 'gf')
				end
				if noteData == 2 then
					triggerEvent('Play Animation','singUP', 'gf')
				end
				if noteData == 3 then
					triggerEvent('Play Animation','singRIGHT', 'gf')
				end
			
	end

	if noteType == 'ruby' then

		if noteData == 0 then
			triggerEvent('Play Animation','singLEFT', 'gf')
				end
				if noteData == 1 then
					triggerEvent('Play Animation','singDOWN', 'gf')
				end
				if noteData == 2 then
					triggerEvent('Play Animation','singUP', 'gf')
				end
				if noteData == 3 then
					triggerEvent('Play Animation','singRIGHT', 'gf')
				end
			
	end 
	if noteType == 'codaduo' then
	if noteData == 0 then
		triggerEvent('Play Animation','singLEFT', 'gf')
			end
			if noteData == 1 then
				triggerEvent('Play Animation','singDOWN', 'gf')
			end
			if noteData == 2 then
				triggerEvent('Play Animation','singUP', 'gf')
			end
			if noteData == 3 then
				triggerEvent('Play Animation','singRIGHT', 'gf')
			end
		end

	end
function onUpdatePost(elapsed)
	if getProperty('gf2.animation.curAnim.finished') == true then
		setProperty('gf2.x',gfx)
		setProperty('gf2.y',gfy)
	playAnim('gf2','idle',true)
	end
	setProperty('boyfriend.y',512)
	setProperty('boyfriend.x',834)
	
	if getProperty("defaultCamZoom") <0.64 then 
		setProperty("defaultCamZoom",0.64) 
	end
end