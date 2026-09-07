dialogo=0
function onEvent(name, value1, value2)
    if name =='Set GF Speed' then

        runTimer('thing', 0.0075, 0)
        lol=stringSplit(value1,'')
        addLuaText('cmamoxdxd',true)
        Remove()
    end
end
function Remove()
    perras=1
setTextString('cmamoxdxd','')
end
function onCreate()
    playMusic('givealilbitback',0.75, true) 
	makeLuaSprite('INTROZ', '', -950, -600)
luaSpriteMakeGraphic('INTROZ', 3000, 3000, '000000')
addLuaSprite('INTROZ', false)
setProperty('INTROZ.alpha',0)
setObjectCamera('INTROZ', 'other')
	lol={}
    perras=1
    makeLuaText('cmamoxdxd','',955,230,570)
    setTextFont('cmamoxdxd','pfont.ttf')
    setTextAlignment('cmamoxdxd')
    setTextBorder('cmamoxdxd',2,'000000')
    setTextColor('cmamoxdxd','FFFFFF')
    setTextSize('cmamoxdxd',43)
    setObjectCamera('cmamoxdxd','other')

   
end

	function onUpdate(elapsed)
        if isStoryMode then
		if sepuede == true then

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER')  then
				dialogo=dialogo+1
				end
				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER')  and getProperty('BURSTshiit.y') == 0 then
					doTweenY('ssaaaXDwenmmsi', 'BURSTshiit', -700, 1, 'CircOut')
					runTimer('EMPIEZA LA MIERDA', 4)
					doTweenAlpha('daasdssd', 'INTROZ', 0, 1)
					runTimer('EMPIEZA LA MIERDA1', 1)
				end
				

				if dialogo == 0 then
				
					makeLuaSprite('1', 'cutscenes/1',0, 0);
					scaleObject('1',0.75,0.75)
					setObjectCamera('1', 'other')
					addLuaSprite('1', false);
	
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 1 then
					if getTextString('cmamoxdxd') == 'one day, you decide to take your Girlfriend to a local music festival, and a local band is currently performing..' then
				triggerEvent('Set GF Speed','These Guys are really good!')
	playSound('dialogos/gf1',7,'gf1')
	
				makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
				addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
				setObjectCamera('tags', 'other')
				scaleObject('tags', 0.1,0.1)
				addLuaSprite('tags', true)
				
					end
				
	
					makeLuaSprite('1', 'cutscenes/1',0, 0);
					scaleObject('1',0.75,0.75)
					setObjectCamera('1', 'other')
					addLuaSprite('1', false);
	
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 2 then
					if getTextString('cmamoxdxd') == 'These Guys are really good!' then
						playSound('dialogos/gf2',7,'gf1')
					triggerEvent('Set GF Speed','Thank you for bringing me to this festival, Boyfriend!')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('1', 'cutscenes/1',0, 0);
					scaleObject('1',0.75,0.75)
					setObjectCamera('1', 'other')
					addLuaSprite('1', false);
	
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 3 then
					if getTextString('cmamoxdxd') == 'Thank you for bringing me to this festival, Boyfriend!' then
                        
					triggerEvent('Set GF Speed','Too bad this is the last show, I was really enjoying it!')
					playSound('dialogos/gf3',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('1', 'cutscenes/1',0, 0);
					scaleObject('1',0.75,0.75)
					setObjectCamera('1', 'other')
					addLuaSprite('1', false);
	
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 4 then
					if getTextString('cmamoxdxd') == 'Too bad this is the last show, I was really enjoying it!' then
					triggerEvent('Set GF Speed','Boop!')
					playSound('boop',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '1tags bf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('1', 'cutscenes/1',0, 0);
					scaleObject('1',0.75,0.75)
					setObjectCamera('1', 'other')
					addLuaSprite('1', false);
	
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 5 then
					if getTextString('cmamoxdxd') == 'Boop!' then
						playSound('dialogos/cj1',7,'gf1')
						triggerEvent('Set GF Speed','Thank you, thank you, everyone! It’s awesome to be having all of you he-...')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						end
					makeLuaSprite('2', 'cutscenes/2',0, 0);
					scaleObject('2',0.75,0.75)
					setObjectCamera('2', 'other')
					addLuaSprite('2', false);
					
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 6 then
					if getTextString('cmamoxdxd') == 'Thank you, thank you, everyone! It’s awesome to be having all of you he-...' then
						triggerEvent('Set GF Speed','Huh?')
						playSound('dialogos/cj2',7,'gf1')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						end
					makeLuaSprite('2', 'cutscenes/2',0, 0);
					scaleObject('2',0.75,0.75)
					setObjectCamera('2', 'other')
					addLuaSprite('2', false);
					
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 7 then
					if getTextString('cmamoxdxd') == 'Huh?' then
						playSound('dialogos/cj3',7,'gf1')
						triggerEvent('Set GF Speed','Hang on a second. Is that...?!')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						end
					makeLuaSprite('2', 'cutscenes/2',0, 0);
					scaleObject('2',0.75,0.75)
					setObjectCamera('2', 'other')
					addLuaSprite('2', false);
					
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
	
				if dialogo == 8 then
					if getTextString('cmamoxdxd') == 'Hang on a second. Is that...?!' then
						playSound('dialogos/cj4',7,'gf1')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						triggerEvent('Set GF Speed','You there! Yeah, you! Blue dude in the white tee, step up right here!')
						end
					makeLuaSprite('3', 'cutscenes/3',0, 0);
					scaleObject('3',0.75,0.75)
					setObjectCamera('3', 'other')
					addLuaSprite('3',false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 9 then
					if getTextString('cmamoxdxd') == 'You there! Yeah, you! Blue dude in the white tee, step up right here!' then
						triggerEvent('Set GF Speed','boop!?')
						playSound('boop',7,'gf1')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '1tags bf', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						end
					makeLuaSprite('3', 'cutscenes/3',0, 0);
					scaleObject('3',0.75,0.75)
					setObjectCamera('3', 'other')
					addLuaSprite('3',false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 10 then
					if getTextString('cmamoxdxd') == 'boop!?' then
						triggerEvent('Set GF Speed','Does he know you? should we go up?')
						playSound('dialogos/gf4',7,'gf1')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						end
					makeLuaSprite('3', 'cutscenes/3',0, 0);
					scaleObject('3',0.75,0.75)
					setObjectCamera('3', 'other')
					addLuaSprite('3',false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 11 then
					if getTextString('cmamoxdxd') == 'Does he know you? should we go up?' then
						triggerEvent('Set GF Speed','Boop!')
						playSound('boop',7,'gf1')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '1tags bf', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						end
					makeLuaSprite('3', 'cutscenes/3',0, 0);
					scaleObject('3',0.75,0.75)
					setObjectCamera('3', 'other')
					addLuaSprite('3',false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 12 then
					if getTextString('cmamoxdxd') == 'Boop!' then
						playSound('dialogos/gf5',7,'gf1')
						triggerEvent('Set GF Speed',"Welp, why not. come on, let's go!")
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						end
					makeLuaSprite('3', 'cutscenes/3',0, 0);
					scaleObject('3',0.75,0.75)
					setObjectCamera('3', 'other')
					addLuaSprite('3',false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 13 then
					if getTextString('cmamoxdxd') == "Welp, why not. come on, let's go!" then
						playSound('dialogos/cj5',7,'gf1')
					triggerEvent('Set GF Speed','Heh sorry bringing you up here all of a sudden, but I just need to know...')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 14 then
					if getTextString('cmamoxdxd') == 'Heh sorry bringing you up here all of a sudden, but I just need to know...' then
					triggerEvent('Set GF Speed','Sooo... you’re Boyfriend, right?')
					playSound('dialogos/cj6',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 15 then
					if getTextString('cmamoxdxd') == 'Sooo... you’re Boyfriend, right?' then
					triggerEvent('Set GF Speed','Boop!')
					playSound('boop',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '1tags bf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 16 then
					if getTextString('cmamoxdxd') == 'Boop!' then
					triggerEvent('Set GF Speed','Hah! I never knew I’d be running into you here, especially after what I’ve heard about you')
					playSound('dialogos/cj7',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 17 then
					if getTextString('cmamoxdxd') == 'Hah! I never knew I’d be running into you here, especially after what I’ve heard about you' then
					triggerEvent('Set GF Speed',"You're the one that beat DD and MM in their own game right?")
					playSound('dialogos/cj8',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 18 then
					if getTextString('cmamoxdxd') == "You're the one that beat DD and MM in their own game right?" then
						playSound('dialogos/cj9',7,'gf1')
					triggerEvent('Set GF Speed','Hell, you even managed to defeat that one up and coming robot dude.')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 19 then
					if getTextString('cmamoxdxd') == 'Hell, you even managed to defeat that one up and coming robot dude.' then
					triggerEvent('Set GF Speed','Yes he was!')
					playSound('dialogos/gf6',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 20 then
					if getTextString('cmamoxdxd') == 'Yes he was!' then
					triggerEvent('Set GF Speed','Sick!')
					playSound('dialogos/cj10',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 21 then
					if getTextString('cmamoxdxd') == 'Sick!' then
					triggerEvent('Set GF Speed','You know us?')
					playSound('dialogos/gfmissing',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo ==22 then
					if getTextString('cmamoxdxd') == 'You know us?' then
						playSound('dialogos/cj11',7,'gf1')
					triggerEvent('Set GF Speed','Why, of course I do, silly! The music scene has been going nuts about you both!')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
					end
						makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 23 then
					if getTextString('cmamoxdxd') == 'Why, of course I do, silly! The music scene has been going nuts about you both!' then
						playSound('dialogos/cj12',7,'gf1')
					triggerEvent('Set GF Speed','Never thought that I’d be getting to meet up with big dudes so soon.')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 24 then
					if getTextString('cmamoxdxd') == 'Never thought that I’d be getting to meet up with big dudes so soon.' then
						playSound('dialogos/cj13',7,'gf1')
					triggerEvent('Set GF Speed','And you must be The Girlfriend right? The Dearest’s daughter, yeah?')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '6tags singer', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 25 then
					if getTextString('cmamoxdxd') == 'And you must be The Girlfriend right? The Dearest’s daughter, yeah?' then
						playSound('dialogos/gf7',7,'gf1')
					triggerEvent('Set GF Speed','yep')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 26 then
					if getTextString('cmamoxdxd') == 'yep' then
						playSound('dialogos/cj15',7,'gf1')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '2tags cj', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						triggerEvent('Set GF Speed','Heh, what a duo you both are.  The names’ CJ by the way, but I bet that you already knew that!  And now that you’re both here...')
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 27 then
					if getTextString('cmamoxdxd') == 'Heh, what a duo you both are.  The names’ CJ by the way, but I bet that you already knew that!  And now that you’re both here...' then
						playSound('boop',7,'gf1')
						triggerEvent('Set GF Speed','Beep Boop!')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '1tags bf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('4', 'cutscenes/4',0, 0);
					scaleObject('4',0.75,0.75)
					setObjectCamera('4', 'other')
					addLuaSprite('4', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 28 then
					if getTextString('cmamoxdxd') == 'Beep Boop!' then
						playSound('dialogos/cj16',7,'gf1')
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '2tags cj', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
						triggerEvent('Set GF Speed','I’ll quit the rambling. Sorry for interrupting your date over here little dude, buuut... what do you say? up for a friendly match? Just the two of us?')
					end
					makeLuaSprite('5', 'cutscenes/5',0, 0);
					scaleObject('5',0.75,0.75)
					setObjectCamera('5', 'other')
					addLuaSprite('5', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 29 then
					if getTextString('cmamoxdxd') == 'I’ll quit the rambling. Sorry for interrupting your date over here little dude, buuut... what do you say? up for a friendly match? Just the two of us?' then
					triggerEvent('Set GF Speed','(Since we are really not that famous yet, battling you might up our social status) ')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '2tags cj', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					playSound('dialogos/cj17',7,'gf1')
					addLuaSprite('tags', true)	
				end
					makeLuaSprite('5', 'cutscenes/5',0, 0);
					scaleObject('5',0.75,0.75)
					setObjectCamera('5', 'other')
					addLuaSprite('5', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 30 then
					if getTextString('cmamoxdxd') == '(Since we are really not that famous yet, battling you might up our social status) ' then
						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						playSound('dialogos/gf8',7,'gf1')
						addLuaSprite('tags', true)
						triggerEvent('Set GF Speed',"I don't know.. Don't you have, like, a schedule planned for your show?")
					end
					makeLuaSprite('5', 'cutscenes/5',0, 0);
					scaleObject('5',0.75,0.75)
					setObjectCamera('5', 'other')
					addLuaSprite('5', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 31 then
					if getTextString('cmamoxdxd') == "I don't know.. Don't you have, like, a schedule planned for your show?" then
					triggerEvent('Set GF Speed','Beep!!!')
					playSound('boop',7,'gf1')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '1tags bf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('5', 'cutscenes/5',0, 0);
					scaleObject('5',0.75,0.75)
					setObjectCamera('5', 'other')
					addLuaSprite('5', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo ==32 then
					if getTextString('cmamoxdxd') == 'Beep!!!' then
					playSound('dialogos/cj18',7,'gf1')
					triggerEvent('Set GF Speed','Sick. Just warning you ahead, I ain’t going easy on you! ')
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '2tags cj', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('5', 'cutscenes/5',0, 0);
					scaleObject('5',0.75,0.75)
					setObjectCamera('5', 'other')
					addLuaSprite('5', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo == 33 then
					
					if getTextString('cmamoxdxd') == 'Sick. Just warning you ahead, I ain’t going easy on you! ' then
						playSound('dialogos/gf9',7,'gf1')
					triggerEvent('Set GF Speed',"(he didn't answer my question!)")
					makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
					addAnimationByPrefix('tags', 'xd', '3tags gf', 24, false)
					setObjectCamera('tags', 'other')
					scaleObject('tags', 0.1,0.1)
					addLuaSprite('tags', true)
					end
					makeLuaSprite('5', 'cutscenes/5',0, 0);
					scaleObject('5',0.75,0.75)
					setObjectCamera('5', 'other')
					addLuaSprite('5', false);
	
					
					makeLuaSprite('White4', '', 00, 530)
			luaSpriteMakeGraphic('White4', 3000, 300, '000000')
			addLuaSprite('White4', false)
			setObjectCamera('White4', 'other')
			setProperty('White4.alpha',0.5)
				end
				if dialogo >= 34 and dialogo <40 then
	dialogo = 41
	triggerEvent('Play Animation','INTRO2','dad')
	setProperty('camHUD.alpha',0)
					doTweenAlpha('jXXDF', 'cmamoxdxd' , 0, 0.25, 'linear')
					doTweenAlpha('j', '1' , 0, 0.25, 'linear')
					removeLuaSprite('2', false);
					removeLuaSprite('3', false);
					removeLuaSprite('4', false);
					doTweenAlpha('j3f1f31f3', '5' , 0,  0.25, 'linear')
					doTweenAlpha('jfrasasdasdasdgr', 'White4' , 0,  0.25, 'linear')
					doTweenAlpha('jfraadaddzzzsdadsgr', 'tags' , 0,  0.25, 'linear')
				end
			end			
        end
            end
function onTweenCompleted(tag)
	if tag == 'j' then
	runTimer('usocarrusoesparamaricas',0.5)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'EMPIEZA LA MIERDA1' then
		triggerEvent('Play Animation','INTRO','dad')
		playSound('woosh')
	end
	if tag == 'EMPIEZA LA MIERDA' then
		setProperty('camHUD.alpha',1)
		
		eme=true
		startCountdown()
	end
	if tag == 'usocarrusoesparamaricas' then
        callMethodFromClass('flixel.FlxG', 'sound.music.stop', {''})
		doTweenAlpha('daasdssd','INTROZ',0.5, 1)
		makeLuaSprite('BURSTshiit', 'burst/BURSTshiit',30, 700);
		scaleObject('BURSTshiit',1,1)
		setObjectCamera('BURSTshiit', 'other')
		addLuaSprite('BURSTshiit', true);
		doTweenY('ssaaaXDwenmmsi','BURSTshiit',0,1,'CircOut')
	end
	if tag == 'A' then
		triggerEvent('Set GF Speed','Beep boop!')
	end
	if tag == 'thing' then
        if lol[perras]~=nil then
			sepuede = false
            setTextString('cmamoxdxd',getTextString('cmamoxdxd')..lol[perras])
            perras=perras+1
		else
			sepuede = true
        end
end
end
eme=false
function onStartCountdown()
	if eme == false and isStoryMode then
		triggerEvent('Set GF Speed','one day, you decide to take your Girlfriend to a local music festival, and a local band is currently performing..')
        if dialogo == 0 then
				
            makeLuaSprite('1', 'cutscenes/1',0, 0);
            scaleObject('1',0.75,0.75)
            setObjectCamera('1', 'other')
            addLuaSprite('1', false);

            makeLuaSprite('White4', '', 00, 530)
    luaSpriteMakeGraphic('White4', 3000, 300, '000000')
    addLuaSprite('White4', false)
    setObjectCamera('White4', 'other')
    setProperty('White4.alpha',0.5)
        end
         return Function_Stop

    end
end