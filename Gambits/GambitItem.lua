import "Turbine.UI";
import "Turbine.UI.Lotro";

GambitItem = class(Turbine.UI.Control);

GambitItem.EffectsOrder = {"Targets", "Range", "Chain", "Potency", "Dmg", "DoT", "Threat", "ToT", "Heal", "HoT",
                           "Interrupt", "Daze", "Fear", "Knockout", "Root", "Buff", "Special", "Other"}

function GambitItem:Constructor(gambitID)
    Turbine.UI.Control.Constructor(self);

    local gambit = GambitData[gambitID];

    self:SetSize(Settings.Window.Width, 20);
    self:SetBackColor(Turbine.UI.Color(Settings.Window.Opacity, 0, 0, 0));

    self.icon = Turbine.UI.Control();
    self.icon:SetParent(self);
    -- Do some resizing tricks
    self.icon:SetSize(32, 32);
    self.icon:SetBackground(gambitID);
    self.icon:SetStretchMode(1);
    self.icon:SetSize(16, 16);
    self.icon:SetPosition(2, 2);
    self.icon:SetOpacity(Settings.Window.Opacity);

    -- Remember the current position for the next element
    self.position = 20;

    if gambit ~= nil then
        -- Gambit builder
        self.builder = {};
        for i = 1, 5 do
            table.insert(self.builder, GambitBuilder(self, gambit.Combo[i], self.position));
            self.position = self.position + 14;
        end

        -- Gambit effects
        self.effects = Turbine.UI.Label();
        self.effects:SetParent(self);
        self.effects:SetSize(Settings.Window.Width - self.position - 2, 16);
        self.effects:SetPosition(self.position, 2);
        self.effects:SetMarkupEnabled(true);
        self.effects:SetMultiline(false);
        self.effects:SetTextAlignment(Turbine.UI.ContentAlignment.MiddleLeft);
        self.effects:SetFont(Settings.Gambit.Font);
        self.effects:SetForeColor(Settings.Gambit.Builder.Text.Default);
        self.effects:SetOpacity(Settings.Window.Opacity);

        local effectsArray = {};
        if gambit.Default ~= nil then
            for k, v in pairs(gambit.Default) do
                effectsArray[k] = v
            end
        end

        if currentStance == "Determination" and gambit.Determination ~= nil then
            for k, v in pairs(gambit.Determination) do
                effectsArray[k] = v
            end
        elseif currentStance == "Assailment" and gambit.Assailment ~= nil then
            for k, v in pairs(gambit.Assailment) do
                effectsArray[k] = v
            end
        end

        self:SetEffectsLabel(effectsArray);
    end
end

function GambitItem:SetEffectsLabel(gambit)
    local count = 0;

    if gambit == nil then
        self.effects:AppendText("... TODO!");
        return;
    end

    for k, v in pairs(GambitItem.EffectsOrder) do
        local effect = tostring(v);

        -- Process effect
        if gambit[effect] == nil then
            -- Do nothing
        else
            if count ~= 0 then
                self.effects:AppendText(",");
            end

            count = count + 1;

            -- Damage
            if effect == "Dmg" then
                self.effects:AppendText("<rgb=#FF4444>D</rgb>");
            elseif effect == "DoT" then
                self.effects:AppendText("<rgb=#FF4444>DoT</rgb>");

                -- Threat
            elseif effect == "Threat" then
                self.effects:AppendText("<rgb=#FFBB33>T</rgb>");
            elseif effect == "ToT" then
                self.effects:AppendText("<rgb=#FFBB33>ToT</rgb>");

                -- Healing
            elseif effect == "Heal" then
                self.effects:AppendText("<rgb=#99CC00>H</rgb>");
            elseif effect == "HoT" then
                self.effects:AppendText("<rgb=#99CC00>HoT</rgb>");

                -- Buff
            elseif effect == "Buff" then
                self.effects:AppendText("<rgb=#33B5E5>" .. gambit[effect] .. "</rgb>");

                -- Specials
            elseif effect == "Interrupt" then
                self.effects:AppendText("<rgb=#AA66CC>Interr.</rgb>");
            elseif effect == "Potency" then
                self.effects:AppendText("<rgb=#FFFFFF>P</rgb>");
            elseif effect == "Chain" then
                self.effects:AppendText("<rgb=#FFFFFF>" .. gambit[effect] .. "</rgb>");
            elseif effect == "Daze" or effect == "Fear" or effect == "Root" or effect == "Knockout" then
                self.effects:AppendText("<rgb=#AA66CC>" .. gambit[effect] .. "s " .. effect .. "</rgb>");
            elseif effect == "Special" then
                self.effects:AppendText("<rgb=#AA66CC>" .. gambit[effect] .. "</rgb>");

            elseif effect == "Targets" then
                self.effects:AppendText("<rgb=#9933CC>[" .. gambit[effect] .. "]</rgb>");

            elseif effect == "Range" then
                self.effects:AppendText("<rgb=#FF8800>R</rgb>");

                -- Other effects
            elseif effect == "Other" then
                self.effects:AppendText(gambit[effect]);
            else
                self.effects:AppendText(effect);
            end
        end
    end
end

function GambitItem:Destroy()

    self:SetVisible(false);

    if (self.icon ~= nil) then
        self.icon:SetVisible(false);
        self.icon = nil;
    end

    if (self.builder ~= nil) then
        self.builder = nil;
    end

    if (self.effects ~= nil) then
        self.effects:SetVisible(false);
        self.effects = nil;
    end
end
