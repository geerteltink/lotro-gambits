import "Turbine.Gameplay";
import "Turbine.UI";

GambitList = class(Turbine.UI.ListBox);

function GambitList:Constructor(gambits)
    Turbine.UI.ListBox.Constructor(self);

    self:SetOrientation(Turbine.UI.Orientation.Horizontal);
    self:SetMaxItemsPerLine(1);
    self:SetMouseVisible(false);

    -- Add gambits
    for k, v in pairs(gambits) do
        if (ActiveGambits[v]) then
            local gambit = GambitItem(v);
            self:AddItem(gambit);
        end
    end

    -- Set size
    self:SetWidth(Settings.Window.Width);
    self:SetHeight(self:GetItemCount() * 20);
end

function GambitList:Destroy()
    local count = self:GetItemCount();
    while (count > 0) do
        local item = self:GetItem(1);
        item:Destroy();
        self:RemoveItemAt(1);
        count = count - 1;
    end
end
