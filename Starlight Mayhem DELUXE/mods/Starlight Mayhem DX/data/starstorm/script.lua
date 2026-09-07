function onCreate()
	makeAnimatedLuaSprite('lefts', 'noteSplashes/noteSplashesBURST',615,-70)
	addAnimationByPrefix('lefts', 'leftsplash1', 'note splash purple 1', 24, false)
	addAnimationByPrefix('lefts', 'leftsplash2', 'note splash purple 2', 24, false)
	setScrollFactor('lefts', 0, 0)
	setObjectCamera('lefts', 'other')
	addLuaSprite('lefts', true)
	scaleObject('lefts', 1, 1)
	makeAnimatedLuaSprite('downs',  'noteSplashes/noteSplashesBURST',735,-70)
	addAnimationByPrefix('downs', 'downsplash1', 'note splash blue 1', 24, false)
	addAnimationByPrefix('downs', 'downsplash2', 'note splash blue 2', 24, false)
	setScrollFactor('downs', 0, 0)
	setObjectCamera('downs', 'other')
	setObjectOrder('downs', getObjectOrder('iconP1'))
	addLuaSprite('downs', true)
	scaleObject('downs', 1, 1)
	makeAnimatedLuaSprite('ups',  'noteSplashes/noteSplashesBURST',845,-70)
	addAnimationByPrefix('ups', 'upsplash1', 'note splash green 1', 24, false)
	addAnimationByPrefix('ups', 'upsplash2', 'note splash green 2', 24, false)
	setScrollFactor('ups', 0, 0)
	setObjectCamera('ups', 'other')
	setObjectOrder('ups', getObjectOrder('iconP1'))
	addLuaSprite('ups', true)
	scaleObject('ups', 1, 1)
	makeAnimatedLuaSprite('rights', 'noteSplashes/noteSplashesBURST',955,-70)
	addAnimationByPrefix('rights', 'rightsplash1', 'note splash red 2', 24, false)
	addAnimationByPrefix('rights', 'rightsplash2', 'note splash red 1', 24, false)
	setScrollFactor('rights', 0, 0)
	setObjectCamera('rights', 'other')
	setObjectOrder('rights', getObjectOrder('iconP1'))
	addLuaSprite('rights', true)
	scaleObject('rights', 1, 1)
	setProperty('lefts.visible', false)
	setProperty('downs.visible', false)
	setProperty('ups.visible', false)
	setProperty('rights.visible', false)
	if downscroll then
		setProperty('lefts.y',450)
		setProperty('downs.y',450)
		setProperty('ups.y',450)
		setProperty('rights.y',450)
	end
	if middlescroll then
		setProperty('lefts.x',290)
		setProperty('downs.x',410)
		setProperty('ups.x',525)
		setProperty('rights.x',630)
	end
	---
	precacheImage('burst/burstshine')
makeLuaSprite('burst2', 'burst/burst2', 1190, 65)
    setObjectCamera('burst2', 'hud')
    addLuaSprite('burst2')
    scaleObject('burst2',1,1) 

	makeLuaSprite('energy','',getProperty('burst2.x') + 40,getProperty('burst2.y') + 145)
    setObjectCamera('energy','hud')
    makeGraphic('energy',getProperty('burst2.width')-45,getProperty('burst2.height')-18,'40EBFF')

    addLuaSprite('energy',true)
	setProperty('energy.scale.y', getProperty('energy.scale.y') -1)
end
x= false
z= false
y= false
mecanicavelo = false
sonidodemierdaputamadrehijosdeperranomerrobenelport = false
function onFull()
if sonidodemierdaputamadrehijosdeperranomerrobenelport == false then
	playSound('back')
	sonidodemierdaputamadrehijosdeperranomerrobenelport = true
end
	makeLuaSprite('burst2', 'burst/burst1', 1190, 65)
    setObjectCamera('burst2', 'hud')
    addLuaSprite('burst2')
    scaleObject('burst2',1,1) 
	setProperty('energy.scale.y',1)
	if mecanicavelo == false then
	makeGraphic('energy',getProperty('burst2.width')-45,getProperty('burst2.height')-18,'F74FFF')
	end
end

	function onUpdate(elapsed)
		if fa == true then
			setTimeBarColors('008FFF', '000000')
		for i = 0, getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'cjno' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ruby' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'rubyno' then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/NOTE_assetsBURST');
				
			end
		end
		for i=0,7 do
		
			setPropertyFromGroup('strumLineNotes', i, 'texture', 'noteSkins/NOTE_assetsBURST')
		   end
		   
			   for i=0,
			   getProperty('unspawnNotes.length')-1 do
		   
		   end
		end
		if fa == false then
			setTimeBarColors('FFFFFF', '000000')
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'cjno' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'ruby' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'rubyno' then
					setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/NOTE_assets');
				end
			end
			for i=0,7 do
			
				setPropertyFromGroup('strumLineNotes', i, 'texture', 'noteSkins/NOTE_assets')
			   end
			   
				   for i=0,
				   getProperty('unspawnNotes.length')-1 do
				   end
			   end
