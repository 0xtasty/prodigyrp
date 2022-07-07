config = {
    TempoParaAceitarConvite = 5000,

    ["ImgInterações"] = {
        ["INTERAÇÕES"] = "interacao",
        ["ESTILO DE ANDAR"] = "estilo_andar",
        ["SOCIAL"] = "social",
        ["DANÇAS"] = "danca",
        ["OBJETOS"] = "objeto",
        ["OUTROS"] = "outros",
    },
    ["Interações"] = {
        {"INTERAÇÕES", "interacao"},
        {"ESTILO DE ANDAR", "estilo_andar"},
        {"SOCIAL", "social"},
        {"DANÇAS", "danca"},
        {"OBJETOS", "objeto"},
        {"OUTROS", "outros"},
    },
    ["Animations"] = {
        ["INTERAÇÕES"] = {
            {"Cruzar os braços", "cruzar", {"Ações", "Cruzar Braços", 500, false, false, true}, 'Custom'},
            {"Rendido 2", "cieagaegn2", {"Ações", "Render 2", 500, false, false, true}, 'Custom'},
            {"Rendido 3", "ciagadgdn3", {"Ações", "Render 3", 500, false, false, true}, 'Custom'},
            {"Rendido", "igvevavn", {"Ações", "Render", 500, false, false, true}, 'Custom'},
            {"Comprimentar", "inageag2", {"GANGS", "hndshkaa", -1, true, false, false}, 'Padrao'},
            {"Comprimentar 2", "iaegagn3", {"GANGS", "hndshkba", -1, true, false, false}, 'Padrao'},
            {"Conversando", "indsadva4", {"GANGS", "prtial_gngtlkA", -1, true, false, false}, 'Padrao'},
            {"Conversando 2", "inaeabeb5", {"GANGS", "prtial_gngtlkB", -1, true, false, false}, 'Padrao'},
            {"Empurrão", "ineagaeg6", {"GANGS", "shake_cara", -1, true, false, false}, 'Padrao'},
            {"Flexão", "ieagaegn7", {"flexao", "flexao", -1, true, false, false}, 'IFP'},
            {"Abdominal", "inaegaega8", {"abdominal", "abdominal", -1, true, false, false}, 'IFP'},
            {"Continência", "ingavva9", {"continencia", "continencia", -1, true, false, false}, 'IFP'},
        },
        ["ESTILO DE ANDAR"] = {
            {"Padrão", "ws1aegag", 0},
            {"Padrão 2", "wseagaegaegf2", 56},
            {"Bebado", "weafgaegas3", 126},
			{"Gordo", "ws4abaeebvaeg", 55},
			{"Gordo 2", "wfwFwws5", 124},
			{"Gang", "wgeageagaes6", 121},
			{"Idoso", "wsbfbsvfea7", 120},
			{"Idoso 2", "wefeaegeags8", 123},
			{"SWAT", "wsrgaegaegeag9", 128},
			{"Feminino", "wgaegaefgeas10", 129},
			{"Feminino 2", "wsggadv11", 131},
			{"Feminino 3", "wsdfsdvs12", 132},
			{"Feminino 4", "wsgvsdvss13", 136}
        },
        ["SOCIAL"] = {
            {"Triste", "sccdageafg", {"Interações", "Triste", 500, false, false, true}, 'Custom'},
            {"Pensando", "sceagaegc2", {"Interações", "Pensativo 2", 500, false, false, true}, 'Custom'},
            {"Fumando", "saegaec2", {"SMOKING", "M_smkstnd_loop", -1, true, false, false}, 'Padrao'},
            {"Fumando 2", "sgaegc3", {"LOWRIDER", "M_smkstnd_loop", -1, true, false, false}, 'Padrao'},
            {"Fumando 3", "saegadc4", {"GANGS", "smkcig_prtl", -1, true, false, false}, 'Padrao'},
            {"Esperando", "sgeagc5", {"COP_AMBIENT", "Coplook_loop", -1, true, false, false}, 'Padrao'},
            {"Esperando 2", "scgdaaga6", {"COP_AMBIENT", "Coplook_shake", -1, true, false, false}, 'Padrao'},
            {"Comemorando", "scaegae7", {"CASINO", "manwinb", -1, true, false, false}, 'Padrao'},
            {"Comemorando 2", "svadbc8", {"CASINO", "manwind", -1, true, false, false}, 'Padrao'},
            {"Cansado", "svgagbc9", {"FAT", "idle_tired", -1, true, false, false}, 'Padrao'},
            {"Rindo", "sc1eagaeg0", {"RAPPING", "Laugh_01", -1, true, false, false}, 'Padrao'}
        },
        ["DANÇAS"] = {
			{"Dança", "daaegeagnce1", {"DANCING", "dance_loop", -1, true, false, false}, 'Padrao'},
            {"Dança 2", "dasfbsnce2", {"DANCING", "DAN_Down_A", -1, true, false, false}, 'Padrao'},
            {"Dança 3", "danadvce3", {"DANCING", "DAN_Left_A", -1, true, false, false}, 'Padrao'},
            {"Dança 4", "danadvdsvce4", {"DANCING", "DAN_Right_A", -1, true, false, false}, 'Padrao'},
            {"Dança 5", "dancafaefve5", {"DANCING", "DAN_Up_A", -1, true, false, false}, 'Padrao'},
            {"Dança 6", "dandvadvadvce6", {"DANCING", "dnce_M_a", -1, true, false, false}, 'Padrao'},
            {"Dança 7", "dancadvadve7", {"DANCING", "dnce_M_b", -1, true, false, false}, 'Padrao'},
            {"Dança 8", "dancaefeave8", {"DANCING", "dnce_M_c", -1, true, false, false}, 'Padrao'},
            {"Dança 9", "dancvdavade9", {"DANCING", "dnce_M_d", -1, true, false, false}, 'Padrao'},
            {"Dança 10", "daneqvaefce10", {"DANCING", "dnce_M_e", -1, true, false, false}, 'Padrao'},
            {"Dança 11", "danaeaveace11", {"fortnite1", "baile 1", -1, true, false, false}, 'IFP'},
            {"Dança 12", "danvdavace12", {"fortnite1", "baile 2", -1, true, false, false}, 'IFP'},
            {"Dança 13", "danagadvce13", {"fortnite1", "baile 3", -1, true, false, false}, 'IFP'},
            {"Dança 14", "efaegea", {"fortnite1", "baile 4", -1, true, false, false}, 'IFP'},
            {"Dança 15", "dancdvaefe15", {"fortnite1", "baile 5", -1, true, false, false}, 'IFP'},
            {"Dança 16", "dancefavavaee16", {"fortnite1", "baile 6", -1, true, false, false}, 'IFP'},
            {"Dança 17", "danceafawfe17", {"fortnite2", "baile 7", -1, true, false, false}, 'IFP'},
            {"Dança 18", "dancevsdbfs18", {"fortnite2", "baile 8", -1, true, false, false}, 'IFP'},
            {"Dança 19", "dancegragea19", {"fortnite3", "baile 9", -1, true, false, false}, 'IFP'},
            {"Dança 20", "dancegaege20", {"fortnite3", "baile 10", -1, true, false, false}, 'IFP'},
            {"Dança 21", "danfagvavce21", {"fortnite3", "baile 11", -1, true, false, false}, 'IFP'},
            {"Dança 22", "dancggeavaeve22", {"fortnite3", "baile 12", -1, true, false, false}, 'IFP'},
            {"Dança 23", "dancgfsgage23", {"fortnite3", "baile 13", -1, true, false, false}, 'IFP'},
            {"Dança 24", "danceeafeF24", {"breakdance1", "break_D", -1, true, false, false}, 'IFP'},
            {"Dança 25", "hwgeag", {"breakdance2", "FightA_1", -1, true, false, false}, 'IFP'},
            {"Dança 26", "dancsdvsdve26", {"breakdance2", "FightA_2", -1, true, false, false}, 'IFP'},
            {"Dança 27", "danefeageace27", {"breakdance2", "FightA_3", -1, true, false, false}, 'IFP'},
            {"Dança 28", "danceageagaee28", {"newAnims", "dance1", -1, true, false, false}, 'IFP'},
            {"Dança 29", "dangaevgaedecfce29", {"newAnims", "dance2", -1, true, false, false}, 'IFP'},
            {"Dança 30", "dandvgadfce30", {"newAnims", "dance3", -1, true, false, false}, 'IFP'},
            {"Dança 31", "dancdvave31", {"newAnims", "dance4", -1, true, false, false}, 'IFP'},
            {"Dança 32", "daneavaeve32", {"newAnims", "dance5", -1, true, false, false}, 'IFP'},
            {"Dança 33", "dancaevgaee33", {"newAnims", "dance6", -1, true, false, false}, 'IFP'},
            {"Dança 34", "danavevaece34", {"newAnims", "dance7", -1, true, false, false}, 'IFP'},
            {"Dança 35", "dancfeafaefe35", {"newAnims", "dance8", -1, true, false, false}, 'IFP'}
        },
        ["OBJETOS"] = {
            {"Caixa", "eageagoc2", {"Ações", "Segurando caixa", 500, false, false, true}, 'Custom'},
            {"Buquê", "eageagoc3", {"Ações", "Segurar buquê", 500, false, false, true}, 'Custom'},
            {"Prancha", "eageagoc4", {"Ações", "Segurar prancha", 500, false, false, true}, 'Custom'},
            {"Guarda-Chuvas", "eageagoc5", {"Ações", "Segurar guarda chuvas", 500, false, false, true}, 'Custom'},
            {"Câmera", "eageagoc6", {"Ações", "Segurando camera", 500, false, false, true}, 'Custom'},
            {"Prancheta", "eageagoc7", {"Ações", "Segurando prancheta", 500, false, false, true}, 'Custom'},
            {"Maleta", "eageagoc8", {"Ações", "Segurando maleta", 500, false, false, true}, 'Custom'},
        },
        ["OUTROS"] = {
            {"Santo", "con9egaegeaf", {"Interações", "Santo", 500, false, false, true}, 'Custom'},
            {"Assobiar", "ceadegaegon10", {"Ações", "Assobiar", 600, false, false, false}, 'Custom'},
            {"Falando radinho", "egeagcon", {"Ações", "Falando radinho", 500, false, false, true}, 'Custom'},
            {"Segurando arma", "conageag2", {"Ações", "Segurar arma", 500, false, false, true}, 'Custom'},
            {"Segurando arma 2", "csdgadgon3", {"Ações", "Segurar arma 2", 500, false, false, true}, 'Custom'},
            {"Segurando revolver", "cageagon4", {"Ações", "Segurar pistola", 500, false, false, true}, 'Custom'},
            {"Meditando", "crsghraegon8", {"Interações", "Meditando", 800, false, false, true}, 'Custom'},
			{"Levantar", "orsghraegh", {"INT_HOUSE", "wash_up", -1, true, false, false}, 'Padrao'},
            {"Sentar", "sentar", {"INT_HOUSE", "LOU_Loop", -1, true, false, false}, 'Padrao'},
            {"Sentar 2", "sentar2", {"INT_HOUSE", "LOU_In", -1, false, false, false}, 'Padrao'},
            {"Sentar 3", "sentar3", {"ped", "SEAT_idle", -1, true, false, false}, 'Padrao'},
            {"Deitar", "orsghraesghrshrshgh6", {"CRACK", "crckidle2", -1, true, false, false}, 'Padrao'},
            {"Deitar 2", "orsghraegh7", {"CRACK", "crckidle4", -1, true, false, false}, 'Padrao'},
            {"Cartão", "orsghraegh8", {"HEIST9", "Use_SwipeCard", -1, true, false, false}, 'Padrao'},
			{"Assustado", "orsghraegh9", {"ped", "cower", -1, true, false, false}, 'Padrao'},
			{"Mijando", "orsghraegh11", {"PAULNMAC", "Piss_out", -1, true, false, false}, 'Padrao'}
        },
    },
}

