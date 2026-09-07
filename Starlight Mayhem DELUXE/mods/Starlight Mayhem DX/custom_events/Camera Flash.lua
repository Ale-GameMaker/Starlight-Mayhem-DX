function onEvent(name,value1,value2)
	if name == 'Camera Flash' then
		makeLuaSprite('flash', '', 0, 0);
		makeGraphic('flash',1280,720,'ffffff')
		setLuaSpriteScrollFactor('flash',0,0)
		setObjectOrder('flash',99999);
		setProperty('flash.scale.x',2)
		setProperty('flash.scale.y',2)
		setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,value1,'linear')
		addLuaSprite('flash', true);



		if value1 == '' then
			makeLuaSprite('flash', '', 0, 0);
			makeGraphic('flash',1280,720,'ffffff')
			setLuaSpriteScrollFactor('flash',0,0)
			setObjectOrder('flash',99999);
			setProperty('flash.scale.x',2)
			setProperty('flash.scale.y',2)
			setProperty('flash.alpha',0)
			setProperty('flash.alpha',1)
			doTweenAlpha('flTw','flash',0,1,'linear')
			addLuaSprite('flash', true);
		end
	end
end