end 
function onUpdatePost()

	if getProperty('INTRO.alpha') == 0.6 then
		for i = 0, getProperty('grpNoteSplashes.length')-1 do
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.x',9995)
			setPropertyFromGroup('grpNoteSplashes', i, 'offset.y', 0)
		end
	end
	if getProperty('energy.scale.y') <= 0 then
		sonidodemierdaputamadrehijosdeperranomerrobenelport = false
		makeGraphic('energy',getProperty('burst2.width')-45,getProperty('burst2.height')-18,'40EBFF')
		mecanicavelo = false
		makeLuaSprite('burst2', 'burst/burst2', 1190, 65)
    setObjectCamera('burst2', 'hud')
    addLuaSprite('burst2')
    scaleObject('burst2',1,1) 
	end
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and  getProperty('energy.scale.y') == 1 then
playSound('burst')
setProperty('healthLoss', 2)
setProperty('healthGain', 2)
triggerEvent('Change Scroll Speed', '1.25','0.1')
setProperty("defaultCamZoom",getProperty('camGame.zoom')+ 0.15)
fa = true
--
noteTweenAngle('A',4 , -360 , 0.3, quintOut)
noteTweenAngle('B',5 , -360 , 0.3, quintOut)
noteTweenAngle('C',6 , -360 , 0.3, quintOut)
noteTweenAngle('D',7 , -360 , 0.3, quintOut)

noteTweenAngle('E',0 , -360 , 0.3, quintOut)
noteTweenAngle('F',1 , -360 , 0.3, quintOut)
noteTweenAngle('G',2 , -360 , 0.3, quintOut)
noteTweenAngle('H',3 , -360 , 0.3, quintOut)
--
makeAnimatedLuaSprite('burstshine', 'burst/burstshine',0, 0);
scaleObject('burstshine',1,1)
setObjectCamera('burstshine', 'other')
addLuaSprite('burstshine', true);
addAnimationByPrefix('burstshine', 'idle', 'burst shine', 24, true);

makeLuaSprite('INTRO', '', -950, -600)
luaSpriteMakeGraphic('INTRO', 3000, 3000, '000000')
addLuaSprite('INTRO', false)
setObjectCamera('INTRO', 'hud')
doTweenAlpha('das','INTRO','0.6', '0.25')
--
makeGraphic('energy',getProperty('burst2.width')-45,getProperty('burst2.height')-18,'FEFFF2')
mecanicavelo = true
runTimer('a',0.1)
	end
	if getProperty('energy.scale.y') >= 1 then
		onFull() 
		x = true
	end 
	
	if getProperty('energy.scale.y') <1 then
	if z == true then

            setProperty('energy.scale.y', getProperty('energy.scale.y') + 0.01)
       z = false
			setProperty('energy.y', getProperty('energy.y') - 1.400)
    end
end
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if not isSustainNote then
		if getProperty('INTRO.alpha') == 0.6 then
		if noteData == 0 then
			setProperty('lefts.visible', true)
			objectPlayAnimation('lefts', 'leftsplash'..getRandomInt(1,2), true)
			runTimer('leftsplashtimer', 0.15, 1)
		end
		if noteData == 1 then
			setProperty('downs.visible', true)
			objectPlayAnimation('downs', 'downsplash'..getRandomInt(1,2), true)
			runTimer('downsplashtimer', 0.15, 1)
		end
		if noteData == 2 then
			setProperty('ups.visible', true)
			objectPlayAnimation('ups', 'upsplash'..getRandomInt(1,2), true)
			runTimer('upsplashtimer', 0.15, 1)
		end
		if noteData == 3 then
			setProperty('rights.visible', true)
			objectPlayAnimation('rights', 'rightsplash'..getRandomInt(1,2), true)
			runTimer('rightsplashtimer', 0.15, 1)
		end
	end
end
	if mecanicavelo == false and not isSustainNote then
	if y == false then
z= true
	end
end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'leftsplashtimer' then
		setProperty('lefts.visible', false)
	end
	if tag == 'downsplashtimer' then
		setProperty('downs.visible', false)
	end
	if tag == 'upsplashtimer' then
		setProperty('ups.visible', false)
	end
	if tag == 'rightsplashtimer' then
		setProperty('rights.visible', false)
	end
if tag == 'a' then
	if getProperty('energy.scale.y') >= 0 then
	runTimer('a',0.095)
	setProperty('energy.scale.y', getProperty('energy.scale.y') - 0.01)
	setProperty('energy.y', getProperty('energy.y') + 1.400)
	if getProperty('energy.scale.y') <= 0 then
		playSound('back')
		setProperty('healthLoss', 1)
		setProperty('healthGain', 1)
		noteTweenAngle('A',4 , 360 , 0.3, quintOut)
		noteTweenAngle('B',5 , 360 , 0.3, quintOut)
		noteTweenAngle('C',6 , 360 , 0.3, quintOut)
		noteTweenAngle('D',7 , 360 , 0.3, quintOut)
		if getProperty("defaultCamZoom") >= 0.62 then 
		setProperty("defaultCamZoom",getProperty('camGame.zoom')- 0.15) 
		end
		noteTweenAngle('E',0 , 360 , 0.3, quintOut)
		noteTweenAngle('F',1 , 360 , 0.3, quintOut)
		noteTweenAngle('G',2 , 360 , 0.3, quintOut)
		noteTweenAngle('H',3 , 360 , 0.3, quintOut)
		triggerEvent('Change Scroll Speed', '1','0.1')
		removeLuaSprite('burstshine',false)
		doTweenAlpha('das','INTRO','0', '0.25')
fa=false
end
end
end
end