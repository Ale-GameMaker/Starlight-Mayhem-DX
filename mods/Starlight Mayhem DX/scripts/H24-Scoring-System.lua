--THIS SCRIPT WAS MADE BY Gostar64, THE "rateFullPer" CODE IS FROM MEME1079's NPS Script, THE COLORS WERE TAKEN FROM Unholywanderer04's Editable Combo and Ratings Script--
--Why was this somehow so hard and so simple to fix i'm in mental pain and agony--

enabled = true; --enables/disables the script
continueCalculation = false; --continues the calculation if your script is disabled
onlyNewText = false; --Only has the combo, rating, and score texts added in if your script is enabled

--Editable Things Below--

--Main Text Stuff--

font = 'sonic-1-hud-font.ttf' -- H24's font is 'goodbyeDespair.ttf' but 'sonic-1-hud-font.ttf' is pretty cool 
dontChangeScoreFont = false; --disables the font change [default: false]
changeTimeTextFont = true; --set to true to change the time text font
hideOgCombo = false; --hides the original combo stuff

--Score Text Changes--

textStyle = 'Psych' --Psych/OS/Kade/Yoshi-ish (Yoshi)/Gostar64 (Custom)/BSidesRecharted (bsr) (makes it look like each engine's [or my custom] score) [not case sensitive]
MSversion = 'psych' --Psych/Anything else (Anything else makes it grab the ms from OS's playstate) (Psych one is broken, i no longer have time to do things)

Ourple = false; --ourples the score
Kromer = false; --Spamtong

FPSPlusAccuracy = false; -- (for bsr textStyle only) as in it's simple accuracy

--Timers--

timer = 2.05; --default is 2.05 --This is how long it takes to deplete
timeItTakesToSpeedUp = 2; --default is 2 --pretty self explanatory

beatTimer = false -- makes the previous variables count beats
exponential = true --makes it speed up exponentially.
instant = false --makes it end instantly like actual Hotline 024


speedUpMult = 2.25; --default is 2.25 --multiplier of the speed up

--Size--

scoresize = 35; --default is 35 (set to 25 if using goodbyeDespair font) --score text size
size = 35; --default is 35 --size of the special text
dontChangeScoreSize = false; --disables the size change [default: false]

--border settings [border size has to be 0 or higher to change the color]--

borderActive = false; --let's the border change

connectBorderSettings = true; --connects the border settings to all use the same variables (default: true)--
textBorderSize = 2 --border size
textBorderColor = '000000' --border color

--requires connectBorderSettings to be false--
plusTextBorder = 2 --size for the border of the plus score text (default: 2 [-1 does not change it])
plusTextBorderColor = '000000' --color for the border of the plus score text (default: ffffff [black])

rateTextBorder = 2 --size for the border of the rating and combo number text (default: 2 [-1 does not change it])
rateTextBorderColor = '000000' --color for the border of the rating and combo number text (default: ffffff [black])

numberTextBorder = 2 --size for the border of the text with the total score to add (default: 2 [-1 does not change it])
numberTextBorderColor = '000000' --color for the border of the score to add text (default: ffffff [black])

--Animations--

AnimationReal = true; --makes bf do the hey thing when the combo is done (and perfect) (default: true)
playHurtAnim = false; --If you're bad, your animation is the hurt animation (default: false)
animationNames = {'hey', 'hurt', 'sad', 'cheer'} --the names (1 [default: hey] - perfect combo / 2 [default: hurt] - worst combo / 3 [default: sad] - gf crying when the worst combo / 4 [default: cheer] - perfect combo gf cheer)

--Gf's Animations--

enableGfAnimCheer = true; -- Yeah
enableGfAnimSad = true; -- Yeah

--Text Animations--

SystemZoom = true; -- Makes the text from this script zoom (this specifically makes it zoom even if getPropertyFromGroup('ClientPrefs', 'scoreZoom') == false) default = true
deactivateSystemZoom = false; --deactivates it even if the scoreZoom setting is on (default = false)

--Custom Texts--

textSetting = 'base' --base, custom, or both. changes what text to use. both is randomized each note hit
customRateText = {'EPIC!', 'COOL!', 'BAD', 'SHIT'} --Custom Text Here
-- allText = {'SICK!', 'NICE!', 'BAD', 'SHIT', 'EPIC!', 'COOL!', 'BAD', 'SHIT'} --Custom is the last 4
perfects = {'PERFECT!', 'PERFECTO!'} --OS Engine (1 is normal, 2 is custom)
customTextChance = 50; --The chance of the custom text appearing when textSetting is both (it is a percet)

--Glow--

glowActive = false; -- Makes the glow exist (default: false [only downscroll currently, and it looks bad])
baseGlowOpacity = 0.25; -- what it sits at regularly (default: 0.25)
maxGlowOpacity = 0.5; -- The glow's visible opacity (default: 0.5)
blendMode = 'normal' --blend thing (default: normal)

-- Extra (some things that weren't in H024) --

colorsActive = true; --makes the things change colors when you hit notes (direction-based, default: true)
colors_ = {'c24b99', '68fafc', '12fa05', 'f9393f'} --the colors, yes they are customizable, has to be hex tho (left, down, up, right)
--defaultColors_ = {'c24b99', '68fafc', '12fa05', 'f9393f'}

fcColorsActive = true; --makes it change colors depending on your FC status when the combo ends (default: true [requires colorsActive to be true])
fcColors_ = {'68fafc', '48f048', 'fffecb', 'ffffff'} --(pfc/sfc, gfc, fc, sdcb/clear)
--defaultFcColors_ = {'68fafc', '48f048', 'fffecb', 'ffffff'}

changeScoreColor = false; --direction-based (default: false) [automatically activates if using custom score style]
fcScoreColor = false; --fc-based (default: false) [automatically activates if using custom score style]

--Sounds--

playHeySound = false; --self-explainatory (default: false)
heyVolume = 1; --pretty self-explainatory (default: 1)

--Debug--

local quickDebugThing = false; --set this to false if you're not editing

--Global Variables to use if you need (skip these)--
visibleScore = 0; 
recentCombo = 0;
recentMisses = 0;
--skip these--

local coolDudeMult = 1; -- this is here I guess
local NoteHit = false; --just so you know, this is a heavily modified NPS script
local scoreToAdd = 0;
local canDecrease = false;
local daRate = 'SICK!';
local this = 'NICE!';
local sick = 0;
local good = 0;
local bad = 0;
local shit = 0;
local perfect = 0; 
local goFaster = false;
local canPlayAnimation = false;
local dumbdumbAnim = false;
local fcStatus = 1;
local baseRateText = {'SICK!', 'NICE!', 'BAD', 'SHIT'}
local comboRateText = {'COOL!', 'SICK!', 'Nice!', 'Woops...'}
local allMS = 0;
local averageMS = 45;
local Ourpleness_ = "OURPLE"
local ogX = 0.0;
local scoreValue = 350;
local daexpo = 1;
local bruh = 0;
local PlusAccuracy = 0;
local totalNotes = 0;

function onCreate()
    luaDebugMode = quickDebugThing;

    if botPlay == true then
        enabled = false
    end

    --Better Examples--

    if songName == 'Sugarcrush' or songName == 'Majin' or songName == 'EXPURGATED' then
        font = 'goodbyeDespair.ttf'
        scoresize = 25;
        enableGfAnimCheer = false;
        instant = true;
    end

    if songName == 'Golden' then
        font = 'OURPLE.ttf'

        scoresize = 25;

        enableGfAnimCheer = false;
        enableGfAnimSad = false;

        Ourple = true;
        textStyle = 'Psych'

        changeScoreColor = true
        fcScoreColor = true
    end

    if songName == 'Roses' or songName == 'Guns' or songName == 'Pico' then
        font = 'vcr.ttf';
        dontChangeScoreSize = true;
        enableGfAnimCheer = false;
        enableGfAnimSad = false;
    end

    if songName == 'Tutorial' then
        enabled = false;
        continueCalculation = true;
    end

    if songName == 'Supernovae' then
        onlyNewText = true;
    end

    if songName == 'Splitathon' then --just replace/add songs here that you want to not have the score system
        enabled = false;
        textStyle = 'Psych'
    end

    --Add more stuff here--
end

--Don't edit below this unless you know what you're doing--

function onCreatePost()
    makeLuaText('combo score', '', 0, 580, 600)
    makeLuaText('plusScore', '', 0, 550, 525)
    makeLuaText('daRate', '', 0, 520, 550)
    if downscroll and enabled then
        makeLuaText('combo score', scoreToAdd, 0, 580, 600)
        setObjectCamera('combo score', 'hud')
        setTextAlignment('combo score', 'center')
        addLuaText('combo score')

        makeLuaText('plusScore', '+'..scoreValue, 0, 550, 525)
        setObjectCamera('plusScore', 'hud')
        setTextAlignment('plusScore', 'center')
        addLuaText('plusScore')
    
        makeLuaText('daRate', daRate, 0, 520, 550)
        setObjectCamera('daRate', 'hud')
        setTextAlignment('daRate', 'center')
        addLuaText('daRate')
        ogX = 520;
        --[[ setTextFont('combo score', font)
        setTextFont('daRate', font)
        setTextFont('plusScore', font) ]]
    end

    if downscroll and middlescroll and enabled then
        makeLuaText('combo score', scoreToAdd, 0, 580, 200)
        setObjectCamera('combo score', 'hud')
        setTextAlignment('combo score', 'center')
        addLuaText('combo score')

        makeLuaText('plusScore', '+'..scoreValue, 0, 550, 125)
        setObjectCamera('plusScore', 'hud')
        setTextAlignment('plusScore', 'center')
        addLuaText('plusScore')
    
        makeLuaText('daRate', daRate, 0, 520, 150)
        setObjectCamera('daRate', 'hud')
        setTextAlignment('daRate', 'center')
        addLuaText('daRate')

        --[[ setTextFont('combo score', font)
        setTextFont('daRate', font)
        setTextFont('plusScore', font) ]]

        ogX = 520;
    end

    if not downscroll and enabled then
        makeLuaText('combo score', scoreToAdd, 0, 590, 100)
        setObjectCamera('combo score', 'hud')
        setTextAlignment('combo score', 'center')
        addLuaText('combo score')

        makeLuaText('plusScore', '+'..scoreValue, 0, 575, 25)
        setObjectCamera('plusScore', 'hud')
        setTextAlignment('plusScore', 'center')
        addLuaText('plusScore')
    
        makeLuaText('daRate', daRate, 0, 540, 50)
        setObjectCamera('daRate', 'hud')
        setTextAlignment('daRate', 'center')
        addLuaText('daRate')

        --[[ setTextFont('combo score', font)
        setTextFont('daRate', font)
        setTextFont('plusScore', font) ]]

        ogX = 540
    end

    if not downscroll and middlescroll and enabled then
        makeLuaText('combo score', scoreToAdd, 0, 580, 500)
        setObjectCamera('combo score', 'hud')
        setTextAlignment('combo score', 'center')
        addLuaText('combo score')

        makeLuaText('plusScore', '+'..scoreValue, 0, 550, 425)
        setObjectCamera('plusScore', 'hud')
        setTextAlignment('plusScore', 'center')
        addLuaText('plusScore')
    
        makeLuaText('daRate', daRate, 0, 520, 450)
        setObjectCamera('daRate', 'hud')
        setTextAlignment('daRate', 'center')
        addLuaText('daRate')

        --[[ setTextFont('combo score', font)
        setTextFont('daRate', font)
        setTextFont('plusScore', font) ]]
        ogX = 520;
    end

    
    if borderActive then
        if not connectBorderSettings then
            if plusTextBorder >= 0 then
                if plusTextBorderColor ~= '' or plusTextBorderColor ~= nil then
                    setTextBorder('plusScore', plusTextBorder, plusTextBorderColor)
                else
                    setTextBorder('plusScore', plusTextBorder, '000000')
                end
            end

            if rateTextBorder >= 0 then
                if rateTextBorderColor ~= '' or rateTextBorderColor ~= nil then
                    setTextBorder('daRate', rateTextBorder, rateTextBorderColor)
                else
                    setTextBorder('daRate', rateTextBorder, '000000')
                end
            end

            if numberTextBorder >= 0 then
                if numberTextBorderColor ~= '' or numberTextBorderColor ~= nil then
                    setTextBorder('combo score', numberTextBorder, numberTextBorderColor)
                else
                    setTextBorder('combo score', numberTextBorder, '000000')
                end
            end
        else
            if textBorderSize >= 0 then
                if textBorderColor ~= '' or textBorderColor ~= nil then
                    setTextBorder('daRate', textBorderSize, textBorderColor)
                    setTextBorder('plusScore', textBorderSize, textBorderColor)
                    setTextBorder('combo score', textBorderSize, textBorderColor)
                else
                    setTextBorder('daRate', textBorderSize, '000000')
                    setTextBorder('plusScore', textBorderSize, '000000')
                    setTextBorder('combo score', textBorderSize, '000000')
                end
            end
        end
    end

    
    setProperty('combo score.alpha', 0)
    setProperty('plusScore.alpha', 0)
    setProperty('daRate.alpha', 0)
    setProperty('glower.alpha', 0)
    setTextAlignment('daRate', 'center')

    if hideOgCombo then
        addHaxeLibrary('PlayState', 'states')
        runHaxeCode([[comboGroup.visible = false;]])
    end
end

function onUpdate(elapsed)
    if changeTimeTextFont == true and enabled and not onlyNewText then --yeah, I check directly on custom variables
        setTextFont('timeTxt', font)
    end

    if not instant then
        visibleScore = lerp(visibleScore, score - scoreToAdd, .2/(framerate / 60)); --smoothing real
    else
        visibleScore = lerp(visibleScore, score - scoreToAdd, .1/(framerate / 60)); --smoothing realer
    end

    local rateFullPer = round(getProperty('ratingPercent') * 100, 2)

    if BeforeScore == nil or BeforeScore == '' then
        local BeforeScore = 'SCORE: '..score..' | MISSES: '..misses..' | RATING: '..ratingName
    end

    if FinalScore == nil or FinalScore == '' then
        local FinalScore = 'SCORE: '..visibleScore..' | MISSES: '..misses..' | RATING: '..ratingName..' ('..rateFullPer..'%) - '..ratingFC
    end

    local combo = getProperty('combo')

    local strumTime = getPropertyFromGroup('notes', id, 'strumTime')
    if formatVersion(version) >= formatVersion('0.7.0') then
        local rOffset = tonumber(getPropertyFromClass('backend.ClientPrefs', 'data.ratingOffset'))
        local songPos = tonumber(getPropertyFromClass('backend.Conductor', 'songPosition'))
    elseif formatVersion(version) < formatVersion('0.7.0') then
        local rOffset = tonumber(getPropertyFromClass('ClientPrefs', 'ratingOffset'))
        local songPos = tonumber(getPropertyFromClass('Conductor', 'songPosition'))
    else
        local rOffset = tonumber(getPropertyFromClass('ClientPrefs', 'ratingOffset'))
        local songPos = tonumber(getPropertyFromClass('Conductor', 'songPosition'))
    end

    if string.lower(textStyle) == 'psych' then
        BeforeScore = 'Score: '..score..' | Misses: '..misses..' | Rating: '..ratingName
        FinalScore = 'Score: '..round(visibleScore, 0)..' | Misses: '..misses..' | Rating: '..ratingName..' ('..rateFullPer..'%) - '..ratingFC
        if Ourple then
            BeforeScore = 'HOW OURPLE YOU ARE: '..score..' | MISSES: '..misses..' | RATING: '..ratingName
            FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | MISSES: '..misses..' | RATING: '..ratingName..' ('..rateFullPer..'%) - '..ratingFC
        elseif Kromer then
            BeforeScore = 'KROMER: '..score..' | [Combo Breaks]: '..misses..' | Rating: '..ratingName
            FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' | Rating: ['..ratingName..'] - '..rateFullPer..'%  ['..ratingFC..']'
        end
    elseif string.lower(textStyle) == 'yoshi' or string.lower(textStyle) == 'yoshi-ish' then
        --allMS = strumTime - songPos + rOffset;
        BeforeScore = 'Score: '..score..' | Combo Breaks: '..misses..' | Accuracy: ? | Average: ? '
        if Ourple then
            BeforeScore = 'HOW OURPLE YOU ARE: '..score..' | COMBO BREAKS: '..misses..' | ACCURACY: ? | AVERAGE: ? '
        elseif Kromer then
            BeforeScore = 'KROMER: '..score..' | [Combo Breaks]: '..misses..' | [Accuracy]: ? | AVERAGE: ? '
        end
        if MSversion == 'Psych' then
            FinalScore = 'Score: '..round(visibleScore, 0)..' | Combo Breaks: '..misses..' | Accuracy: '..rateFullPer..'% ('..ratingName..') | ['..ratingFC..'] Average: ? '
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | COMBO BREAKS: '..misses..' | Accuracy: '..rateFullPer..'% ('..ratingName..') | ['..ratingFC..'] AVERAGE: ? '
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' | [Accuracy]: '..rateFullPer..'% ['..ratingName..'] | '..ratingFC..' | AVERAGE: ? '
            end
        else
            --[[ FinalScore = 'Score: '..round(visibleScore, 0)..' | Combo Breaks: '..misses..' |  Accuracy: '..rateFullPer..'% ('..ratingName..') | ['..ratingFC..'] | Average: '..round(getProperty('averageMs'), 0)..'ms'
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | COMBO BREAKS: '..misses..' |  Accuracy: '..rateFullPer..'% ('..ratingName..') | ['..ratingFC..'] | AVERAGE: '..round(getProperty('averageMs'), 0)..'ms'
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' | [Accuracy]: '..rateFullPer..'% ['..ratingName..'] | '..ratingFC..' | AVERAGE: '..round(getProperty('averageMs'), 0)..'ms'
            end ]]
            FinalScore = 'Score: '..round(visibleScore, 0)..' | Combo Breaks: '..misses..' | Accuracy: '..rateFullPer..'% ('..ratingName..') | ['..ratingFC..'] Average: ? '
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | COMBO BREAKS: '..misses..' | Accuracy: '..rateFullPer..'% ('..ratingName..') | ['..ratingFC..'] AVERAGE: ? '
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' | [Accuracy]: '..rateFullPer..'% ['..ratingName..'] | '..ratingFC..' | AVERAGE: ? '
            end
        end
    elseif string.lower(textStyle) == 'os' then
        --allMS = strumTime - songPos + rOffset;
        BeforeScore = 'Score: '..score..' | Combo Breaks: '..misses..' | Average: ? | Accuracy: ?'
        if Ourple then
            BeforeScore = 'HOW OURPLE YOU ARE: '..score..' | COMBO BREAKS: '..misses..' | AVERAGE: ? | ACCURACY: ?'
        elseif Kromer then
            BeforeScore = 'KROMER: '..score..' | [Combo Breaks]: '..misses..' | [Average]: ? | ACCURACY: ?'
        end
        if MSversion == 'Psych' then
            FinalScore = 'Score: '..round(visibleScore, 0)..' | Combo Breaks: '..misses..' | Average: ? | Accuracy: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | COMBO BREAKS: '..misses..' | AVERAGE: ? | ACCURACY: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' | [Average]: ? | ACCURACY: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            end
        else
            --[[ FinalScore = 'Score: '..round(visibleScore, 0)..' | Combo Breaks: '..misses..' | Average: '..round(getProperty('averageMs'), 0)..'ms | Accuracy: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | COMBO BREAKS: '..misses..' | AVERAGE: '..round(getProperty('averageMs'), 0)..'ms | ACCURACY: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' | [Average]: '..round(getProperty('averageMs'), 0)..'ms | ACCURACY: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            end ]]
            FinalScore = 'Score: '..round(visibleScore, 0)..' | Combo Breaks: '..misses..' | Average: ? | Accuracy: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | COMBO BREAKS: '..misses..' | AVERAGE: ? | ACCURACY: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' | [Average]: ? | ACCURACY: '..rateFullPer..'% | '..ratingName..' ['..ratingFC..']'
            end
        end 
    elseif string.lower(textStyle) == 'kade' then
        BeforeScore = 'Score:0 | Combo Breaks:0 | Accuracy:0% | N/A'
        FinalScore = 'Score:'..round(visibleScore, 0)..' | Combo Breaks:'..misses..' | Accuracy:'..rateFullPer..'% | ('..ratingName..') '..ratingFC
        if Ourple then
            BeforeScore = 'OURPLENESS:0 | COMBO BREAKS:0 | ACCURACY:0% | N/A'
            FinalScore = 'OURPLENESS:'..round(visibleScore, 0)..' | COMBO BREAKS:'..misses..' | ACCURACY:'..rateFullPer..'% | ('..ratingName..') '..ratingFC
        elseif Kromer then
            BeforeScore = '[Kromer]:0 | [Misses]:0 | ACCURACY:0% | [[Hyperlink Blocked]]'
            FinalScore = '[Kromer]:'..round(visibleScore, 0)..' | [Misses]:'..misses..' | ACCURACY:'..rateFullPer..'% | ('..ratingName..') '..ratingFC
        end
    elseif string.lower(textStyle) == 'custom' or string.lower(textStyle) == 'gostar64' then
        BeforeScore = 'Score: '..score..' | Misses: '..misses..' | Rating: ? | Accuracy: ? | Combo: real'
        if Ourple then
            BeforeScore = 'HOW OURPLE YOU ARE: '..score..' | MISSES: '..misses..' | RATING: ? | ACCURACY: ? | COMBO: real'
        elseif Kromer then
            BeforeScore = 'KROMER: '..score..' | [[Fudge] Ups]: '..misses..' | [Rating]: [[Hyperlink Blocked]] | ACCURACY: [[Hyperlink Blocked]] | [Combo]: fake'
        end
        if ratingFC ~= 'Clear' then
            if scoreToAdd > 0 then 
                FinalScore = 'Score: '..round(visibleScore, 0)..' ('..scoreToAdd..') | Misses: '..misses..' | Rating: '..ratingName..' | Accuracy: '..rateFullPer..'% | Combo: '..combo..' ('..ratingFC..')'
            else
                FinalScore = 'Score: '..round(visibleScore, 0)..' | Misses: '..misses..' | Rating: '..ratingName..' | Accuracy: '..rateFullPer..'% | Combo: '..combo..' ('..ratingFC..')'
            end
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' ('..Ourpleness_..') | MISSES: '..misses..' | RATING: '..ratingName..' | ACCURACY: '..rateFullPer..'% | COMBO: '..combo..' ('..ratingFC..')'
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [[Fudge] Ups]: '..misses..' | [Rating]: '..ratingName..' | ACCURACY: ['..rateFullPer..']% | [Combo]: '..combo..' ['..ratingFC..']'
            end
        else
            if scoreToAdd > 0 then 
                FinalScore = 'Score: '..round(visibleScore, 0)..' ('..scoreToAdd..') | Misses: '..misses..' | Rating: '..ratingName..' | Accuracy: '..rateFullPer..'% | Combo: '..combo
            else
                FinalScore = 'Score: '..round(visibleScore, 0)..' | Misses: '..misses..' | Rating: '..ratingName..' | Accuracy: '..rateFullPer..'% | Combo: '..combo
            end
            if Ourple then
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' ('..Ourpleness_..') | MISSES: '..misses..' | RATING: '..ratingName..' | ACCURACY: '..rateFullPer..'% | COMBO: '..combo
            elseif Kromer then
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [[Fudge] Ups]: '..misses..' | [Rating]: '..ratingName..' | ACCURACY: ['..rateFullPer..']% | [Combo]: '..combo
            end
        end
    elseif string.lower(textStyle) == 'bsidesrecharted' or string.lower(textStyle) == 'bsr' then
        if getProperty('songHits') > 0 then
            PlusAccuracy = round((getProperty('songHits')/totalNotes)*100, 2)
        else
            PlusAccuracy = 0;
        end
        bruh = round(lerp(bruh, rateFullPer, 0.25), 2)
        if bruh >= 99.99 then
			bruh = 100
		elseif bruh < 99.99 then
			bruh = round(lerp(bruh, rateFullPer, 0.25), 2)
        elseif round(PlusAccuracy, 0) == 100 then
			PlusAccuracy = 100
		end
        if not FPSPlusAccuracy then
            BeforeScore = 'Score: '..score..' | Misses: '..misses..' | Accuracy: '..bruh..'%'
            FinalScore = 'Score: '..round(visibleScore, 0)..' | Misses: '..misses..' ['..ratingFC..'] | Accuracy: '..bruh..'% ['..ratingName..']'
        else
            BeforeScore = 'Score: '..score..' | Misses: '..misses..' | Accuracy: '..PlusAccuracy..'%'
            FinalScore = 'Score: '..round(visibleScore, 0)..' | Misses: '..misses..' ['..ratingFC..'] | Accuracy: '..PlusAccuracy..'% ['..ratingName..']'
        end
        if Ourple then
            if not FPSPlusAccuracy then
                BeforeScore = 'HOW OURPLE YOU ARE: '..score..' | MISSES: '..misses..' | ACCURACY: '..bruh..'%'
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | MISSES: '..misses..' ['..ratingFC..'] | ACCURACY: '..bruh..'% ['..ratingName..']'
            else
                BeforeScore = 'HOW OURPLE YOU ARE: '..score..' | MISSES: '..misses..' | ACCURACY: '..PlusAccuracy..'%'
                FinalScore = 'HOW OURPLE YOU ARE: '..round(visibleScore, 0)..' | MISSES: '..misses..' ['..ratingFC..'] | ACCURACY: '..PlusAccuracy..'% ['..ratingName..']'
            end
        elseif Kromer then
            if not FPSPlusAccuracy then
                BeforeScore = 'KROMER: '..score..' | [Combo Breaks]: '..misses..' | ACCURACY: '..bruh..'%'
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' ['..ratingFC..'] | ACCURACY: '..bruh..'% ['..ratingName..']'
            else
                BeforeScore = 'KROMER: '..score..' | [Combo Breaks]: '..misses..' | ACCURACY: '..PlusAccuracy..'%'
                FinalScore = 'KROMER: '..round(visibleScore, 0)..' | [Combo Breaks]: '..misses..' ['..ratingFC..'] | ACCURACY: '..PlusAccuracy..'% ['..ratingName..']'
            end
        end
    else
        BeforeScore = 'Score: '..score..' | Misses: '..misses..' | Rating: '..ratingName
        FinalScore = 'Score: '..round(visibleScore, 0)..' | Misses: '..misses..' | Rating: '..ratingName..' ('..rateFullPer..'%) - '..ratingFC
    end

    

    
    if getProperty('ratingFC') == 'SFC' --[[ or getProperty('ratingFC') == 'PFC' ]]  then
        fcStatus = 1
        if Ourpleness_ ~= "WAY PAST OURPLE" or Ourpleness_ ~= 'AND WHY HE OURPLE? XD' then
            Ourpleness_ = 'OURPLE'
        end
    elseif getProperty('ratingFC') == 'GFC' then
        fcStatus = 2
    elseif getProperty('ratingFC') == 'FC' then
        fcStatus = 3
    else
        fcStatus = 4
    end

    if fcStatus ~= 1 then
        if visibleScore < 25000 then
            Ourpleness_ = "PRANGE"
        elseif visibleScore >= 25000 and visibleScore < 35000 then
            Ourpleness_ = "SOMEWHAT"
        elseif visibleScore >= 35000 and visibleScore < 50000 then
            Ourpleness_ = "KINDA"
        elseif visibleScore >= 50000 and visibleScore < 100000 then
            Ourpleness_ = "VERY"
        elseif visibleScore >= 100000 and visibleScore < 150000 then
            Ourpleness_ = "OURPLE"
        end
    end

    if visibleScore >= 150000 then
        Ourpleness_ = "WAY PAST OURPLE"
    elseif visibleScore >= 325000 then
        Ourpleness_ = 'AND WHY HE OURPLE? XD'
    end


    if ratingName == '?' and enabled then
        setTextString('scoreTxt', BeforeScore)
    elseif ratingName ~= '?' and enabled or ratingName ~= '?' and not enabled and continueCalculation then
        setTextString('scoreTxt', FinalScore)  
    elseif enabled == false and not continueCalculation or enabled and onlyNewText then
        setTextString('scoreTxt', getTextString('scoreTxt'))
    else --failsafe
        setTextString('scoreTxt', getTextString('scoreTxt'))
    end

    if enabled == true and not onlyNewText then
        if not dontChangeScoreSize then
            setTextSize('scoreTxt', scoresize)
        end
        if not dontChangeScoreFont then
            setTextFont('scoreTxt', font)
        end
    end
    
    

    if scoreToAdd <= 0 and canDecrease and canPlayAnimation and AnimationReal and enabled then
        if canPlayAnimation and not dumbdumbAnim then
            triggerEvent('Play Animation', animationNames[1], 'BF')

            if enableGfAnimCheer then
                triggerEvent('Play Animation', animationNames[4], 'GF')
            end

            if playHeySound == true then
                playSound('Hey', heyVolume)
            end
        elseif canPlayAnimation and dumbdumbAnim then
            if playHurtAnim then
                triggerEvent('Play Animation', animationNames[2], 'BF')
            end

            if enableGfAnimSad then
                triggerEvent('Play Animation', animationNames[3], 'GF')
            end
        end
    end

    if scoreToAdd <= 0 and canDecrease then
        scoreToAdd = 0
        canPlayAnimation = false;
        dumbdumbAnim = false;
        runTimer('scoreDoesGone', 1)
        doTweenAlpha('flash', 'combo score', 0.1, 0.2, 'linear')
        canDecrease = false;
        if exponential then
            daexpo = 1;
        end
        recentCombo = 0;
        --setProperty('comboCool.alpha', 0)
        setProperty('plusScore.alpha', 0)

        setTextString('daRate', this)
        screenCenter('daRate', 'x')
        if fcColorsActive then
            setProperty('daRate.color', getColorFromHex(fcColors_[fcStatus]))
            if textStyle == 'Custom' or textStyle == 'Gostar64' or fcScoreColor then
                setProperty('scoreTxt.color', getColorFromHex(fcColors_[fcStatus]))
                doTweenColor('scoreTxtColorer', 'scoreTxt', 'FFFFFF', 1, 'linear')
            end
        end
        setProperty('daRate.scale.x', 1.075)
	    setProperty('daRate.scale.y', 1.075)
        doTweenX('ratingX', 'daRate.scale', 1, 0.2, 'linear')
	    doTweenY('ratingY', 'daRate.scale', 1, 0.2, 'linear')
        doTweenAlpha('rateLeave', 'daRate', 0, 1, 'linear')
        --doTweenAlpha('glowShrink', 'glower', baseGlowOpacity, 0.2, 'linear')
        

        recentMisses = 0;

        goFaster = false;
    end

    if recentMisses == 0 then
            --this = 'COOL!';
        this = comboRateText[1];
        canPlayAnimation = true;
        dumbdumbAnim = false;
    elseif recentMisses >= 1 and recentMisses <= 5 then
            --this = 'SICK!';
        this = comboRateText[2];
        canPlayAnimation = false;
        dumbdumbAnim = false;
    elseif recentMisses >= 6 and recentMisses <= 10 then
            --this = 'Nice!';
        this = comboRateText[3];
        canPlayAnimation = false;
        dumbdumbAnim = false;
    else
        --this = 'Woops...';   
        this = comboRateText[4];
        canPlayAnimation = true;
        dumbdumbAnim = true;
    end

    if recentCombo == 69 then
        daRate = 'NICE!';
    end
    
    if canDecrease == true then
        if not instant then
            scoreToAdd = round(scoreToAdd - 111, 0);
            if goFaster == true then
                scoreToAdd = round(scoreToAdd - 111 * speedUpMult + elapsed/100, 0);
            end
            if goFaster and exponential then
                daexpo = daexpo + 0.1;
                scoreToAdd = round(scoreToAdd - 111 * speedUpMult^daexpo, 0);
            end
        elseif instant then
            scoreToAdd = 0 
        else --if this somehow happens, idk something bad something or other i'm tired
            scoreToAdd = round(scoreToAdd - 111, 0);
        end
    end

    
end

function onUpdatePost(elapsed)
    setTextString('combo score', scoreToAdd)
    --setTextString('comboCool', 'x'..recentCombo)
    screenCenter('combo score', 'x')
    screenCenter('daRate', 'x')
    screenCenter('plusScore', 'x')
    if scoreToAdd > 0 then
        setProperty('combo score.alpha', 1)
        --setProperty('comboCool.alpha', 1)
        setProperty('plusScore.alpha', 1)
        setProperty('daRate.alpha', 1)
        setProperty('glower.alpha', baseGlowOpacity)

        setTextString('daRate', daRate..' x'..recentCombo)
        if scoreValue >= 0 then
            setTextString('plusScore', '+'..scoreValue)
        else 
            setTextString('plusScore', scoreValue)
        end
        --setProperty('daRate.x', ogX)
    end

    setTextSize('combo score', size)
    --setTextSize('comboCool', size)
    setTextSize('daRate', size)
    setTextSize('plusScore', size/2)
    setTextFont('combo score', font)
    --setTextFont('comboCool', font)
    setTextFont('daRate', font)
    setTextFont('plusScore', font)
end

function round(num, dp) -- i stole this
    local mult = 10^(dp or 0);
    return math.floor(num * mult + 0.5)/mult;
end

function lerp(a, b, t)
	return a + (b - a) * t
end

function formatVersion(ver) --Thanks DragShot & TaeYai for fix this
    local buffer = {};
    for str in string.gmatch(ver, "([^%.]+)") do
        if (str:len() == 1) then
            table.insert(buffer, '00');
        elseif (str:len() == 2) then
            table.insert(buffer, '0');
        end
        table.insert(buffer, str);
    end
    return tonumber(table.concat(buffer));
end
    
function goodNoteHit(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        local rating = getPropertyFromGroup("notes", id, "rating")
        recentCombo = recentCombo + 1
        customChance = getRandomBool(customTextChance)

        averageMS = allMS/getProperty('songHits'); --breh
        totalNotes = totalNotes + 1;

        if scoreZoom and not deactivateSystemZoom or SystemZoom then
            setProperty('daRate.scale.x', 1.075)
	        setProperty('daRate.scale.y', 1.075)
            setProperty('combo score.scale.x', 1.075)
	        setProperty('combo score.scale.y', 1.075)
            setProperty('plusScore.scale.x', 1.075)
            setProperty('plusScore.scale.y', 1.075)
            --[[ setProperty('glower.scale.x', 1.575)
            setProperty('glower.scale.y', 1.575)
            setProperty('glower.alpha', maxGlowOpacity) ]]
	        doTweenX('ratingX', 'daRate.scale', 1, 0.2, 'linear')
	        doTweenY('ratingY', 'daRate.scale', 1, 0.2, 'linear')
            doTweenX('+X', 'plusScore.scale', 1, 0.2, 'linear')
	        doTweenY('+Y', 'plusScore.scale', 1, 0.2, 'linear')
            doTweenX('AddScoreX', 'combo score.scale', 1, 0.2, 'linear')
	        doTweenY('AddScoreY', 'combo score.scale', 1, 0.2, 'linear')
        end

        if colorsActive == true then
            setProperty('daRate.color', getColorFromHex(colors_[direction+1]))
            setProperty('combo score.color', getColorFromHex(colors_[direction+1]))
            setProperty('plusScore.color', getColorFromHex(colors_[direction+1]))

            doTweenColor('ratingColor', 'daRate', 'FFFFFF', 0.2, 'linear')
            doTweenColor('addScoreColor', 'combo score', 'FFFFFF', 0.2, 'linear')
            doTweenColor('plusScoreColor', 'plusScore', 'FFFFFF', 0.2, 'linear')

            if textStyle == 'Custom' or textStyle == 'Gostar64' or changeScoreColor then
                setProperty('scoreTxt.color', getColorFromHex(colors_[direction+1]))
                doTweenColor('scoreTxtColorer', 'scoreTxt', 'FFFFFF', 0.2, 'linear')
            end
        end
        if rating == 'sick' then --sick < getPropertyFromClass('states.PlayState', 'ratingsData[0].hits')
            scoreValue = 350
            scoreToAdd = scoreToAdd + 350
            sick = sick + 1
            coolDudeMult = coolDudeMult + 0.01
            if averageMS > 45 then
                averageMS = 45
            end
            if string.lower(textSetting) == 'base' then
                daRate = baseRateText[1]
            elseif string.lower(textSetting) == 'custom' then
                daRate = customRateText[1]
            elseif string.lower(textSetting) == 'both' then
                if not customChance then
                    daRate = baseRateText[1]
                end
    
                if customChance then
                    daRate = customRateText[1]
                end
            else
                daRate = baseRateText[1]
            end
        elseif rating == 'good' then --good < getPropertyFromClass('states.PlayState', 'ratingsData[1].hits')
            scoreValue = 200
            scoreToAdd = scoreToAdd + 200
            good = good + 1
            coolDudeMult = coolDudeMult + 0.005
            if averageMS > 90 then
                averageMS = 90
            end
            if string.lower(textSetting) == 'base' then
                daRate = baseRateText[2]
            elseif string.lower(textSetting) == 'custom' then
                daRate = customRateText[2]
            elseif string.lower(textSetting) == 'both' then
                if not customChance then
                    daRate = baseRateText[2]
                end
    
                if customChance then
                    daRate = customRateText[2]
                end
            else
                daRate = baseRateText[2]
            end
        elseif rating == 'bad' then --bad < getPropertyFromClass('states.PlayState', 'ratingsData[2].hits')
            scoreValue = 100
            scoreToAdd = scoreToAdd + 100
            bad = bad + 1
            coolDudeMult = coolDudeMult + 0.0025
            if averageMS > 135 then
                averageMS = 135
            end
            if string.lower(textSetting) == 'base' then
                daRate = baseRateText[3]
            elseif string.lower(textSetting) == 'custom' then
                daRate = customRateText[3]
            elseif string.lower(textSetting) == 'both' then
                if not customChance then
                    daRate = baseRateText[3]
                end
    
                if customChance then
                    daRate = customRateText[3]
                end
            else
                daRate = baseRateText[3]
            end
        elseif rating == 'shit' then --shit < getPropertyFromClass('states.PlayState', 'ratingsData[3].hits')
            scoreValue = 50
            scoreToAdd = scoreToAdd + 50
            shit = shit + 1
            coolDudeMult = coolDudeMult + 0
            if averageMS > 145 then
                averageMS = 145
            end
            if string.lower(textSetting) == 'base' then
                daRate = baseRateText[4]
            elseif string.lower(textSetting) == 'custom' then
                daRate = customRateText[4]
            elseif string.lower(textSetting) == 'both' then
                if not customChance then
                    daRate = baseRateText[4]
                end
    
                if customChance then
                    daRate = customRateText[4]
                end
            else
                daRate = baseRateText[4]
            end
        elseif rating == 'perfect' then
            scoreValue = 500
            scoreToAdd = scoreToAdd + 500;
            perfect = perfect + 1;
            coolDudeMult = coolDudeMult + 0.02
            if averageMS > 45 then
                averageMS = 45
            end
            if string.lower(textSetting) == 'base' then
                daRate = perfects[1]
            elseif string.lower(textSetting) == 'custom' then
                daRate = perfects[2]
            elseif string.lower(textSetting) == 'both' then
                if not customChance then
                    daRate = perfects[1]
                end
    
                if customChance then
                    daRate = perfects[2]
                end
            else
                daRate = perfects[1]
            end
        end
    elseif isSustainNote and FPSPlusAccuracy then
        PlusAccuracy = PlusAccuracy + 0.01
    end
    cancelTimer('scoreLeave')
    canDecrease = false;
    if not beatTimer then
        runTimer('scoreLeave', timer)
    elseif beatTimer then
        runTimer('scoreLeave', (crochet*timer)/1000)
    else
        runTimer('scoreLeave', timer)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'scoreLeave' then
        if not beatTimer then
            runTimer('goFasterDude', timeItTakesToSpeedUp)
        elseif beatTimer then
            runTimer('goFasterDude', (crochet*timeItTakesToSpeedUp)/1000)
        else
            runTimer('goFasterDude', timeItTakesToSpeedUp)
        end
        canDecrease = true;
    end

    if tag == 'goFasterDude' then
        goFaster = true;
    end
    
    if tag == 'scoreDoesGone' then
        cancelTween('flash')
        cancelTween('flash2')
        setProperty('combo score.alpha', 0)
        setProperty('daRate.color', getColorFromHex('FFFFFF'))
    end
end

function onTweenCompleted(tag)
    if tag == 'flash' then
        doTweenAlpha('flash2', 'combo score', 0.1, 1, 'linear')
    elseif tag == 'flash2' then
        doTweenAlpha('flash', 'combo score', 0.1, 0.2, 'linear')
    end

    if tag == 'glowShrink' then
        doTweenAlpha('glowLeave', 'glower', 0, 1, 'elasticInOut')
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if not isSustainNote then
        recentMisses = recentMisses + 1
        totalNotes = totalNotes + 1;
        daRate = 'MISS'
        scoreValue = -10
        if scoreToAdd >= 10 and recentCombo <= 0 then
            scoreToAdd = scoreToAdd - 10;
        elseif recentCombo > 0 then
            scoreToAdd = scoreToAdd - 10;
        end
    elseif isSustainNote then
        recentMisses = recentMisses + 1
        --totalNotes = totalNotes + 1;
        daRate = 'MISS'
        scoreValue = -5
        if scoreToAdd >= 5 and recentCombo <= 0 then
            scoreToAdd = scoreToAdd - 5;
        elseif recentCombo > 0 then
            scoreToAdd = scoreToAdd - 5;
        end
    end
end