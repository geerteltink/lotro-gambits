import "Turbine.Gameplay";

Settings = class();

function Settings:Constructor(reset)
    if (reset) then
        self:_SetDefaults();
        self:_Save();
    else
        self:_Load();
    end
end

function Settings:_Load()
    self:_SetDefaults();
end

function Settings:_Save()

end

-- Set default settings
function Settings:_SetDefaults()
    local screenWidth = Turbine.UI.Display.GetWidth();
    local screenHeight = Turbine.UI.Display.GetHeight();

    self.version = plugin:GetVersion();
    self.pluginName = plugin:GetName();
    self.opacity = 0.5;

    Settings.Window = {
        Opacity = self.opacity,
        Width = 180,
        Offset = {
            Left = (screenWidth / 2) - 400,
            Right = (screenWidth / 2) + 250,
            Bottom = 100
        },
        Font = Turbine.UI.Lotro.Font.Verdana10,
        Background = RGBA(0, 0, 0, self.opacity)
    };

    Settings.Gambit = {
        ForceAll = false, -- force displaying all gambits
        Font = Turbine.UI.Lotro.Font.Verdana10,

        Builder = {
            Background = {
                Spear = RGBA(153, 61, 49, self.opacity),
                Shield = RGBA(78, 113, 41, self.opacity),
                Fist = RGBA(195, 160, 60, self.opacity),
                Javelin = RGBA(204, 108, 0, self.opacity),
                Default = RGBA(34, 34, 34, self.opacity)
            },

            Outline = RGBA(51, 51, 51, self.opacity),

            Text = {
                Default = RGBA(204, 204, 204, self.opacity)
            }
        }
    };
end

-- Load the plugin settings
function Settings.Load()
    Settings.instance = Settings(true);
end

-- Save the plugin settings
function Settings.Save()
    if (Settings.instance ~= nil) then
        Settings.instance:_Save();
    end
end

function Settings.GetOpacity()
    return Settings.instance.opacity;
end

function Settings.GetPluginName()
    return Settings.instance.pluginName;
end

-- return the combined set of account/character effect windows
function Settings.GetWindows()
    return Settings.instance.windows;
end

function Settings.GetAllSkills()

    local skills = Turbine.Gameplay.LocalPlayer:GetInstance():GetClassAttributes():GetTrainedGambits();
    local skillCount = skills:GetCount();
    Debug("Trained gambits: " .. tostring(skillCount));

    for i = 1, skillCount, 1 do
        local skill = Turbine.Gameplay.Skill.GetSkillInfo(skills:GetItem(i));
        Turbine.Shell.WriteLine("Gambit: " .. tostring(skill:GetIconImageID()) .. " - " .. tostring(skill:GetName()));
    end

    local skills = Turbine.Gameplay.LocalPlayer:GetInstance():GetClassAttributes():GetUntrainedGambits();
    local skillCount = skills:GetCount();
    Debug("Untrained gambits: " .. tostring(skillCount));

    for i = 1, skillCount, 1 do
        local skill = Turbine.Gameplay.Skill.GetSkillInfo(skills:GetItem(i));
        Turbine.Shell.WriteLine("Gambit: " .. tostring(skill:GetIconImageID()) .. " - " .. tostring(skill:GetName()));
    end

end
