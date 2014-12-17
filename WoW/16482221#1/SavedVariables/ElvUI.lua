
ElvDB = {
	["worldBosses"] = {
		["김곱충-줄진"] = {
			["class"] = "WARLOCK",
			["realm"] = "줄진",
		},
		["reset"] = true,
	},
	["profileKeys"] = {
		["나라잃은토템 - 줄진"] = "나라잃은토템 - 줄진",
		["버징기 - 줄진"] = "버징기 - 줄진",
		["김롯리 - 줄진"] = "김롯리 - 줄진",
		["김곱충 - 줄진"] = "김곱충 - 줄진",
	},
	["gold"] = {
		["줄진"] = {
			["김곱충"] = 184322690,
			["김롯리"] = 13136,
			["버징기"] = 23784300,
			["나라잃은토템"] = 2270,
		},
	},
	["namespaces"] = {
		["LibDualSpec-1.0"] = {
		},
	},
	["worldBoss"] = {
		["김곱충-줄진"] = {
			["class"] = "WARLOCK",
			["realm"] = "줄진",
		},
		["나라잃은토템-줄진"] = {
			["OondastaKilled"] = false,
			["Celestials"] = false,
			["Ordos"] = false,
			["realm"] = "줄진",
			["NalakKilled"] = false,
			["class"] = "SHAMAN",
			["shaKilled"] = false,
			["galleonKilled"] = false,
		},
		["버징기-줄진"] = {
			["OondastaKilled"] = false,
			["Celestials"] = false,
			["Ordos"] = false,
			["galleonKilled"] = false,
			["NalakKilled"] = false,
			["class"] = "PALADIN",
			["shaKilled"] = false,
			["realm"] = "줄진",
		},
		["reset"] = true,
	},
	["global"] = {
		["screenheight"] = 900,
		["luaError"] = {
			"|cffffd200Message:|r|cffffffff ...terface\\AddOns\\GearStatsSummary\\GearStatsSummary.lua:1: Cannot find a library instance of \"LibInspectLess-1.0\".|r\n|cffffd200Time:|r|cffffffff Wed Dec 17 22:42:06 2014|r\n|cffffd200Count:|r|cffffffff 1|r\n|cffffd200Stack:|r|cffffffff [C]: in function `error'\nInterface\\AddOns\\libs\\LibStub\\LibStub.lua:38: in function `LibStub'\n...terface\\AddOns\\GearStatsSummary\\GearStatsSummary.lua:1: in main chunk\n|r\n|cffffd200Locals:|r|cffffffff (*temporary) = \"Cannot find a library instance of \"LibInspectLess-1.0\".\"\n|r", -- [1]
		},
		["gtData"] = {
			["버징기-줄진"] = "NONE",
		},
		["gtTime"] = {
			["버징기-줄진"] = "2014/12/18 05:02:04",
		},
		["unitframe"] = {
			["aurafilters"] = {
				["Blacklist"] = {
					["type"] = "Whitelist",
				},
			},
			["buffwatch"] = {
				["WARLOCK"] = {
				},
			},
		},
		["screenwidth"] = 1440,
	},
	["profiles"] = {
		["나라잃은토템 - 줄진"] = {
			["currentTutorial"] = 1,
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM106180",
				["PetAB"] = "RIGHTElvUIParentRIGHT-800",
				["ElvUF_FocusMover"] = "BOTTOMElvUIParentBOTTOM310332",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["ElvUF_RaidMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4195",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-106180",
				["ElvAB_4"] = "RIGHTElvUIParentRIGHT-40",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM-106120",
				["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM072",
				["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4225",
				["ElvAB_5"] = "RIGHTElvUIParentRIGHT-380",
				["ElvAB_1"] = "BOTTOMElvUIParentBOTTOM04",
				["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM106120",
			},
			["AuraWatch"] = {
				["loadDefault"] = true,
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["Name"] = "CC",
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Interval"] = 10,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["Name"] = "발동류",
						["List"] = {
							{
								["AuraID"] = 16246,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 77762,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 118522,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 53390,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 126649,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 126599,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 126554,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 126690,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126707,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126605,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 126683,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 126705,
								["UnitID"] = "player",
							}, -- [13]
							{
								["AuraID"] = 126659,
								["UnitID"] = "player",
							}, -- [14]
							{
								["AuraID"] = 126577,
								["UnitID"] = "player",
							}, -- [15]
							{
								["AuraID"] = 126588,
								["UnitID"] = "player",
							}, -- [16]
							{
								["AuraID"] = 125489,
								["UnitID"] = "player",
							}, -- [17]
							{
								["AuraID"] = 118334,
								["UnitID"] = "player",
							}, -- [18]
							{
								["AuraID"] = 104993,
								["UnitID"] = "player",
							}, -- [19]
							{
								["AuraID"] = 125487,
								["UnitID"] = "player",
							}, -- [20]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["Name"] = "영심류",
						["List"] = {
							{
								["AuraID"] = 53817,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 30823,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 324,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 16166,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 114050,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 79206,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 73683,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 73685,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 31616,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 114893,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 108281,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 108271,
								["UnitID"] = "player",
							}, -- [12]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["Name"] = "대상Debuffs",
						["List"] = {
							{
								["AuraID"] = 17364,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [1]
							{
								["AuraID"] = 8056,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [2]
							{
								["AuraID"] = 8050,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [3]
							{
								["AuraID"] = 77661,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [4]
							{
								["AuraID"] = 64695,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [5]
							{
								["AuraID"] = 76780,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [6]
						},
						["Interval"] = 4,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
			},
			["hideTutorial"] = true,
			["auras"] = {
				["wrapAfter"] = 10,
			},
			["general"] = {
				["valuecolor"] = {
					["b"] = 0.819,
					["g"] = 0.513,
					["r"] = 0.09,
				},
				["experience"] = {
					["width"] = 10,
				},
				["reputation"] = {
					["width"] = 10,
				},
			},
			["unitframe"] = {
				["fontSize"] = 10,
				["colors"] = {
					["castColor"] = {
						["b"] = 0.31,
						["g"] = 0.31,
						["r"] = 0.31,
					},
				},
				["units"] = {
					["player"] = {
						["health"] = {
							["text_format"] = "[healthcolor][health:current]",
						},
						["castbar"] = {
							["width"] = 200,
						},
						["width"] = 200,
						["classbar"] = {
							["fill"] = "fill",
						},
						["aurabar"] = {
							["auraBarWidth"] = 200,
						},
					},
					["party"] = {
						["startOutFromCenter"] = true,
					},
					["targettarget"] = {
						["height"] = 26,
						["debuffs"] = {
							["enable"] = false,
						},
						["width"] = 200,
						["power"] = {
							["enable"] = false,
						},
					},
					["arena"] = {
						["width"] = 200,
						["castbar"] = {
							["width"] = 200,
						},
					},
					["target"] = {
						["castbar"] = {
							["width"] = 200,
						},
						["width"] = 200,
						["health"] = {
							["text_format"] = "[healthcolor][health:current]",
						},
						["aurabar"] = {
							["auraBarWidth"] = 200,
						},
					},
					["raid"] = {
						["startOutFromCenter"] = true,
					},
					["pet"] = {
						["height"] = 26,
						["width"] = 200,
						["power"] = {
							["enable"] = false,
						},
					},
					["boss"] = {
						["width"] = 200,
						["castbar"] = {
							["width"] = 200,
						},
					},
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Spell/Heal Power",
						["right"] = "Haste",
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttons"] = 12,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar1"] = {
					["heightMult"] = 3,
				},
				["bar5"] = {
					["buttonsPerRow"] = 1,
					["backdrop"] = false,
					["buttons"] = 12,
				},
				["euiabstyle"] = "Low",
				["bar4"] = {
					["widthMult"] = 2,
				},
			},
			["layoutSet"] = "dpsCaster",
			["bags"] = {
				["point"] = {
					["ElvUI_ContainerFrame"] = {
						["p4"] = -374.000549316406,
						["p3"] = "BOTTOMRIGHT",
						["p5"] = 17.0000953674316,
						["p1"] = "BOTTOMRIGHT",
					},
				},
			},
			["convertExp"] = true,
			["lowresolutionset"] = true,
		},
		["버징기 - 줄진"] = {
			["currentTutorial"] = 1,
			["auras"] = {
				["wrapAfter"] = 10,
			},
			["bagsOffsetFixed"] = true,
			["movers"] = {
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM150182",
				["ShiftAB"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-218276",
				["PetAB"] = "RIGHTElvUIParentRIGHT-800",
				["ElvUF_RaidMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4195",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["ElvAB_1"] = "BOTTOMElvUIParentBOTTOM04",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-150182",
				["ElvAB_4"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-4214",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM-150114",
				["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM072",
				["ElvUF_PartyMover"] = "BOTTOMLEFTElvUIParentBOTTOMLEFT4225",
				["ElvAB_5"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-38214",
				["ElvUF_FocusMover"] = "BOTTOMElvUIParentBOTTOM310332",
				["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM150114",
			},
			["AuraWatch"] = {
				["loadDefault"] = true,
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["Name"] = "플레이어 디버프",
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Interval"] = 10,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["Name"] = "플레이어 중요한 이득",
						["List"] = {
							{
								["AuraID"] = 54149,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 88819,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 86678,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 114637,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 114250,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 85416,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 90174,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 87173,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 86700,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126646,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 126533,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 126597,
								["UnitID"] = "player",
							}, -- [13]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [14]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [15]
							{
								["AuraID"] = 126599,
								["UnitID"] = "player",
							}, -- [16]
							{
								["AuraID"] = 126679,
								["UnitID"] = "player",
							}, -- [17]
							{
								["AuraID"] = 126700,
								["UnitID"] = "player",
							}, -- [18]
							{
								["AuraID"] = 126605,
								["UnitID"] = "player",
							}, -- [19]
							{
								["AuraID"] = 126683,
								["UnitID"] = "player",
							}, -- [20]
							{
								["AuraID"] = 126705,
								["UnitID"] = "player",
							}, -- [21]
							{
								["AuraID"] = 126588,
								["UnitID"] = "player",
							}, -- [22]
							{
								["AuraID"] = 116660,
								["UnitID"] = "player",
							}, -- [23]
							{
								["AuraID"] = 125489,
								["UnitID"] = "player",
							}, -- [24]
							{
								["AuraID"] = 118335,
								["UnitID"] = "player",
							}, -- [25]
							{
								["AuraID"] = 104993,
								["UnitID"] = "player",
							}, -- [26]
							{
								["AuraID"] = 125487,
								["UnitID"] = "player",
							}, -- [27]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["Name"] = "플레이어 이득",
						["List"] = {
							{
								["AuraID"] = 642,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 84963,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 86698,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 105809,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 31884,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 31842,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 31850,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 498,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 54428,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 85499,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 114163,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 20925,
								["UnitID"] = "player",
							}, -- [12]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["Name"] = "대상 디버프",
						["List"] = {
							{
								["AuraID"] = 25771,
								["UnitID"] = "player",
								["Caster"] = "all",
							}, -- [1]
							{
								["AuraID"] = 31803,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [2]
							{
								["AuraID"] = 20170,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [3]
							{
								["AuraID"] = 2812,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [4]
							{
								["AuraID"] = 63529,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [5]
							{
								["AuraID"] = 110300,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [6]
						},
						["Interval"] = 4,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
			},
			["unitframe"] = {
				["fontSize"] = 10,
				["colors"] = {
					["castColor"] = {
						["b"] = 0.31,
						["g"] = 0.31,
						["r"] = 0.31,
					},
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["right"] = "Haste",
						["left"] = "Attack Power",
					},
				},
			},
			["lowresolutionset"] = true,
			["hideTutorial"] = true,
			["layoutSet"] = "dpsMelee",
			["general"] = {
				["valuecolor"] = {
					["b"] = 0.819,
					["g"] = 0.513,
					["r"] = 0.09,
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttons"] = 12,
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
				},
				["euiabstyle"] = "Low",
				["bar2"] = {
					["enabled"] = true,
				},
				["bar1"] = {
					["heightMult"] = 3,
				},
				["bar5"] = {
					["buttons"] = 12,
					["buttonsPerRow"] = 1,
					["backdrop"] = false,
				},
				["bar4"] = {
					["widthMult"] = 2,
				},
			},
		},
		["김롯리 - 줄진"] = {
			["currentTutorial"] = 1,
			["general"] = {
				["valuecolor"] = {
					["r"] = 0.09,
					["g"] = 0.513,
					["b"] = 0.819,
				},
				["stickyFrames"] = 1,
			},
			["movers"] = {
				["ElvUF_TargetMover"] = "BOTTOMLEFTElvUIParentBOTTOM210195",
				["ElvAB_6"] = "BOTTOMElvUIParentBOTTOM0106",
				["ElvUF_Raid40Mover"] = "BOTTOMElvUIParentBOTTOM0118",
				["ElvUF_Raid10Mover"] = "BOTTOMElvUIParentBOTTOM0118",
				["PetAB"] = "RIGHTElvUIParentRIGHT-800",
				["ElvUF_FocusMover"] = "BOTTOMElvUIParentBOTTOM310432",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["ElvUF_PartyMover"] = "BOTTOMElvUIParentBOTTOM0118",
				["ElvUF_PlayerMover"] = "BOTTOMRIGHTElvUIParentBOTTOM-210195",
				["ElvAB_4"] = "RIGHTElvUIParentRIGHT-40",
				["ElvUF_PetMover"] = "BOTTOMRIGHTElvUIParentBOTTOM-210125",
				["ElvUF_Raid25Mover"] = "BOTTOMElvUIParentBOTTOM0118",
				["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM072",
				["ElvAB_5"] = "BOTTOMElvUIParentBOTTOM0106",
				["ElvAB_1"] = "BOTTOMElvUIParentBOTTOM04",
				["ElvUF_TargetTargetMover"] = "BOTTOMLEFTElvUIParentBOTTOM210125",
			},
			["AuraWatch"] = {
				["loadDefault"] = true,
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["Name"] = "p_디버프",
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Interval"] = 10,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["Name"] = "p_발동류",
						["List"] = {
							{
								["AuraID"] = 46916,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 50227,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 122510,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 125831,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 12880,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 85739,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 86663,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 126646,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126533,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126597,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 126657,
								["UnitID"] = "player",
							}, -- [13]
							{
								["AuraID"] = 126599,
								["UnitID"] = "player",
							}, -- [14]
							{
								["AuraID"] = 126679,
								["UnitID"] = "player",
							}, -- [15]
							{
								["AuraID"] = 126700,
								["UnitID"] = "player",
							}, -- [16]
							{
								["AuraID"] = 116660,
								["UnitID"] = "player",
							}, -- [17]
							{
								["AuraID"] = 125489,
								["UnitID"] = "player",
							}, -- [18]
							{
								["AuraID"] = 118335,
								["UnitID"] = "player",
							}, -- [19]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["Name"] = "p_이득/버프",
						["List"] = {
							{
								["AuraID"] = 871,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 12975,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 55694,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 2565,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 112048,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 23920,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 18499,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 12292,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 1719,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 85730,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 12328,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 32216,
								["UnitID"] = "player",
							}, -- [12]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["Name"] = "대상_디버프",
						["List"] = {
							{
								["AuraID"] = 86346,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [1]
							{
								["AuraID"] = 1715,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [2]
							{
								["AuraID"] = 1160,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [3]
							{
								["AuraID"] = 113746,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [4]
							{
								["AuraID"] = 115798,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [5]
						},
						["Interval"] = 4,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
			},
			["hideTutorial"] = 1,
			["unitframe"] = {
				["fontSize"] = 10,
				["colors"] = {
					["castColor"] = {
						["r"] = 0.31,
						["g"] = 0.31,
						["b"] = 0.31,
					},
				},
				["units"] = {
					["party"] = {
						["startOutFromCenter"] = true,
					},
					["raid40"] = {
						["startOutFromCenter"] = true,
					},
					["raid10"] = {
						["startOutFromCenter"] = true,
					},
					["target"] = {
						["debuffs"] = {
							["enable"] = false,
						},
						["smartAuraDisplay"] = "SHOW_DEBUFFS_ON_FRIENDLIES",
						["aurabar"] = {
							["attachTo"] = "BUFFS",
						},
					},
					["raid25"] = {
						["startOutFromCenter"] = true,
					},
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Attack Power",
						["right"] = "Haste",
					},
				},
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttons"] = 12,
				},
				["bar6"] = {
					["backdrop"] = false,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar1"] = {
					["backdrop"] = false,
				},
				["euiabstyle"] = "Low",
				["bar5"] = {
					["point"] = "TOPLEFT",
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttons"] = 12,
				},
				["bar4"] = {
					["backdrop"] = false,
				},
			},
			["layoutSet"] = "dpsMelee",
		},
		["김곱충 - 줄진"] = {
			["currentTutorial"] = 6,
			["general"] = {
				["autoRepair"] = "GUILD",
				["valuecolor"] = {
					["r"] = 0.58,
					["g"] = 0.51,
					["b"] = 0.79,
				},
			},
			["movers"] = {
				["EuiInfoBar1Mover"] = "TOPElvUIParentTOP-113-2",
				["ElvUF_PlayerCastbarMover"] = "BOTTOMElvUIParentBOTTOM0144",
				["ElvAB_2"] = "BOTTOMElvUIParentBOTTOM038",
				["GMMover"] = "TOPLEFTElvUIParentTOPLEFT250-5",
				["ElvAB_4"] = "BOTTOMRIGHTElvUIParentBOTTOMRIGHT-4220",
				["BossButton"] = "BOTTOMElvUIParentBOTTOM0600",
				["ElvAB_5"] = "BOTTOMElvUIParentBOTTOM0106",
				["ElvUF_TargetMover"] = "BOTTOMElvUIParentBOTTOM278207",
				["ElvAB_6"] = "BOTTOMElvUIParentBOTTOM0108",
				["ElvAB_3"] = "BOTTOMElvUIParentBOTTOM072",
				["ReputationBarMover"] = "TOPElvUIParentTOP0-26",
				["EuiInfoBar3Mover"] = "TOPLEFTElvUIParentTOPLEFT2-2",
				["ElvUF_PetMover"] = "BOTTOMElvUIParentBOTTOM0184",
				["ElvUF_TargetTargetMover"] = "BOTTOMElvUIParentBOTTOM0224",
				["ElvUF_PlayerMover"] = "BOTTOMElvUIParentBOTTOM-278207",
				["ExperienceBarMover"] = "TOPElvUIParentTOP0-26",
				["EuiInfoBar4Mover"] = "TOPElvUIParentTOP0-2",
				["MinimapMover"] = "TOPRIGHTElvUIParentTOPRIGHT-3-3",
			},
			["bags"] = {
				["point"] = {
					["ElvUI_ContainerFrame"] = {
						["p1"] = "BOTTOMRIGHT",
						["p3"] = "BOTTOMRIGHT",
						["p5"] = 35.0000114440918,
						["p4"] = -9.00009441375732,
					},
				},
			},
			["hideTutorial"] = 1,
			["unitframe"] = {
				["colors"] = {
					["auraBarBuff"] = {
						["r"] = 0.58,
						["g"] = 0.51,
						["b"] = 0.79,
					},
					["castClassColor"] = true,
					["castColor"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["health"] = {
						["r"] = 0.1,
						["g"] = 0.1,
						["b"] = 0.1,
					},
					["healthclass"] = true,
				},
				["units"] = {
					["target"] = {
						["smartAuraDisplay"] = "SHOW_DEBUFFS_ON_FRIENDLIES",
						["buffs"] = {
							["playerOnly"] = {
								["friendly"] = true,
							},
						},
						["debuffs"] = {
							["enable"] = false,
						},
						["aurabar"] = {
							["attachTo"] = "BUFFS",
						},
					},
					["player"] = {
						["castbar"] = {
							["height"] = 28,
							["width"] = 406,
						},
					},
				},
			},
			["datatexts"] = {
				["panels"] = {
					["LeftChatDataPanel"] = {
						["left"] = "Spell/Heal Power",
						["right"] = "Haste",
					},
				},
			},
			["euiscript"] = {
				["afkspincamera"] = false,
				["combatnoti"] = false,
			},
			["layoutSet"] = "dpsCaster",
			["AuraWatch"] = {
				["loadDefault"] = true,
				["DB"] = {
					{
						["Direction"] = "RIGHT",
						["Name"] = "p_디버프",
						["List"] = {
							{
								["AuraID"] = 118,
								["UnitID"] = "player",
							}, -- [1]
						},
						["Interval"] = 10,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"CENTER", -- [1]
							"UIParent", -- [2]
							"CENTER", -- [3]
							-200, -- [4]
							200, -- [5]
						},
					}, -- [1]
					{
						["Direction"] = "RIGHT",
						["Name"] = "p_발동류",
						["List"] = {
							{
								["AuraID"] = 122355,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 117828,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 34936,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 108559,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 17941,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 126697,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 126605,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 126683,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 126705,
								["UnitID"] = "player",
							}, -- [9]
							{
								["AuraID"] = 126659,
								["UnitID"] = "player",
							}, -- [10]
							{
								["AuraID"] = 126577,
								["UnitID"] = "player",
							}, -- [11]
							{
								["AuraID"] = 104993,
								["UnitID"] = "player",
							}, -- [12]
							{
								["AuraID"] = 125487,
								["UnitID"] = "player",
							}, -- [13]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							55, -- [5]
						},
					}, -- [2]
					{
						["Direction"] = "RIGHT",
						["Name"] = "p_이득/버프",
						["List"] = {
							{
								["AuraID"] = 74434,
								["UnitID"] = "player",
							}, -- [1]
							{
								["AuraID"] = 113861,
								["UnitID"] = "player",
							}, -- [2]
							{
								["AuraID"] = 113860,
								["UnitID"] = "player",
							}, -- [3]
							{
								["AuraID"] = 113858,
								["UnitID"] = "player",
							}, -- [4]
							{
								["AuraID"] = 104773,
								["UnitID"] = "player",
							}, -- [5]
							{
								["AuraID"] = 110913,
								["UnitID"] = "player",
							}, -- [6]
							{
								["AuraID"] = 6229,
								["UnitID"] = "player",
							}, -- [7]
							{
								["AuraID"] = 86211,
								["UnitID"] = "player",
							}, -- [8]
							{
								["AuraID"] = 111400,
								["UnitID"] = "player",
							}, -- [9]
						},
						["Interval"] = 6,
						["Mode"] = "ICON",
						["IconSize"] = 42,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Player", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							12, -- [5]
						},
					}, -- [3]
					{
						["Direction"] = "RIGHT",
						["Name"] = "대상_디버프",
						["List"] = {
							{
								["AuraID"] = 1490,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [1]
							{
								["AuraID"] = 18223,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [2]
							{
								["AuraID"] = 109466,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [3]
							{
								["AuraID"] = 1098,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [4]
							{
								["AuraID"] = 63311,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [5]
							{
								["AuraID"] = 93068,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [6]
							{
								["AuraID"] = 24844,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [7]
							{
								["AuraID"] = 34889,
								["UnitID"] = "target",
								["Caster"] = "all",
							}, -- [8]
							{
								["AuraID"] = 603,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [9]
							{
								["AuraID"] = 980,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [10]
							{
								["AuraID"] = 172,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [11]
							{
								["AuraID"] = 27243,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [12]
							{
								["AuraID"] = 348,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [13]
							{
								["AuraID"] = 30108,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [14]
							{
								["AuraID"] = 48181,
								["UnitID"] = "target",
								["Caster"] = "player",
							}, -- [15]
						},
						["Interval"] = 4,
						["Mode"] = "ICON",
						["IconSize"] = 48,
						["Pos"] = {
							"BOTTOMLEFT", -- [1]
							"ElvUF_Target", -- [2]
							"TOPLEFT", -- [3]
							0, -- [4]
							68, -- [5]
						},
					}, -- [4]
				},
			},
			["chatfilter"] = {
				["noprofanityFilter"] = true,
				["ScanFriend"] = false,
			},
			["actionbar"] = {
				["bar3"] = {
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttons"] = 12,
				},
				["bar2"] = {
					["enabled"] = true,
				},
				["bar1"] = {
					["backdrop"] = false,
				},
				["bar5"] = {
					["buttonsPerRow"] = 12,
					["backdrop"] = false,
					["buttons"] = 12,
				},
				["barPet"] = {
					["backdrop"] = false,
				},
				["bar4"] = {
					["backdrop"] = false,
				},
			},
		},
	},
}
ElvPrivateDB = {
	["profileKeys"] = {
		["나라잃은토템 - 줄진"] = "나라잃은토템 - 줄진",
		["버징기 - 줄진"] = "버징기 - 줄진",
		["김롯리 - 줄진"] = "김롯리 - 줄진",
		["김곱충 - 줄진"] = "김곱충 - 줄진",
	},
	["profiles"] = {
		["나라잃은토템 - 줄진"] = {
			["theme"] = "classic",
			["install_complete"] = "7.57",
		},
		["버징기 - 줄진"] = {
			["theme"] = "classic",
			["install_complete"] = "7.64",
		},
		["김롯리 - 줄진"] = {
			["theme"] = "classic",
			["install_complete"] = "6.87",
		},
		["김곱충 - 줄진"] = {
			["theme"] = "class",
			["install_complete"] = "6.79",
		},
	},
}
