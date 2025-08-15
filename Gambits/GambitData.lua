-- http://forums.lotro.com/showthread.php?451496-Asto-s-Gambit-Compendium-Warning-Comprehensive
-- ["None"] = 0
-- ["Recklessness"] = 1
-- ["Determination"] = 2
-- ["Assailment"] = 3
-- ["WayOfTheWarden"] = 4
GambitData = {

    -- Adroit Manoeuvre (1092813466)
    -- Boar's Rush (1091471261)
    -- Brink of Victory (1091471251)
    -- Cauterizing Steel (1092809827) *
    -- Celebration of Skill (1091471258)
    -- Combination Strike (1091471242)
    -- Conviction (1091478183)
    -- Dance of War (1092810675)
    -- Defensive Strike (1091469970)
    -- Deflection (1092810683)
    -- Deft Strike (1091469969)
    -- Desolation (1091478186)
    -- Exultation of Battle (1091471252)
    -- Fierce Resolve (1091471255)
    -- Goad (1091469968)
    -- Impressive Flourish (1091469960)
    -- Javelin of Fate (1092809825) *
    -- Javelin of Virtue (1091471244) *
    -- Maddening Strike (1092810680)
    -- Mighty Blow (1091471263)
    -- Offensive Strike (1091469961)
    -- Onslaught (1091471232)
    -- Persevere (1092810674)
    -- Piercing Strike (1091471245)
    -- Piercing Toss (1091471245) *
    -- Power Attack (1091471256)
    -- Precise Blow (1091471262)
    -- Precise Throw (1091471262) *
    -- Ranged Adroit Manoeuvre (1091713176)
    -- Ranged Boar's Rush (1091713179)
    -- Ranged Boot (1091713170)
    -- Ranged Cauterizing Steel (1092810687)
    -- Ranged Celebration of Skill (1091471258)
    -- Ranged Combination Strike (1091713174)
    -- Ranged Deft Strike (1091713169)
    -- Ranged Exultation of Battle (1091471252)
    -- Ranged Fierce Resolve (1091471255)
    -- Ranged Mighty Blow (1091713177)
    -- Ranged Offensive Strike (1091713171)
    -- Ranged Onslaught (1091713173)
    -- Ranged Persevere (1092810674)
    -- Ranged Power Attack (1091713172)
    -- Ranged Resolution (1091471249)
    -- Ranged Resounding Challenge (1091744833)
    -- Ranged Restoration (1091471247)
    -- Ranged Reversal (1091713175)
    -- Ranged Safeguard (1091471259)
    -- Ranged The Dark Before Dawn (1092812616)
    -- Ranged Unerring Strike (1091713182)
    -- Ranged Unseen Strikes (1092810676)
    -- Ranged Wall of Steel (1091713178)
    -- Ranged Warden's Triumph (1091713181)
    -- Readied Blade (1092809829) *
    -- Resolution (1091471249)
    -- Resounding Challenge (1091744833)
    -- Restoration (1091471247)
    -- Reversal (1091478098)
    -- Safeguard (1091471259)
    -- Shield Mastery (1092810684)
    -- Shield Tactics (1092810677)
    -- Shield Up (1092810686) *
    -- Spear of Fate (1092809825) *
    -- Spear of Virtue (1091471244)
    -- Surety of Death (1091471237)
    -- The Boot (1091509864)
    -- The Dark Before Dawn (1092812619)
    -- Unerring Strike (1091585378)
    -- Unseen Strikes (1092810679) *
    -- Wall of Steel (1091471267)
    -- War-cry (1091471234)
    -- Warden's Triumph (1091478187)

    [1092810686] = {
        Name = "Shield Up",
        Combo = {2, 1, 3},
        Default = {
            Buff = "block"
        },
        Assailment = {},
        Determination = {}
    },

    [1092809825] = {
        Name = "Spear of Fate",
        Combo = {3, 1, 3, 1, 3},
        Default = {
            Dmg = true,
            DoT = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },

    [1092810679] = {
        Name = "Unseen Strikes",
        Combo = {1, 3, 1, 3, 1},
        Default = {
            Targets = 6,
            Dmg = true,
            Chain = "F2"
        },
        Assailment = {},
        Determination = {}
    },

    [1092813466] = {
        Name = "Adroit Manoeuvre",
        Combo = {1, 3, 2, 1},
        Default = {
            Dmg = true,
            Buff = "finesse",
            Special = "-attack dur."
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471261] = {
        Name = "Boar's Rush",
        Combo = {1, 3, 1, 3},
        Default = {
            Targets = 6,
            Dmg = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471251] = {
        Name = "Brink of Victory",
        Combo = {3, 2, 3},
        Default = {
            Targets = 6,
            Dmg = true,
            DoT = true,
            Chain = "S2"
        },
        Assailment = {},
        Determination = {
            ToT = 2
        }
    },
    [1092809827] = {
        Name = "Cauterizing Steel",
        Combo = {1, 2, 1, 2, 1},
        Default = {
            Dmg = true,
            Other = "-phys mit.",
            Chain = "F1"
        },
        Assailment = {},
        Determination = {}
    },
    [1091471258] = {
        Name = "Celebration of Skill",
        Combo = {2, 1, 2, 1},
        Default = {
            Dmg = true,
            Heal = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471242] = {
        Name = "Combination Strike",
        Combo = {1, 3, 1},
        Default = {
            Targets = 6,
            Dmg = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091478183] = {
        Name = "Conviction",
        Combo = {2, 3, 2, 3, 2},
        Default = {
            Range = "30m",
            Heal = true,
            HoT = true,
            Special = "fellowship wide",
            Buff = "tact/evade"
        },
        Assailment = {},
        Determination = {
            Threat = 1
        }
    },
    [1092810675] = {
        Name = "Dance Of War",
        Combo = {2, 3, 2, 3},
        Default = {
            Buff = "phys/evade"
        },
        Assailment = {},
        Determination = {}
    },
    [1091469970] = {
        Name = "Defensive Strike",
        Combo = {2, 2},
        Default = {
            Dmg = true,
            Potency = true
        },
        Assailment = {},
        Determination = {}
    },
    [1092810683] = {
        Name = "Deflection",
        Combo = {3, 2, 1},
        Default = {
            Targets = 10,
            Range = "30m"
        },
        Assailment = {},
        Determination = {
            Threat = 2
        },
        Recklessness = {
            Special = "-AoE threat"
        }
    },
    [1091469969] = {
        Name = "Deft Strike",
        Combo = {1, 1},
        Default = {
            Dmg = true,
            Potency = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091478186] = {
        Name = "Desolation",
        Combo = {3, 2, 3, 2, 3},
        Default = {
            Targets = 6,
            Dmg = true,
            DoT = true
        },
        Assailment = {},
        Determination = {
            ToT = 2,
            Chain = "F1"
        }
    },
    [1091471252] = {
        Name = "Exultation of Battle",
        Combo = {3, 1, 2, 3, 2},
        Default = {
            Targets = 10,
            Dmg = true,
            Heal = true,
            DoT = true,
            HoT = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {
            ToT = 2
        }
    },
    [1091471255] = {
        Name = "Fierce Resolve",
        Combo = {3, 1, 2},
        Default = {
            Targets = 10,
            Dmg = true,
            Heal = true,
            DoT = true,
            HoT = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {
            ToT = 1
        }
    },
    [1091469968] = {
        Name = "Goad",
        Combo = {3, 3},
        Default = {
            Targets = 5,
            Dmg = true,
            Potency = true
        },
        Assailment = {},
        Determination = {
            ToT = 1
        }
    },
    [1091469960] = {
        Name = "Impressive Flourish",
        Combo = {2, 3},
        Default = {
            Dmg = true,
            Buff = "parry"
        },
        Assailment = {},
        Determination = {
            ToT = 1
        }
    },
    [1092810680] = {
        Name = "Maddening Strike",
        Combo = {2, 3, 2},
        Default = {
            Dmg = true,
            Buff = "evade"
        },
        Assailment = {},
        Determination = {
            Threat = 1
        }
    },
    [1091471263] = {
        Name = "Mighty Blow",
        Combo = {1, 2, 3, 1},
        Default = {
            Dmg = true,
            DoT = true,
            Chain = "S1"
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091469961] = {
        Name = "Offensive Strike",
        Combo = {1, 3},
        Default = {
            Targets = 6,
            Dmg = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471232] = {
        Name = "Onslaught",
        Combo = {1, 2, 1},
        Default = {
            Dmg = true,
            Other = "-phys mit."
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1092810674] = {
        Name = "Persevere",
        Combo = {2, 1},
        Default = {
            Dmg = true,
            Heal = true,
            HoT = true,
            Special = "+inc heal"
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471245] = {
        Name = "Piercing Strike",
        Combo = {3, 1, 3},
        Default = {
            Dmg = true,
            DoT = true
        },
        Assailment = {},
        Determination = {}
    },
    [1091471256] = {
        Name = "Power Attack",
        Combo = {1, 2, 3},
        Default = {
            Dmg = true,
            DoT = true,
            Chain = "S1"
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471262] = {
        Name = "Precise Blow",
        Combo = {3, 1},
        Default = {
            Dmg = true,
            DoT = true
        },
        Assailment = {},
        Determination = {}
    },
    [1092809829] = {
        Name = "Readied Blade",
        Combo = {2, 3, 1},
        Default = {
            Buff = "parry"
        },
        Assailment = {},
        Determination = {}
    },
    [1091471249] = {
        Name = "Resolution",
        Combo = {3, 1, 2, 3},
        Default = {
            Targets = 10,
            Dmg = true,
            Heal = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {
            Threat = 1
        }
    },
    [1091744833] = {
        Name = "Resounding Challenge",
        Combo = {3, 2, 3, 1},
        Default = {
            Targets = 10,
            Range = "20m",
            Dmg = true,
            DoT = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {
            Threat = 3,
            ToT = 2
        }
    },
    [1091471247] = {
        Name = "Restoration",
        Combo = {2, 1, 2, 1, 2},
        Default = {
            Dmg = true,
            Heal = true,
            HoT = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091478098] = {
        Name = "Reversal",
        Combo = {1, 3, 2},
        Default = {
            Dmg = true,
            Special = "-corruptions"
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471259] = {
        Name = "Safeguard",
        Combo = {2, 1, 2},
        Default = {
            Dmg = true,
            Heal = true,
            HoT = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1092810684] = {
        Name = "Shield Mastery",
        Combo = {2, 1, 3, 2},
        Default = {
            Buff = "block"
        },
        Assailment = {},
        Determination = {}
    },
    [1092810677] = {
        Name = "Shield Tactics",
        Combo = {2, 3, 1, 2},
        Default = {
            Buff = "crit def.",
            Special = "stun immunity"
        },
        Assailment = {},
        Determination = {}
    },
    [1091471244] = {
        Name = "Spear of Virtue",
        Combo = {3, 1, 3, 1},
        Default = {
            Dmg = true,
            DoT = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471237] = {
        Name = "Surety of Death",
        Combo = {3, 2, 3, 2},
        Default = {
            Targets = 6,
            Dmg = true,
            DoT = true,
            Chain = "S2"
        },
        Assailment = {},
        Determination = {
            ToT = 2
        }
    },
    [1091509864] = {
        Name = "The Boot",
        Combo = {1, 2},
        Default = {
            Dmg = true,
            Other = "-phys mit.",
            Interrupt = true
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1092812619] = {
        Name = "The Dark Before Dawn",
        Combo = {1, 2, 1, 3, 1},
        Default = {
            Dmg = true,
            Special = "+power"
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091585378] = {
        Name = "Unerring Strike",
        Combo = {1, 2, 3, 1, 2},
        Default = {
            Dmg = true,
            DoT = true,
            Chain = "S1"
        },
        Assailment = {
            Range = "30m"

        },
        Determination = {}
    },
    [1091471267] = {
        Name = "Wall of Steel",
        Combo = {1, 2, 1, 2},
        Default = {
            Dmg = true,
            Other = "-phys mit."
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    },
    [1091471234] = {
        Name = "War-cry",
        Combo = {3, 2},
        Default = {
            Targets = 10,
            Dmg = true,
            DoT = true,
            Chain = "S2"
        },
        Assailment = {},
        Determination = {
            ToT = 1
        }
    },
    [1091478187] = {
        Name = "Warden's Triumph",
        Combo = {1, 3, 2, 1, 3},
        Default = {
            Dmg = true,
            Buff = "dmg"
        },
        Assailment = {
            Range = "30m"
        },
        Determination = {}
    }
}
