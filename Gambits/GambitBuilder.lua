import "Turbine.UI";
import "Turbine.UI.Lotro";

GambitBuilder = class(Turbine.UI.Label);

function GambitBuilder:Constructor(target, build, pos)
    Turbine.UI.Label.Constructor(self);

    -- Gambit builder
    self:SetParent(target);
    self:SetOutlineColor(Settings.Gambit.Builder.Outline);
    self:SetSize(12, 12);
    self:SetPosition(pos, 4);
    self:SetFont(Settings.Gambit.Font);
    self:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleCenter);
    self:SetForeColor(Settings.Gambit.Builder.Text.Default);

    if build == 1 then
        if CurrentStance == "Assailment" then
            self:SetBackColor(Settings.Gambit.Builder.Background.Javelin);
        else
            self:SetBackColor(Settings.Gambit.Builder.Background.Spear);
        end
        self:SetText("1");
    elseif build == 2 then
        self:SetBackColor(Settings.Gambit.Builder.Background.Shield);
        self:SetText("2");
    elseif build == 3 then
        self:SetBackColor(Settings.Gambit.Builder.Background.Fist);
        self:SetText("3");
    else
        self:SetBackColor(Settings.Gambit.Builder.Background.Default);
    end
end
