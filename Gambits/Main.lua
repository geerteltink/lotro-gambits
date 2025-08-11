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
heightLeft = nil;
heightRight = nil;
currentStance = nil;

Core.Start();

player = Turbine.Gameplay.LocalPlayer:GetInstance();

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
    heightLeft = nil;
    heightRight = nil;

    -- Get all gambits
    ActiveGambits = {};
    local skills = player:GetClassAttributes():GetTrainedGambits();
    local skillCount = skills:GetCount();
    for i = 1, skillCount, 1 do
        local skill = Turbine.Gameplay.Skill.GetSkillInfo(skills:GetItem(i));
        Debug("Gambit detected: " .. skill:GetName() .. " (" .. skill:GetIconImageID() .. ")" .. " - " ..
                  skill:GetGambitCount());
        ActiveGambits[skill:GetIconImageID()] = skill:GetName();
    end

    local xskills = player:GetClassAttributes():GetUntrainedGambits();
    local xskillCount = xskills:GetCount();
    for i = 1, xskillCount, 1 do
        local xskill = Turbine.Gameplay.Skill.GetSkillInfo(xskills:GetItem(i));
        Debug("Untrained Gambit detected: " .. xskill:GetName() .. " (" .. xskill:GetIconImageID() .. ")");
    end

    -- Create gambit windows
    GambitWindows = {};
    heightLeft = Settings.Window.Offset.Bottom;
    heightRight = Settings.Window.Offset.Bottom;

    -- Construct each gambit window
    for i = 1, #GambitLayout do
        if (GambitLayout[i].Enabled) then
            local window = GambitWindow(GambitLayout[i]);
            if window.Placement == "left" then
                heightLeft = heightLeft + window:GetHeight();
                table.insert(GambitWindows, window);
            elseif window.Placement == "right" then
                heightRight = heightRight + window:GetHeight();
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
            GambitWindows[i]:SetTop(screenHeight - heightLeft);
            heightLeft = heightLeft - GambitWindows[i]:GetHeight();
        elseif GambitWindows[i].Placement == "right" then
            GambitWindows[i]:SetTop(screenHeight - heightRight);
            heightRight = heightRight - GambitWindows[i]:GetHeight();
        end
    end
end

function DetectStance()
    local stance = player:GetClassAttributes():GetStance();
    local newStance = nil;

    if stance == 0 then
        newStance = "None";
    elseif stance == 1 then
        newStance = "Recklessness";
    elseif stance == 2 then
        newStance = "Determination";
    elseif stance == 3 then
        newStance = "Assailment";
    end

    if newStance ~= currentStance then
        currentStance = newStance;
        Debug("Warden stance changed to " .. currentStance .. ".");
    end
    --[[
    -- Go through all stances
    for k,v in pairs(Turbine.Gameplay.Attributes.WardenStance) do
        if (v == stance) then
            currentStance = k;
            Debug("Warden stance changed to " .. k .. ".");
        end
    end
]] --
end

-- Register callback function for new added skills
Turbine.Gameplay.SkillList.SkillAdded = function(sender, args)
    local skill = Turbine.Gameplay.Skill.GetSkillInfo(args.Skill);
    -- Update only if it is a gambit
    if skill:GetType() == Turbine.Gameplay.SkillType.Gambit then
        Debug("New gambit detected: " .. skill:GetName() .. ". Updating gambit windows.");
        Destroy();
        DetectStance();
        ConstructWindows();
        PositionWindows();
        Core.DetectMount();
    end
end

-- Register callback function for stance changes
Turbine.Gameplay.ClassAttributes.StanceChanged = function(sender, args)
    Destroy();
    DetectStance();
    ConstructWindows();
    PositionWindows();
    Core.DetectMount();
end

-- Register callback function for mount changes
player.MountChanged = function(sender, args)
    Core.DetectMount();
end

-- Plugin unload handler
Turbine.Plugin.Unload = function(sender, args)
    -- Save the data when the plugin unloads.
    -- saveData();

    Debug("Plugin " .. Settings.GetPluginName() .. " unloading...");
end

-- Start building something
DetectStance();
ConstructWindows();
PositionWindows();
Core.DetectMount();

-- Load message
Turbine.Shell.WriteLine(plugin:GetName() .. " v" .. plugin:GetVersion() .. " by " .. plugin:GetAuthor());

-- TODO: On window resize -> position windows again
