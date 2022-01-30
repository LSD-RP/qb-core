QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.Jobs = {
	['unemployed'] = {
		label = 'Civilian',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Freelancer',
                payment = 600
            },
        },
        whitelist = false,
	},
    ['offduty'] = {
        label = 'Off Duty',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Off Duty',
                payment = 600,
            }
        },
        whitelist = false,
    },
	['police'] = {
		label = 'Law Enforcement',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit.',
                payment = 1450
            },
			['1'] = {
                name = 'Officer.',
                payment = 1500
            },
			['2'] = {
                name = 'Sr. Officer.',
                payment = 1600
            },
			['3'] = {
                name = 'Trooper.',
                payment = 1700
            },
			['4'] = {
                name = 'Detective.',
                payment = 1800
            },
            ['5'] = {
                name = 'Sergeant.',
                payment = 1900
            },
            ['6'] = {
                name = 'Lieutenant.',
                payment = 150
            },
            ['7'] = {
                name = 'Captain.',
                payment = 2000
            },
            ['8'] = {
                name = 'Commander.',
                payment = 2100
            },
            ['9'] = {
                name = 'Deputy Chief.',
                payment = 2250
            },
            ['10'] = {
                name = 'Assistant Chief.',
                payment = 2500,
                isboss = true
            },
            ['11'] = {
                name = 'Chief.',
                payment = 2500,
                isboss = true
            },
            ['12'] = {
                name = 'Commissioner.',
                payment = 2500,
                isboss = true
            },
            ['13'] = {
                name = 'Sheriff.',
                payment = 2000,
                isboss = true
            }
        },
        whitelist = true,
	},
	['ambulance'] = {
		label = 'EMS',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'EMR.',
                payment = 1950
            },
			['1'] = {
                name = 'EMT.',
                payment = 2000
            },
			['2'] = {
                name = 'Advanced EMT.',
                payment = 2250
            },
			['3'] = {
                name = 'Paramedic',
                payment = 2300
            },
			['4'] = {
                name = 'Critical Care Paramedic.',
                payment = 2500
            },
            ['5'] = {
                name = 'Administrator',
                isboss = true,
                payment = 2500
            },
            ['6'] = {
                name = 'Chief of Medicine',
                isboss = true,
                payment = 2500
            }
        },
        whitelist = true,
	},
	['realestate'] = {
		label = 'Real Estate',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 2000
            },
			['1'] = {
                name = 'House Sales',
                payment = 2100
            },
			['2'] = {
                name = 'Business Sales',
                payment = 2200

            },
			['3'] = {
                name = 'Broker',
                payment = 2300
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 2500
            },
        },
        whitelist = true,
	},
	['taxi'] = {
		label = 'Taxi',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1950
            },
			['1'] = {
                name = 'Cabby',
                payment = 2000
            },
			['2'] = {
                name = 'Experienced',
                payment = 2150
            },
			['3'] = {
                name = 'Uber Cabby',
                payment = 2250
            },
			['4'] = {
                name = 'Lead Cabby',
				isboss = true,
                payment = 2500
            },
        },
        whitelist = true,
	},
    ['bus'] = {
		label = 'Bus',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 1000
            },
		},
        whitelist = false
	},
	['cardealer'] = {
		label = 'Vehicle Dealer',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 1950
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 2000
            },
			['2'] = {
                name = 'Business Sales',
                payment = 2150
            },
			['3'] = {
                name = 'Finance',
                payment = 2250
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 2500
            },
        },
        whitelist = true
	},
	['mechanic'] = {
		label = 'Mechanic',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Recruit.',
                payment = 1950
            },
			['1'] = {
                name = 'Novice.',
                payment = 2000
            },
			['2'] = {
                name = 'Experienced.',
                payment = 2150
            },
			['3'] = {
                name = 'Leader.',
                payment = 2250
            },
			['4'] = {
                name = 'Boss.',
				isboss = true,
                payment = 2500
            },
        },
        whitelist = true
	},
	['judge'] = {
		label = 'Honorary',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Judge',
                payment = 2500
            },
        },
        whitelist = true,
	},
	['lawyer'] = {
		label = 'Law Firm',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Associate',
                payment = 2250
            },
        },
        whitelist = true
	},
	['reporter'] = {
		label = 'Reporter',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 1000
            },
        },
        whitelist = false,
	},
	['trucker'] = {
		label = 'Trucker',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 1000
            },
        },
        whitelist = false,
	},
	['tow'] = {
		label = 'Towing',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Driver',
                payment = 1000
            },
        },
        whitelist = false,
	},
	['garbage'] = {
		label = 'Garbage',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Collector',
                payment = 1000
            },
        },
        whitelist = false,
	},
	['vineyard'] = {
		label = 'Vineyard',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Picker',
                payment = 1000
            },
        },
        whitelist = false,
	},
	['hotdog'] = {
		label = 'Hotdog',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Sales',
                payment = 1000
            },
        },
        whitelist = false
	},
    ['burgershot'] = {
		label = 'Burgershot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cashier',
                payment = 1000
            },
            ['1'] = {
                name = 'Fry Cook',
                payment = 1250
            },
            ['2'] = {
                name = 'Manager',
                payment = 1500
            },
            ['3'] = {
                name = 'Big Shot',
                payment = 1750,
                isboss = true
            },
        },
        whitelist = true
	},
    ['bestbuds'] = {
		label = 'Weed Sales',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Promoter',
                payment = 1000
            },
            ['1'] = {
                name = 'Cashier',
                payment = 1250
            },
            ['2'] = {
                name = 'Grower',
                payment = 1500
            },
            ['3'] = {
                name = 'Boss',
                payment = 1750,
                isboss = true
            },
        },
        whitelist = true
	},
    ['butcher'] = {
		label = 'Meat Preparation',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Employee',
                payment = 1000
            },
		},
        whitelist = false
	},
    ['lumberjack'] = {
		label = 'Lumberjack',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Cutter',
                payment = 1000
            },
		},
        whitelist = false
	},
    ['taco'] = {
		label = 'Taco Sales',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Seller',
                payment = 1000
            },
		},
        whitelist = false
	},
}