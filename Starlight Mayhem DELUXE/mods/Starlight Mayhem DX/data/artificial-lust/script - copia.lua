local allowCountdown = false
local allowEnd = false
function onEndSong()
	if not allowEnd and isStoryMode then
		startVideo('final_cutscene');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end