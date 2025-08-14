import "Turbine.Gameplay";
import "Turbine.UI";

--[[
    A Core class that will listen to keydown.
    It's better to have 1 core window that handles this then all seperate windows.
]] --
Core = class(Turbine.UI.Control);

function Core:Constructor(window)
    Turbine.UI.Control.Constructor(self);

    -- This is a hidden control element
    self:SetVisible(false);

    -- Enable keyevents (Actions) for this control
    self:SetWantsKeyEvents(true);

    -- Start with a full HUD
    Core.hudVisible = true;
end

function Core.Start()
    Core.GetInstance();
end

function Core.GetInstance()
    if Core.instance == nil then
        Core.instance = Core();
    end

    return Core.instance;
end

-- Key handler
function Core.KeyDown(sender, args)
    -- Handle escape key
    if (args.Action == Turbine.UI.Lotro.Action.Escape) then
        Core.hudVisible = true;
        Core.SetHudVisibility(Core.hudVisible);
        -- Toggle HUD
    elseif (args.Action == 268435635) then
        Core.hudVisible = not Core.hudVisible;
        Core.SetHudVisibility(Core.hudVisible);
    end
end

function Core.SetHudVisibility(visible)
    if (GambitWindows == nil) then
        return
    end

    -- Force visibility to false when mounted
    local mount = LocalPlayer:GetMount();
    if (LocalPlayer:GetMount() ~= nil) then
        visible = false;
    end

    -- Update windows
    for i = 1, #GambitWindows do
        GambitWindows[i]:SetVisible(visible);
    end
end

function Core.DetectMount()
    if (LocalPlayer:GetMount() == nil) then
        -- Not mounted
        Core.SetHudVisibility(true);
    else
        -- Mounted
        Core.SetHudVisibility(false);
    end
end
