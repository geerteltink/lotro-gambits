import "Turbine.Gameplay";
import "Turbine.UI";

GambitWindow = class(Turbine.UI.Window);

-- invisible window hack
GambitWindow.InvisibleColor = Turbine.UI.Color(0, 0, 0, 0);

function GambitWindow:Constructor(window)
    Turbine.UI.Window.Constructor(self);

    self.Placement = window.Placement;

    -- Assigns the title bar text
    self:SetText("GAMBITS:" .. window.GroupName);

    -- Add a window label
    self.message = Turbine.UI.Label();
    self.message:SetParent(self);
    self.message:SetSize(Settings.Window.Width - 18, 20);
    -- Set position, please text right above gambit builder which starts at 18
    self.message:SetPosition(18, 0);
    self.message:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
    self.message:SetText(window.GroupName);
    self.message:SetForeColor(RGBA(204, 204, 204, 0.5));

    self.gambits = GambitList(window.Gambits);
    self.gambits:SetParent(self);
    self.gambits:SetPosition(0, 20);

    -- Update window size
    self:SetSize(Settings.Window.Width, self.gambits:GetHeight() + 20);

    -- Set left position
    if self.Placement == "left" then
        self:SetLeft(Settings.Window.Offset.Left);
    elseif self.Placement == "right" then
        self:SetLeft(Settings.Window.Offset.Right);
    end

    -- Set temp top position
    --self:SetTop(window.Y);

    -- Display the window (windows are not visible by default)
    if self.gambits:GetItemCount() > 0 then
        self:SetVisible(true);
    else
        self:SetVisible(false);
        self.Placement = nil;
    end
end

function GambitWindow:Destroy()

    self:SetVisible(false);

    if (self.message ~= nil) then
        self.message:SetVisible(false);
        self.message = nil;
    end

    if (self.gambits ~= nil) then
        self.gambits:SetVisible(false);
        self.gambits:Destroy();
        self.gambits = nil;
    end
end
