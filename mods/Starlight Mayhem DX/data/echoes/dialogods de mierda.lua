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
	if isStoryMode then
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
   
end
	function onUpdate(elapsed)
        if isStoryMode then
		if sepuede == true then

			if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER')   then
				dialogo=dialogo+1
				end
				if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER')  and getProperty('BURSTshiit.y') == 0 then
					doTweenY('ssaaaXDwenmmsi', 'BURSTshiit', -700, 1, 'CircOut')
					runTimer('EMPIEZA LA MIERDA', 4)
					doTweenAlpha('daasdssd', 'INTROZ', 0, 1)
					runTimer('EMPIEZA LA MIERDA1', 1)
				end
				
				if dialogo == 0 then

				
				elseif dialogo >= 1 and dialogo <= 22 then
					local dialogueText = {
						[1] = "...",
						[2] = "Hehe, not bad bud! You managed to out-perform me somehow.",
                        [3] = "That Blue hair of yours really has something going for it.",
                        [4] = "Beep ba boop!",
                        [5] = "Not bad, that was funky indeed!",
                        [6] = "Buuut, if I were to be honest with you both… I was never really the best vocalist... of the group.",
                        [7] = "Beep...?",
                        [8] = "Ah...! I'm so sorry that I'm late! I ran into traffic and, and, Huff-huff...",
                        [9] = "Don't worry! You came here right on time!",
                        [10] = "Huh!?",
                        [11] = "Ah... it looks like you two haven’t met her yet. This is Ruby, a good old friend of mine. She’s kinda timid, but don’t let that make you underestimate her! She’s killer at vocals, that’s for sure!",
                        [12] = "Say, you wanna go at them, Ruby?",
                        [13] = "W-what now..?! Are you... asking me to challenge t-them...?",
                        [14] = "Uhm, are those the...?",
                        [15] = "Boop beep",
                        [16] = "She doesn't seem so sure of herself..",
                        [17] = "D-Don't worry... i- I can do it.. I-I need to prove myself to them, and I won’t fail that now...! to show them that I can be strong...",
                        [18] = "Well, if you say so Ruby! I knew I could count on you, don’t even sweat it! go on and break a leg out there! (But, not literally...)",
                        [19] = "Beep!",
                        [20] = "(So this is the stage fright my parents were talking about..)"

					}
				
					if getTextString('cmamoxdxd') == dialogueText[dialogo] then
						if dialogo == 1 then
							personaje='cj'
							playSound('dialogos/cj19', 7, 'gf1')
							
							triggerEvent('Set GF Speed', 'Hehe, not bad bud! You managed to out-perform me somehow.')
						elseif dialogo == 2 then
							playSound('dialogos/cj20', 7, 'gf1')
							triggerEvent('Set GF Speed', 'That Blue hair of yours really has something going for it.')
						elseif dialogo == 3 then
								personaje='bf'
								playSound('boop',7,'gf1')
							triggerEvent('Set GF Speed', 'Beep ba boop!')
						elseif dialogo == 4 then
		                	personaje='gf'  
							playSound('dialogos/gf10fixed', 7, 'gf1')
							triggerEvent('Set GF Speed', 'Not bad, that was funky indeed!')
						elseif dialogo == 5 then
		                	personaje='cj'  
							playSound('dialogos/cj21', 7, 'gf1')
							triggerEvent('Set GF Speed', 'Buuut, if I were to be honest with you both… I was never really the best vocalist... of the group.')
						elseif dialogo == 6 then
							playSound('boop',7,'gf1')
		                	personaje='bf'  
							triggerEvent('Set GF Speed', 'Beep...?')
						elseif dialogo == 7 then
						  	personaje='mistery'  
							imagenzz=7
							playSound('dialogos/ruby1', 7, 'gf1')
							triggerEvent('Set GF Speed', "Ah...! I'm so sorry that I'm late! I ran into traffic and, and, Huff-huff...")
						elseif dialogo == 8 then
				  	personaje='cj'  
					  playSound('dialogos/cj22', 7, 'gf1')
							triggerEvent('Set GF Speed', "Don't worry! You came here right on time!")
						elseif dialogo == 9 then
				  	personaje='gf'  
					  playSound('dialogos/gf11', 7, 'gf1')
							triggerEvent('Set GF Speed', 'Huh!?')
						elseif dialogo == 10 then
							imagenzz=8
							  	personaje='cj'  
								  playSound('dialogos/cj23', 7, 'gf1')
							triggerEvent('Set GF Speed', 'Ah... it looks like you two haven’t met her yet. This is Ruby, a good old friend of mine. She’s kinda timid, but don’t let that make you underestimate her! She’s killer at vocals, that’s for sure!')
						elseif dialogo == 11 then
							playSound('dialogos/cj24', 7, 'gf1')
							triggerEvent('Set GF Speed', 'Say, you wanna go at them, Ruby?')
						elseif dialogo == 12 then
							imagenzz=9
							  	personaje='ruby'  
								  playSound('dialogos/ruby2', 7, 'gf1')
							triggerEvent('Set GF Speed', 'W-what now..?! Are you... asking me to challenge t-them...?')
						elseif dialogo == 13 then
							playSound('dialogos/ruby3', 7, 'gf1')
							triggerEvent('Set GF Speed', 'Uhm, are those the...?')
						elseif dialogo == 14 then
				  	personaje='bf'  
					  playSound('boop',7,'gf1')
							triggerEvent('Set GF Speed', 'Boop beep')
						elseif dialogo == 15 then
              	personaje='gf'  
				  playSound('dialogos/gf12', 7, 'gf1')
							triggerEvent('Set GF Speed', "She doesn't seem so sure of herself..")
						elseif dialogo == 16 then
                   	personaje='ruby' 
					   playSound('dialogos/ruby4', 7, 'gf1') 
							triggerEvent('Set GF Speed', "D-Don't worry... i- I can do it.. I-I need to prove myself to them, and I won’t fail that now...! to show them that I can be strong...")
						elseif dialogo == 17 then
  	personaje='cj'  
	  playSound('dialogos/cj25', 7, 'gf1')
							triggerEvent('Set GF Speed', "Well, if you say so Ruby! I knew I could count on you, don’t even sweat it! go on and break a leg out there! (But, not literally...)")
						elseif dialogo == 18 then
  	personaje='bf'  
	  playSound('boop',7,'gf1')
							triggerEvent('Set GF Speed', 'Beep!')
						elseif dialogo == 19 then
							personaje='gf'  
							playSound('dialogos/gf13', 7, 'gf1')
						triggerEvent('Set GF Speed', '(So this is the stage fright my parents were talking about..)')
					elseif dialogo > 19 then
						dialogo = 41
						triggerEvent('Play Animation','INTRO2','dad')
						setProperty('camHUD.alpha',0)
										doTweenAlpha('jXXDF', 'cmamoxdxd' , 0, 0.25, 'linear')
										doTweenAlpha('j', '1' , 0, 0.25, 'linear')
										removeLuaSprite('6', false);
										removeLuaSprite('7', false);
										removeLuaSprite('8', false);
										doTweenAlpha('j3f1f31f3', '9' , 0,  0.25, 'linear')
										doTweenAlpha('jfrasasdasdasdgr', 'White4' , 0,  0.25, 'linear')
										doTweenAlpha('jfraadaddzzzsdadsgr', 'tags' , 0,  0.25, 'linear')
						end						
				if dialogo <=19 then
						makeLuaSprite(tostring(imagenzz), 'cutscenes/' .. imagenzz, 0, 0)
						scaleObject(tostring(imagenzz), 0.75, 0.75)
						setObjectCamera(tostring(imagenzz), 'other')
						addLuaSprite(tostring(imagenzz), false)
				
						makeLuaSprite('White4', '', 0, 530)
						luaSpriteMakeGraphic('White4', 3000, 300, '000000')
						addLuaSprite('White4', false)
						setObjectCamera('White4', 'other')
						setProperty('White4.alpha', 0.5)

						makeAnimatedLuaSprite('tags', 'cutscenes/tags',100,500)
						addAnimationByPrefix('tags', 'bf', '1tags bf0000', 24, false)
						addAnimationByPrefix('tags', 'cj', '2tags cj', 24, false)
						addAnimationByPrefix('tags', 'gf', '3tags gf', 24, false)
						addAnimationByPrefix('tags', 'mistery', '4tags mystery', 24, false)
						addAnimationByPrefix('tags', 'ruby', '5tags ruby', 24, false)
						addAnimationByPrefix('tags', 'singer', '6tags singer', 24, false)
						addAnimationByPrefix('tags', 'vade', '7tags vade', 24, false)
						playAnim('tags',personaje,true)
						setObjectCamera('tags', 'other')
						scaleObject('tags', 0.1,0.1)
						addLuaSprite('tags', true)
					end
				end
				end
				
			end			
        end
            end
function onTweenCompleted(tag)
	if tag == 'jXXDF' then
	runTimer('EMPIEZA LA MIERDA1',0.5)
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'EMPIEZA LA MIERDA1' then
		runTimer('EMPIEZA LA MIERDA', 5)
		callMethodFromClass('flixel.FlxG', 'sound.music.stop', {''})
		triggerEvent('Play Animation','intro','dad')
		playSound('dialogos/rubyintro')
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
		imagenzz=6
		triggerEvent('Set GF Speed','...')
        if dialogo == 0 then
			makeLuaSprite(tostring(imagenzz), 'cutscenes/' .. imagenzz, 0, 0)
			scaleObject(tostring(imagenzz), 0.75, 0.75)
			setObjectCamera(tostring(imagenzz), 'other')
			addLuaSprite(tostring(imagenzz), false)

            makeLuaSprite('White4', '', 00, 530)
    luaSpriteMakeGraphic('White4', 3000, 300, '000000')
    addLuaSprite('White4', false)
    setObjectCamera('White4', 'other')
    setProperty('White4.alpha',0.5)


        end
         return Function_Stop

    end
end