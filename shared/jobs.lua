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
                payment = 10
            },
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
                payment = 50
            },
			['1'] = {
                name = 'Officer.',
                payment = 75
            },
			['2'] = {
                name = 'Sr. Officer.',
                payment = 100
            },
			['3'] = {
                name = 'Trooper.',
                payment = 125
            },
			['4'] = {
                name = 'Detective.',
                payment = 150
            },
            ['5'] = {
                name = 'Sergeant.',
                payment = 150
            },
            ['6'] = {
                name = 'Lieutenant.',
                payment = 150
            },
            ['7'] = {
                name = 'Captain.',
                payment = 150
            },
            ['8'] = {
                name = 'Commander.',
                payment = 150
            },
            ['9'] = {
                name = 'Deputy Chief.',
                payment = 150
            },
            ['10'] = {
                name = 'Assistant Chief.',
                payment = 150,
                isboss = true
            },
            ['11'] = {
                name = 'Chief.',
                payment = 150,
                isboss = true
            },
            ['12'] = {
                name = 'Commissioner.',
                payment = 150,
                isboss = true
            },
            ['13'] = {
                name = 'Sheriff.',
                payment = 150,
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
                payment = 50
            },
			['1'] = {
                name = 'EMT.',
                payment = 75
            },
			['2'] = {
                name = 'Advanced EMT.',
                payment = 100
            },
			['3'] = {
                name = 'Paramedic',
                payment = 125
            },
			['4'] = {
                name = 'Critical Care Paramedic.',
                payment = 150
            },
            ['5'] = {
                name = 'Administrator',
                isboss = true,
                payment = 150
            },
            ['6'] = {
                name = 'Chief of Medicine',
                isboss = true,
                payment = 150
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
                payment = 50
            },
			['1'] = {
                name = 'House Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Broker',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
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
                payment = 50
            },
			['1'] = {
                name = 'Cabby',
                payment = 75
            },
			['2'] = {
                name = 'Experienced',
                payment = 100
            },
			['3'] = {
                name = 'Uber Cabby',
                payment = 125
            },
			['4'] = {
                name = 'Lead Cabby',
				isboss = true,
                payment = 150
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
                payment = 50
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
                payment = 50
            },
			['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
			['2'] = {
                name = 'Business Sales',
                payment = 100
            },
			['3'] = {
                name = 'Finance',
                payment = 125
            },
			['4'] = {
                name = 'Manager',
				isboss = true,
                payment = 150
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
                payment = 50
            },
			['1'] = {
                name = 'Novice.',
                payment = 75
            },
			['2'] = {
                name = 'Experienced.',
                payment = 100
            },
			['3'] = {
                name = 'Leader.',
                payment = 125
            },
			['4'] = {
                name = 'Boss.',
				isboss = true,
                payment = 150
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
                payment = 100
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
                payment = 50
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
                payment = 50
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
                payment = 50
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
                payment = 50
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
                payment = 50
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
                payment = 50
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
                payment = 50
            },
        },
        whitelist = false
	},
}