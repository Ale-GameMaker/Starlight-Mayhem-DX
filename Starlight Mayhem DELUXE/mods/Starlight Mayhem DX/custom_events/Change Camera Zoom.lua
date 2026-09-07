-- Code by KJP

function onEvent(name,value1,value2)
	if name == 'Change Camera Zoom' then
		setProperty('defaultCamZoom', value1)


		if value1 == '' then
				setProperty('defaultCamZoom', 0.9)
		end
	end
end