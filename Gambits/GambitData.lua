-- http://forums.lotro.com/showthread.php?451496-Asto-s-Gambit-Compendium-Warning-Comprehensive

-- ["None"] = 0
-- ["Recklessness"] = 1
-- ["Determination"] = 2
-- ["Assailment"] = 3
-- ["WayOfTheWarden"] = 4

GambitData = {

-- Fist 2
[1091469968] = {
    Name = "Goad",
    Combo = {3,3},
    Default = {
        Targets = 5,
        Dmg = 732,
        DoT = 732,
    },
    Assailment = {
    },
    Determination = {
        Threat = "0.5T",
    },
},
-- 251.6% MH + bonus
[1091471262] = {
    Name = "Precise Blow",
    Combo = {3,1},
    Default = {
    },
    Assailment = {
        Dmg = "193.5%",
        Range = "25m",
        Other = "-crit defence",
    },
    Determination = {
        Dmg = "256.1%",
        Dot = "953",
        Threat = "2T",
        ToT = "2ToT",
    },
},
[1091471234] = {
    Name = "War-cry",
    Combo = {3,2},
    Default = {
        Targets = 10,
        Dmg = 732,
        DoT = 732,
    },
    Assailment = {
    },
    Determination = {
        Defence = "evade",
        Threat = "2T",
    },
},

-- Fist 3
[1091471251] = {
    Name = "Brink of Victory",
    Combo = {3,2,3},
    Default = {
        Dmg = 1926,
        DoT = 1926,
        Defence = "evade",
    },
    Assailment = {
    },
    Determination = {
        Threat = "1T",
    },
},
[1091471255] = {
    Name = "Fierce Resolve",
    Combo = {3,1,2},
    Default = {
        Targets = 10,
        Dmg = 248,
        Heal = 248,
        DoT = 248,
        HoT = 248,
    },
    Assailment = {
        Range = "25m",
    },
    Determination = {
    },
},
-- 112.6% MH + bonus + 111 Dmg
[1091471245] = {
    Name = "Piercing Strike",
    Combo = {3,1,3},
    Default = {
    },
    Assailment = {
        Dmg = "193.5%",
        Range = "25m",
        Other = "-crit defence",
    },
    Determination = {
        Dmg = "251.6%",
        Dot = 2266,
        Threat = "1T",
    },
},

-- Fist 4
[1091471249] = {
    Name = "Resolution",
    Combo = {3,1,2,3},
    Default = {
        Targets = 10,
        Dmg = 1206,
        Heal = 1206,
    },
    Assailment = {
        Range = "25m",
    },
    Determination = {
    },
},
[1091744833] = {
    Name = "Resounding Challenge",
    Combo = {3,2,3,1},
    Default = {
        Targets = 6,
        Range = "25m",
    },
    Assailment = {
        Dmg = 1480,
        Dot = 732,
    },
    Determination = {
        Dmg = 2605,
        Threat = "3T",
    },
},
-- 112.6% MH + bonus
[1091471244] = {
    Name = "Spear of Virtue",
    Combo = {3,1,3,1},
    Default = {
        Dot = 3019,
    },
    Assailment = {
        Dmg = "193.5%",
        Range = "25m",
        Other = "-crit defence",
    },
    Determination = {
        Dmg = "251.6%",
        Threat = "3T",
    },
},
[1091471237] = {
    Name = "Surety of Death",
    Combo = {3,2,3,2},
    Default = {
        Targets = 6,
        Dmg = "435.4%",
        DoT = 2567,
        Defence = "evade",
    },
    Assailment = {
    },
    Determination = {
        Threat = "3T",
    },
},

-- Fist 5
[1091478186] = {
    Name = "Desolation",
    Combo = {3,2,3,2,3},
    Default = {
        Targets = 6,
        Dmg = 2838,
        DoT = 2838,
        Other = "+5% miss"
    },
    Assailment = {
    },
    Determination = {
    },
},
[1091471252] = {
    Name = "Exultation of Battle",
    Combo = {3,1,2,3,2},
    Default = {
        Targets = 10,
        Dmg = 931,
        Heal = 490,
        DoT = 931,
        HoT = 490,
    },
    Assailment = {
        Range = "25m",
    },
    Determination = {
        ToT = "2ToT",
    },
},

-- Shield 2
[1091469970] = {
    Name = "Defensive Strike",
    Combo = {2,2},
    Default = {
        Dmg = "435.4%",
    },
    Assailment = {
    },
    Determination = {
        Defence = "block",
    },
},
[1091469960] = {
    Name = "Impressive Flourish",
    Combo = {2,3},
    Default = {
        Dmg = 1742,
        DoT = 732,
        Defence = "crit/phys/tact",
    },
    Assailment = {
    },
    Determination = {
    },
},
-- 251.9% MH + bonus
[1091469964] = {
    Name = "Persevere",
    Combo = {2,1},
    Default = {
        Dmg = "454.7%",
    },
    Assailment = {
        Range = "25m",
        HoT = 288,
    },
    Determination = {
        Threat = "2T",
        Defence = "block",
        HoT = 430,
    },
},

-- Shield 3
[1091471254] = {
    Name = "Maddening Strike",
    Combo = {2,3,2},
    Default = {
        Dmg = "677.3%",
        Defence = "crit/phys/tact",
    },
    Assailment = {
    },
    Determination = {
    },
},
[1091471259] = {
    Name = "Safeguard",
    Combo = {2,1,2},
    Default = {
    },
    Assailment = {
        Range = "25m",
        Dmg = 244,
        Hot = 608,
    },
    Determination = {
        Dmg = 441,
        HoT = 1129,
        Defence = "block",
        Threat = "2T",
    },
},

-- Shield 4
[1091471258] = {
    Name = "Celebration of Skill",
    Combo = {2,1,2,1},
    Default = {
        Dmg = "454.7%",
    },
    Assailment = {
        Range = "25m",
        Hot = "861",
    },
    Determination = {
        Threat = "2T",
        Defence = "block",
        Other = "+3.5% heal/Finisher",
    },
},
[1091471266] = {
    Name = "Dance Of War",
    Combo = {2,3,2,3},
    Default = {
        Defence = "crit/phys",
    },
    Assailment = {
        Range = "25m",
    },
    Determination = {
        Transfer = "5TT",
        Other = "Finisher"
    },
},

-- Shield 5
[1091478183] = {
    Name = "Conviction",
    Combo = {2,3,2,3,2},
    Default = {
        HoT = 682,
        Special = "fellowship wide",
        Defence = "crit/tact",
    },
    Assailment = {
    },
    Determination = {
        Transfer = "5TT",
    },
},
[1091471247] = {
    Name = "Restoration",
    Combo = {2,1,2,1,2},
    Default = {
        HoT = 1511,
        Other = "Finisher",
    },
    Assailment = {
        Dmg = "251.6%",
        Range = "25m",
    },
    Determination = {
        Dmg = "454.7%",
        Threat = "2T",
    },
},

-- Spear 2
[1091469969] = {
    Name = "Deft Strike",
    Combo = {1,1},
    Default = {
    },
    Assailment = {
        Dmg = "232.2%",
        Range = "25m",
    },
    Determination = {
        Dmg = "270.9%",
    },
},
[1091469961] = {
    Name = "Offensive Strike",
    Combo = {1,3},
    Default = {
        Dmg = 2,
        DoT = 188,
        HoT = 188,
    },
    Assailment = {
        Range = "25m",
        Dmg = "406.4%",
        Other = "-2% dmg"
    },
    Determination = {
        Dmg = "270.9% x2",
        Dot = 283,
        Hot = 283,
        Other = "-10% healing",
        Threat = "2T",
    },
},
[1091509864] = {
    Name = "The Boot",
    Combo = {1,2},
    Default = {
        Interrupt = true,
    },
    Assailment = {
        Dmg = 312,
    },
    Determination = {
        Dmg = 436,
    },
},

-- Spear 3
[1091471242] = {
    Name = "Combination Strike",
    Combo = {1,3,1},
    Default = {
    },
    Assailment = {
        Range = "25m",
        Dot = "406.4%",
        Other = "+stack/-2% dmg"
    },
    Determination = {
        Dmg = "270.9% x2",
        Other = "-10% healing"
    },
},
[1091471232] = {
    Name = "Onslaught",
    Combo = {1,2,1},
    Default = {
        Interrupt = true,
    },
    Assailment = {
        Range = "25m",
        Dmg = "520.5%",
    },
    Determination = {
        Dmg = "241.9% x3",
    },
},
[1091471256] = {
    Name = "Power Attack",
    Combo = {1,2,3},
    Default = {
    },
    Assailment = {
        Range = "25m",
        Dmg = "232.2%",
    },
    Determination = {
        Dmg = "270.9%",
        Dot = 954,
    },
},
[1091478098] = {
    Name = "Reversal",
    Combo = {1,3,2},
    Default = {
        Special = "-corruptions",
    },
    Assailment = {
        Range = "25m",
        Dmg = "232.2%",
    },
    Determination = {
        Dmg = "270.9%",
    },
},

-- Spear 4
-- 112.6% MH + bonus
[1091478097] = {
    Name = "Adroit Manoeuvre",
    Combo = {1,3,2,1},
    Default = {
        Special = "-16% attack duration",
    },
    Assailment = {
        Range = "25m",
        Dmg = "232.2%",
    },
    Determination = {
        Dmg = "270.9%",
    },
},
[1091471261] = {
    Name = "Boar's Rush",
    Combo = {1,3,1,3},
    Default = {
        Daze = 5,
    },
    Assailment = {
        Range = "25m",
        Dmg = 1308,
        Other = "+stack/-4% dmg"
    },
    Determination = {
        Dmg = 1656,
        Other = "-10% healing"
    },
},
[1091471263] = {
    Name = "Mighty Blow",
    Combo = {1,2,3,1},
    Default = {
    },
    Assailment = {
        Range = "25m",
        Dmg = "232.2%",
    },
    Determination = {
        Dmg = "270.9%",
        Dot = "270.9%",
        Other = "+stack",
    },
},
[1091471267] = {
    Name = "Wall of Steel",
    Combo = {1,2,1,2},
    Default = {
        Interrupt = true,
    },
    Assailment = {
        Range = "25m",
        Dmg = "609.5%",
    },
    Determination = {
        Dmg = "270.9% x3",
        Defence = "parry",
    },
},

-- Spear 5
-- 112.6% MH + bonus x2
[1091471253] = {
    Name = "The Dark Before Dawn",
    Combo = {1,2,1,3,1},
    Default = {
        Special = "+power",
    },
    Assailment = {
        Range = "25m",
        Dmg = "406.4%",
    },
    Determination = {
        Dmg = "270.9% x2",
    },
},
-- 112.6% MH + bonus
[1091585378] = {
    Name = "Unerring Strike",
    Combo = {1,2,3,1,2},
    Default = {
    },
    Assailment = {
        Range = "25m",
        Dmg = "232.2%",
    },
    Determination = {
        Dmg = "270.9%",
        Dot = 2625,
        Other = "+stack",
    },
},
[1091478187] = {
    Name = "Warden's Triumph",
    Combo = {1,3,2,1,3},
    Default = {
    },
    Assailment = {
        Range = "25m",
        Dmg = "232.2%",
        Special = "5% ranged dmg",
    },
    Determination = {
        Dmg = "270.9%",
        Special = "+12% melee dmg",
    },
}
}