CUSTOM_ANIMATIONS = {
    ['Ações'] = {
        ['Cruzar Braços'] = {
            BonesRotation = {
                [32] = {0, -110, 25},
                [33] = {0, -100, 0},
                [34] = {-75, 0, -40},
                [22] = {0, -90, -25},
                [23] = {0, -100, 0},
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
        },
        ['Falando radinho'] = {
            BonesRotation = {
                [5] = {0, 0, -30},
                [32] = {-30, -30, 50},
                [33] = {0, -160, 0},
                [34] = {-120, 0, 0}
            },
            skipAnimation = true,
        },
        ['Render'] = {
            BonesRotation = {
                [22] = {0, -15, 60},
                [32] = {0, -10, -60},
                [23] = {80, -10, 120},
                [33] = {-80, -10, -120},
                [5] = {0, 8, 0}
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
        },
        ['Render 2'] = {
            BonesRotation = {
                [22] = {-30, -55, 30},
                [23] = {10, -20, 60},
                [24] = {120, 0, 0},
                [25] = {0, 0, 0},
                [26] = {0, 0, 0},
                [32] = {-30, -55, -30},
                [33] = {-10, -80, -30},
                [34] = {-70, 0, 0},
                [35] = {0, 0, 0},
                [36] = {0, 0, 0},
                [5] = {0, 8, 0}
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
        },
        ['Render 3'] = {
            BonesRotation = {
                [22] = {0, -15, 70},
                [32] = {0, -10, -60},
                [23] = {80, -10, 130},
                [33] = {-80, -10, -130},
                [5] = {0, -20, 0}
            },

            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
        },
        ['Segurar arma'] = {
            BonesRotation = {
                [23] = {-10, -100, 10},
                [24] = {120, 10, -50},
                [32] = {0, 0, 60},
                [33] = {0, -45, 35},
            },
            blockAttack = true,
            blockVehicle = true,
        },
        ['Segurar arma 2'] = {
            BonesRotation = {
                [5] = {0, 0, 0},
                [22] = {80, 0, 0},
                [23] = {0, -160, 0},
                [32] = {0, 0, 70},
                [33] = {0, -10, 20},
                [34] = {-80, 0, 0},
            },
            blockAttack = true,
            blockVehicle = true,
        },
        ['Segurar pistola'] = {
            BonesRotation = {
                [22] = {0, -30, -35},
                [23] = {20, -125, -10},
                [24] = {90, 40, -10},
                [32] = {-5, -70, 60},
                [33] = {-70, -90, -5},
            },
            blockAttack = true,
            blockVehicle = true,
        },
        ['Equipar máscara'] = {
            BonesRotation = {
                [22] = {0, -80, -5},
                [23] = {0, -125, 30},
                [24] = {160, 0, 0},
            },
            blockAttack = true,
        },
        ['Equipar óculos'] = {
            BonesRotation = {
                [5] = {10, 5, 0},
                [22] = {0, -80, -5},
                [23] = {0, -155, 50},
                [24] = {60, 0, 0},
                [32] = {0, -80, 5},
                [33] = {0, -155, -55},
                [34] = {-60, 0, 0},
            },
            blockAttack = true,
        },

        ['Equipar bolsa'] = {
            BonesRotation = {
                [22] = {0, -35, -30},
                [23] = {0, -140, -10},

                [32] = {0, -35, 30},
                [33] = {0, -140, 10},
            },
            blockAttack = true,
            blockJump = true,
        },
        ['Segurar escudo'] = {
            BonesRotation = {
                [201] = {0, 0, 0},
                [32] = {-80, -100, 13},
                [33] = {-10, -10, 80},
            },
            onDuck = {
                [201] = {0, 0, 0},
                [32] = {-100, -15, -25},
                [33] = {35, 50, 110},
                [34] = {-30, 0, 0},
            },
            blockVehicle = true,
        },

        ['Colocar capacete'] = {
            BonesRotation = {
                [5] = {0, 20, 0},
                [22] = {0, -90, 0},
                [23] = {50, -170, 60},
                [24] = {0, 0, 0},
                [25] = {-40, 0, 0},
                [32] = {0, -110, 0},
                [33] = {0, -170, -55},
                [34] = {0, 0, 0},
                [35] = {40, 0, 0},
            },
            blockAttack = true,
            Sound = {
                File = 'capacete',
                MaxDistance = 10,
                Volume = 0.2,
            },
        },

        ['Segurando garrafa'] = {
            BonesRotation = {
                [32] = {30, -20, 60},
                [33] = {0, -90, 0},
                [34] = {-90, 0, 0},
                [35] = {-10, 0, 0},
            },
            onDuck = {
                [32] = {-30, 0, 60},
                [33] = {0, -90, 0},
                [34] = {-90, 0, 0},
                [35] = {-10, 0, 0},
            },
            Object = {
                Model = 1484,
                Offset = {34, 0.07, 0.03, 0.05, 0, -180, 0},
                Scale = 0.9,
            },
        },
        ['Segurando prancheta'] = {
            BonesRotation = {
                [5] = {0, 5, 0},
                [32] = {-10, -60, 20},
                [33] = {-30, -80, 0},

                [34] = {-120, 0, 0},
                [35] = {-40, 30, -10},
            },
            onDuck = {
                [5] = {0, -30, 0},
                [32] = {-10, -20, -5},
                [33] = {-40, -90, 0},

                [34] = {-140, 0, 0},
                [35] = {-40, 30, -10},
            },
            Object = {
                Model = 1933,
                Offset = {35, 0.07, 0.065, 0.005, -80, -80, -100},
            },
            blockJump = true,
        },
        ['Segurando maleta'] = {
            BonesRotation = {},
            Object = {
                Model = 1934,
                Offset = {35, 0.05, -0.10, 0.1, -90, -40, -70},
                Scale = 0.7,
            }
        },
        ['Segurar buquê'] = {
            BonesRotation = {
                [32] = {30, -20, 60},
                [33] = {0, -90, 0},
                [34] = {-90, 0, 0},
                [35] = {-10, 0, 0},
            },
            
            onDuck = {
                [32] = {-90, -30, -10},
                [33] = {0, -90, 0},
                [34] = {-95, 30, 0},
                [35] = {-10, 0, 0},
            },
            Object = {
                Model = 325,
                Offset = {34, 0.01, 0.03, 0.05, 0, -200, 0},
                Scale = 0.9,
            },
        },
        ['Segurar guarda chuvas'] = {
            BonesRotation = {
                [32] = {30, -20, 60},
                [33] = {0, -90, 0},
                [34] = {-80, -30, 0},
                [35] = {-30, 0, 0},
            },
            onDuck = {
                [32] = {30, -20, 10},
                [33] = {0, -80, -80},
                [34] = {-90, -30, 0},
                [35] = {-30, 0, 0},
            },
            Object = {
                Model = 14864,
                Offset = {34, 0.05, 0.03, 0.05, 0, -210, 30},
                Scale = 0.9,
            },

            blockJump = true,
            blockVehicle = true,
        },

        ['Segurar prancha'] = {
            BonesRotation = {
                [32] = {30, -20, 40},
                [33] = {0, -60, 30},
                [34] = {-130, 0, 0}
            },
            Object = {
                Model = 2404,
                Offset = {33, 0.2, -0.02, 0.08, 0, -160, -20},
                Scale = 0.7,
            },
            blockDuck = true,
            blockJump = true,
            blockVehicle = true,
        },

        ['Segurando caixa'] = {
            BonesRotation = {
                [22] = {60, -30, -70},
                [23] = {-10, -70, -50},
                [24] = {160, 0, 0},
                [25] = {0, -10, 0},
                [32] = {-60, -40, 70},
                [33] = {10, -70, 50},
                [34] = {-160, 0, 0},
                [35] = {0, -10, 0},
                [201] = {0, 0, 0},
            },

            onDuck = {
                [22] = {60, -30, 0},
                [23] = {-10, -70, -50},
                [24] = {160, 0, 0},
                [25] = {0, -10, 0},
                [32] = {-60, -40, 0},
                [33] = {10, -70, 50},
                [34] = {-160, 0, 0},
                [35] = {0, -10, 0},
                [201] = {0, 0, 0},
            },
            Object = {
                Model = 2912,
                Offset = {24, 0, 0.4, 0, 0, 120, 10},
                Scale = 0.5,
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
        },
        ['Assobiar'] = {
            BonesRotation = {
                [32] = {-90, -70, 0},
                [33] = {10, 30, 125},
            },
            Sound = {
                File = 'assobio',
                MaxDistance = 50,
            },
        },
        ['Segurando camera'] = {
            BonesRotation = {
                [22] = {0, -60, 0},
                [23] = {80, -90, 80},
                [24] = {80, 30, 0},

                [32] = {0, -85, 10},
                [33] = {-70, -100, -20},
            },
            onDuck = {
                [22] = {0, -80, 0},
                [23] = {80, -70, 80},
                [24] = {90, 30, 0},

                [32] = {0, 0, 10},
                [33] = {-70, -100, -20},
                [34] = {-20, 0, 0},
            },
            Object = {
                Model = 367,
                Offset = {24, 0.45, 0.05, -0.05, 50, -5, -30},
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
        }
    },
    ['Interações'] = {
        ['Triste'] = {
            BonesRotation = {
                [5] = {0, 20, 0}
            }
        },
        ['Pensativo 2'] = {
            BonesRotation = {
                [5] = {0, 8, 0},
                [32] = {0, -110, 25},
                [33] = {0, -100, 0},
                [22] = {60, -95, -30},
                [23] = {8, -135, 8}
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
        },
        ['Santo'] = {
            BonesRotation = {
                [32] = {0, -60, 60},
                [33] = {0, -60, 20},
                [34] = {-100, 0, 0},
                [22] = {0, -40, -60},
                [23] = {0, -70, -30},
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
            blockDuck = true,
        },
        ['Meditando'] = {
            BonesRotation = {
                [22] = {30, -60, -45},
                [23] = {20, -60, 40},
                [24] = {-220, 0, 0},
                [32] = {-30, -60, 45},
                [33] = {20, -60, -40},
                [34] = {-220, 0, 0},
            },
            blockAttack = true,
            blockJump = true,
            blockVehicle = true,
            blockDuck = true,
        },
    }
}

IFPS = {
	"abdominal",
	"breakdance1",
	"breakdance2",
	"continencia",
	"flexao",
	"fortnite1",
	"fortnite2",
	"fortnite3",
	"newAnims",
	"render",
    "sex",
}

Ossos = {
    0, 1, 2, 3, 4, 5, 6, 7, 8, 21,--NÃO MECHER
    22, 23, 24, 25, 26, 31, 32, 33,--NÃO MECHER
    34, 35, 36, 41, 42, 43, 44, 51, --NÃO MECHER
    52, 53, 54, 201, 301, 302 --NÃO MECHER
}

notifyS = function(player, message, tipo)
    --exports['FR_DxMessages']:addBox(player, message, tipo)
end