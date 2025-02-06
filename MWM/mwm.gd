class_name mwm
extends Node

#Upgrades and Highscores
var level = {
	"landfill": {
		"level1": {
			"highscore": 0, 
		},
		"level2": {
			"highscore": 0, 
		},
		"level3": {
			"highscore": 0, 
		},
		"level4": {
			"highscore": 0, 
		},
		"level5": {
			"highscore": 0, 
		},
		"level6": {
			"highscore": 0, 
		},
		"level7": {
			"highscore": 0, 
		}
	},
	"slime": {
		"agar": {
			"highscore": 0,
		},
		"gum": {
			"highscore": 0,
		},
		"molasses": {
			"highscore": 0,
		},
		"oil": {
			"highscore": 0,
		},
		"hazardous_waste": {
			"highscore": 0,
		},
		"mercury": {
			"highscore": 0,
		},
		"antimatter": {
			"highscore": 0,
		}
	},
	"wurm": {
		"desert": {
			"highscore": 0,
			"wurm_size": 1, #Big Boned - Amount of segments on snake at the start
			"pear_points": 1, #Fibrous - Points per pear
			"hs_multiplier": 2, #Self Hype - Currency multiplier from HS
			"fruit_respawn": 16, #Botanist - Seconds for new spawn
			"pear_spawn_rate": 1, #Fruition - Amount of pear spawn
			"cactus_growth": 1000, #Epoch GMO - Time it takes for a pear to grow
			"less_walls": 5, #Migration - Less walls tile map, procedurally generated
			"wurm_speed": 0.6, #Balanced Tail - Speed in seconds
			"cinnamon_rate": 10.0, #The Spice Must Flow - Cinnamon every X points
			"size_points": 1.0, #Elder - Multiplier based on the size of the wurm
			"no_bounds": false, #Mirage Walker - Unlocks Sidewinder - Wraps around the sides instead of dieing
			"shift_position": false, #Sindewinder - Requires Mirage Walker - Will automatically shift over one when wrapping around
			"eat_cacti": false, #Keratin Papillae - Allows you to eat cacti
			"break_walls": false, #Annular Teeth - Allows you to go through walls
			"cannibalize": false, #Lizard Tails - Eating your tail doesn't kill you - Unlocks Ouroboros
			"ouroboros": false, #Ouroboros - Eating yourself gives points
		},
		"marsh": {
			"highscore": 0,
		},
		"mountain": {
			"highscore": 0,
		},
		"abyss": {
			"highscore": 0,
		},
		"hell": {
			"highscore": 0,
		},
		"heaven": {
			"highscore": 0,
		},
		"knowledge": {
			"highscore": 0,
		}
	},
	"spider": {
		"grass": { #Predatory Mite - Mite Spider
			"highscore": 0, 
		}, 
		"log": { #Bug Spider - Sheetweb Spider
			"highscore": 0, 
		}, 
		"pond": { #Dolomedes - Fish Eating Spider
			"highscore": 0, 
		},
		"rainforest": { #FunnelWeb - Vermin Eating Spider
			"highscore": 0, 
		},
		"islands": { #Huntsman - Man Eating Spider
			"highscore": 0, 
		},
		"bermuda_triangle": { #Arachnocetus - Ship Eating Spider
			"highscore": 0, 
		},
		"andromeda (M31)": { #Asteroid Eating Spider
			"highscore": 0, 
		}
	},
	"scarecrow": {
		"farm": {
			"highscore": 0,
		},
		"valley": {
			"highscore": 0,
		},
		"crop_circle": {
			"highscore": 0,
		},
		"forest": {
			"highscore": 0,
		},
		"peridot_city": {
			"highscore": 0,
		},
		"bedlam": {
			"highscore": 0,
		},
		"strawpocalypse":{
			"highscore": 0,
		}
	},
	"hunger": {
		"locusts": {
			"highscore": 0,
		},
		"piranha": {
			"highscore": 0,
		},
		"hippopotamus": {
			"highscore": 0,
		},
		"wendigo": {
			"highscore": 0,
		},
		"gashadokuro": {
			"highscore": 0,
		},
		"gluttony": {
			"highscore": 0,
		},
		"cooper": {
			"highscore": 0,
		}
	},
	"projectiles": {
		"nessie": {
			"highscore": 0,
		},
		"skunkape": {
			"highscore": 0,
		},
		"mothman": {
			"highscore": 0,
		},
		"medusa": {
			"highscore": 0,
		},
		"harpy": {
			"highscore": 0,
		},
		"chimera": {
			"highscore": 0,
		},
		"hydra": {
			"highscore": 0,
		}
	}
}

# Currency
var currency = {
	"guap": 0.0,
	"cinnamon": 0.0,
	"peat": 0.0,
	"bluepoppy": 0.0,
	"anoxicpearls": 0.0,
	"helelice": 0.0,
	"tovwaraseed": 0.0,
	"scientmotes": 0.0
}

var save_path = "user://variable.save"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_data()

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		var data = file.get_var()
		if data:
			for section in data.level:
				for area in data.level[section]:
					for key in data.level[section][area]:
						level[section][area][key] = data.level[section][area][key]

			for currency_type in data.currency:
				currency[currency_type] = data.currency[currency_type]
	else:
		print("No data saved...")

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var save_data = {
		"level": level,
		"currency": currency
	}
	file.store_var(save_data)

func _on_save_button_pressed():
	save()

func _on_load_button_pressed():
	load_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
