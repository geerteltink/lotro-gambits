-- Turbine.Gameplay.SkillList
-- GetCount() - gets the count
-- GetItem(i) - gets the ith item
-- event: SkillAdded(object, args) - args.Index (index), args.Skill (skill object)
-- event: SkillRemoved(object, args) - args.Index (index), args.Skill (skill object)
-- Turbine.Gameplay.SkillInfo
-- GetName() - gets the name
-- GetDescription() - gets part of the tooltip
-- GetType() - one of Turbine.Gameplay.SkilType (Normal, Mount, Gambit)
-- GetIconImageID() - presumably the image ID of the skill
-- Turbine.Gameplay.SkillList.GetItem(x) returns a
-- Turbine.Gameplay.ActiveSkill(GetTrainedSkills)
-- Turbine.Gameplay.Gambit(GetTrainedGambits)
-- Turbine.Gameplay.Skill(GetUntrainedSkills and GetUntrainedGambits).
-- Oddly enough GetUntrainedGambits returns a Turbine.Gameplay.Skill instead of a Turbine.Gameplay.Gambit.
-- Turbine.Gameplay.LocalPlayer:GetInstance():GetTrainedSkills()
-- Turbine.Gameplay.LocalPlayer:GetInstance():GetUntrainedSkills()
-- Turbine.Gameplay.LocalPlayer:GetInstance():GetClassAttributes():GetTrainedGambits()
-- Turbine.Gameplay.LocalPlayer:GetInstance():GetClassAttributes():GetUntrainedGambits()
-- return a Turbine.Gameplay.SkillList object. (The last two only work for Wardens, of course.)
-- Turbine imports..
import "Turbine";
import "Turbine.Gameplay";
import "Turbine.UI";
import "Turbine.UI.Lotro";

-- LUA extensions
import "XtreamWayz.Gambits.Class";

-- Local imports
import "XtreamWayz.Gambits.GeneralFunctions";
import "XtreamWayz.Gambits.Settings";
import "XtreamWayz.Gambits.Core";
import "XtreamWayz.Gambits.GambitLayout";
import "XtreamWayz.Gambits.GambitData";
import "XtreamWayz.Gambits.GambitWindow";
import "XtreamWayz.Gambits.GambitList";
import "XtreamWayz.Gambits.GambitItem";
import "XtreamWayz.Gambits.GambitBuilder";

-- Load message
Debug("Loading plugin " .. plugin:GetName() .. "...");

-- Load the plugin settings
Settings.Load();

-- Settings.GetAllSkills();

ActiveGambits = {};
GambitWindows = {};
HeightLeft = nil;
HeightRight = nil;
CurrentStance = nil;
CurrentTraitLine = nil;

LocalPlayer = Turbine.Gameplay.LocalPlayer.GetInstance();
EffectList = LocalPlayer:GetEffects();

Core.Start();

function Destroy()
    if GambitWindows ~= nil then
        -- Destroy windows
        for i = 1, #GambitWindows do
            GambitWindows[i]:Destroy();
        end
    end
end

function ConstructWindows()
    -- Reset
    ActiveGambits = nil;
    GambitWindows = nil;
    HeightLeft = nil;
    HeightRight = nil;

    -- Get all gambits
    ActiveGambits = {};
    local skills = LocalPlayer:GetClassAttributes():GetTrainedGambits();
    local skillCount = skills:GetCount();
    for i = 1, skillCount, 1 do
        local skill = Turbine.Gameplay.Skill.GetSkillInfo(skills:GetItem(i));
        ActiveGambits[skill:GetIconImageID()] = skill:GetName();
    end

    -- Create gambit windows
    GambitWindows = {};
    HeightLeft = Settings.Window.Offset.Bottom;
    HeightRight = Settings.Window.Offset.Bottom;

    -- Construct each gambit window
    for i = 1, #GambitLayout do
        if (GambitLayout[i].Enabled) then
            local window = GambitWindow(GambitLayout[i]);
            if window.Placement == "left" then
                HeightLeft = HeightLeft + window:GetHeight();
                table.insert(GambitWindows, window);
            elseif window.Placement == "right" then
                HeightRight = HeightRight + window:GetHeight();
                table.insert(GambitWindows, window);
            else
                -- Destroy window
                window = nil;
            end

        end
    end
end

-- Position gambit windows
function PositionWindows()
    local screenHeight = Turbine.UI.Display.GetHeight();

    for i = 1, #GambitWindows do
        if GambitWindows[i].Placement == "left" then
            GambitWindows[i]:SetTop(screenHeight - HeightLeft);
            HeightLeft = HeightLeft - GambitWindows[i]:GetHeight();
        elseif GambitWindows[i].Placement == "right" then
            GambitWindows[i]:SetTop(screenHeight - HeightRight);
            HeightRight = HeightRight - GambitWindows[i]:GetHeight();
        end
    end
