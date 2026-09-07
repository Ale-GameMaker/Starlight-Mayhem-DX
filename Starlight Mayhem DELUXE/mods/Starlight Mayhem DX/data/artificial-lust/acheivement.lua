function onEndSong()
    if isStoryMode then
        -- Conquista por terminar a Week
        if achievementExists('beat_week_starlight') and not isAchievementUnlocked('beat_week_starlight') then
            unlockAchievement('beat_week_starlight')
        end

        -- Conquista por Full Combo na Week
        if getProperty('campaignMisses') == 0 then
            if achievementExists('fc_week_starlight') and not isAchievementUnlocked('fc_week_starlight') then
                unlockAchievement('fc_week_starlight')
            end
        end
    end

    return Function_Continue
end