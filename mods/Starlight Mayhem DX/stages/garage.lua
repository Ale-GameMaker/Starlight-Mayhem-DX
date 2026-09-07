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
makeAnimatedLuaSprite('gf2', 'Characters/GF_assets',448 ,140); 
if songName == 'Starstorm' then
	makeAnimatedLuaSprite('gf2', 'Characters/new/girlfriendCJ',448 ,140); 
end
makeAnimatedLuaSprite('Max', 'CJ/gstage/Mark_Faith',-440, 265); 
scaleObject('Max',0.9, 0.9)
makeAnimatedLuaSprite('Abel', 'CJ/gstage/Olley',900, 90); 
makeAnimatedLuaSprite('Olley', 'CJ/gstage/Vade',1150, 50);
 --Added offscreen before it starts moving.
 addAnimationByIndices('gf2', 'idle', 'GF Dancing Beat','30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14',24);
addAnimationByIndices('gf2', 'idle2', 'GF Dancing Beat','15,16,17,18,19,20,21,22,23,24,25,26,27,28,29',24);
 if songName == 'Starstorm' then
addAnimationByIndices('gf2', 'idle',  'Ruby GF Dancing Beat','30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14',24);
addAnimationByIndices('gf2', 'idle2', 'Ruby GF Dancing Beat','15,16,17,18,19,20,21,22,23,24,25,26,27,28,29',24);
 end
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
	   if curBeat %1 == 0 then
		playAnim('gf2','idle',true)
	end
	if curBeat %2 == 0 then
		playAnim('gf2','idle2',true)
	   end
end
function onEvent(name,v1,v2)
	if name == 'Alt Idle Animation' then
if v1 == 's' then
duo=true
end
if v1 == 'n'then
duo=false
end
if v2 == 'cj' then
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
end
function opponentNoteHit(id, noteData, noteType, isSustainNote)
	
	if noteType == 'rubyno' then
		runHaxeCode('game.opponentStrums.members['..noteData..'].playAnim("static", true); // thx rodney!!')
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
	if noteType == 'cjno' then
		runHaxeCode('game.opponentStrums.members['..noteData..'].playAnim("static", true); // thx rodney!!')
		if noteData == 0 then
			triggerEvent('Play Animation','singLEFT', 'dad')
				end
				if noteData == 1 then
					triggerEvent('Play Animation','singDOWN', 'dad')
				end
				if noteData == 2 then
					triggerEvent('Play Animation','singUP', 'dad')
				end
				if noteData == 3 then
					triggerEvent('Play Animation','singRIGHT', 'dad')
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
if duo== true then
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
	if songName == 'Starstorm' then
	if curStep == 776 then
		doTweenAlpha('a7', 'camHUD', 0.7,   0.15, 'linear') 
		doTweenAlpha('a', 'timeBar', 0,     0.15, 'linear') 
		doTweenAlpha('a8', 'iconP1', 0,     0.15, 'linear') 
		doTweenAlpha('a9', 'iconP2', 0,     0.15, 'linear') 
		doTweenAlpha('a2', 'timeBarBG', 0,  0.15, 'linear') 
		doTweenAlpha('a3', 'timeTxt', 0,    0.15, 'linear') 
		doTweenAlpha('a4', 'scoreTxt', 0,   0.15, 'linear') 
		doTweenAlpha('a5', 'healthBarBG',0, 0.15, 'linear') 
		doTweenAlpha('a6', 'healthBar', 0,  0.15, 'linear') 
		--
		setProperty('camFollow.x',593)
		setProperty('camFollow.y',439)
		setProperty("defaultCamZoom",0.85) 
		setProperty('cameraSpeed',2)
		if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
			doTweenAlpha('a7aaa', 'camHUD', 0,   0.15, 'linear') 
		end
	end
	if curStep == 781 then
		setProperty('cameraSpeed',1)
		setProperty("defaultCamZoom",0.64) 
	end
	if curStep == 790 then
		doTweenAlpha('a7', 'camHUD', 1,   0.35, 'linear') 
		doTweenAlpha('a', 'timeBar', 1,   0.35, 'linear') 
		doTweenAlpha('a8', 'iconP1', 1,   0.35, 'linear') 
		doTweenAlpha('a9', 'iconP2', 1,   0.35, 'linear') 
		doTweenAlpha('a2', 'timeBarBG', 1,  0.35, 'linear') 
		doTweenAlpha('a3', 'timeTxt', 1,    0.35, 'linear') 
		doTweenAlpha('a4', 'scoreTxt', 1,   0.35, 'linear') 
		doTweenAlpha('a5', 'healthBarBG',1, 0.35, 'linear') 
		doTweenAlpha('a6', 'healthBar', 1,  0.35, 'linear') 
		setProperty("defaultCamZoom",0.64) 
		setProperty('cameraSpeed',1)
	end
end
	if songName == 'Starstorm' then
		setProperty('gf.x',9999999999990)
	end
	setProperty('boyfriend.y',512)
	setProperty('boyfriend.x',834)
	
	if getProperty("defaultCamZoom") <0.64 then 
		setProperty("defaultCamZoom",0.64) 
	end
end