end

function DetectStance()
    local stance = LocalPlayer:GetClassAttributes():GetStance();
    local newStance = nil;

    if stance == 0 then
        newStance = "None";
    elseif stance == 1 then
        newStance = "None";
    elseif stance == 2 then
        newStance = "In the Fray";
    elseif stance == 3 then
        newStance = "Assailment";
    end

    if newStance ~= CurrentStance then
        CurrentStance = newStance;
        Debug("Warden stance changed to " .. CurrentStance .. ".");
    end

    --[[
    -- Go through all stances
    for k,v in pairs(Turbine.Gameplay.Attributes.WardenStance) do
        if (v == stance) then
            CurrentStance = k;
            Debug("Warden stance changed to " .. k .. ".");
        end
    end
]] --
end

function DetectTraitLine()
    -- You have acquired the Class Specialization Bonus Trait: Determination.
    -- You have acquired the Class Specialization Bonus Trait: Recklessness.

    local skillList = LocalPlayer:GetTrainedSkills();
    local skillCount = skillList:GetCount();
    for i = 1, skillCount, 1 do
        local skill = skillList:GetItem(i);
        local skillInfo = skill:GetSkillInfo();
        local skillName = skillInfo:GetName();
        -- Skills from Determination: Warning Shot,Restorative Shield-work
        -- Traits from blue line: Desperate Combat, Desperate Spear
        if skillName == "Warning Shot" or skillName == "Restorative Shield-work" or skillName == "Desperate Combat" or
            skillName == "Desperate Spear" then
            Debug("Detected trait line: Determination");
            CurrentTraitLine = "Determination";
            return;
        end
    end

    -- Fall back to Recklessness as wardens cannot specify in Assailment
    Debug("Detected trait line: Recklessness");
    CurrentTraitLine = "Recklessness";
end

function ForceRepaintUI()
    Destroy();
    DetectStance();
    DetectTraitLine();
    ConstructWindows();
    PositionWindows();
    Core.DetectMount();
end

-- Register callback function for new added skills
Turbine.Gameplay.SkillList.SkillAdded = function(sender, args)
    local traitLine = CurrentTraitLine;
    local skill = Turbine.Gameplay.Skill.GetSkillInfo(args.Skill);
    -- Update only if it is a gambit
    if skill:GetType() == Turbine.Gameplay.SkillType.Gambit then
        Debug("New gambit detected: " .. skill:GetName() .. ". Updating gambit windows.");
        ForceRepaintUI();
    else
        Debug("New skill detected: " .. skill:GetName() .. ".");
        DetectTraitLine();
        if CurrentTraitLine ~= traitLine then
            Debug("Trait line changed to " .. CurrentTraitLine .. ".");
            ForceRepaintUI();
        end
    end
end

Turbine.Gameplay.SkillList.SkillRemoved = function(sender, args)
    local traitLine = CurrentTraitLine;
    local skill = Turbine.Gameplay.Skill.GetSkillInfo(args.Skill);
    -- Update only if it is a gambit
    if skill:GetType() == Turbine.Gameplay.SkillType.Gambit then
        Debug("Gambit removed: " .. skill:GetName() .. ". Updating gambit windows.");
        ForceRepaintUI();
    else
        Debug("Skill removed: " .. skill:GetName() .. "..");
        DetectTraitLine();
        if CurrentTraitLine ~= traitLine then
            Debug("Trait line changed to " .. CurrentTraitLine .. ".");
            ForceRepaintUI();
        end
    end
end

-- Register callback function for stance changes
Turbine.Gameplay.ClassAttributes.StanceChanged = function(sender, args)
    ForceRepaintUI();
end

-- Register callback function for mount changes
LocalPlayer.MountChanged = function(sender, args)
    Core.DetectMount();
end

-- Plugin unload handler
Turbine.Plugin.Unload = function(sender, args)
    -- Save the data when the plugin unloads.
    -- saveData();

    Debug("Plugin " .. Settings.GetPluginName() .. " unloaded.");
end

-- Start building something
DetectStance();
DetectTraitLine();
ConstructWindows();
PositionWindows();
Core.DetectMount();

-- Settings.GetAllSkills();

-- Load message
Turbine.Shell.WriteLine(plugin:GetName() .. " v" .. plugin:GetVersion() .. " by " .. plugin:GetAuthor());

-- TODO: On window resize -> position windows again
