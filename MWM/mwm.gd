extends Node


# Store all high scores in a dictionary
var high_scores = {
	"landfill": {
		"level1": 0,
		"level2": 0,
		"level3": 0,
		"level4": 0,
		"level5": 0,
		"level6": 0,
		"level7": 0
	},
	"slime": {
		"agar": 0,
		"gum": 0,
		"molasses": 0,
		"oil": 0,
		"hazardous_waste": 0,
		"mercury": 0,
		"antimatter": 0
	},
	"wurm": {
		"desert": 0,
		"marsh": 0,
		"mountain": 0,
		"abyss": 0,
		"hell": 0,
		"heaven": 0,
		"knowledge": 0
	},
	"scarecrow": {
		"farm": 0,
		"valley": 0,
		"crop_circle": 0,
		"forest": 0,
		"peridot_city": 0,
		"bedlam": 0,
		"strawpocalypse": 0
	},
	"spider": {
		"grass": 0, #Predatory Mite - Mite Spider
		"hollow_log": 0, #Bug Spider - Sheetweb Spider
		"pond": 0, #Dolomedes - Fish Eating Spider
		"": 0, #Huntsman/FunnelWeb - Vermin Eating Spider
		#Man Eating Spider Ship Eating Spider?
		#Man Eating Spider MegaRachna?
		"andromeda (M31)": 0 #Asteroid Eating Spider
	}
}

#Upgrades
var upgrades = {
	"desert": {
		"starting_size": 1, #Big Boned - Amount of segments on snake at the start
		"pear_points": 1, #Fibrous - Points per pear
		"hs_multiplier": 2, #Self Hype - Currency multiplier from HS
		"fruit_respawn": 16, #Botany - Seconds for new spawn
		"pear_spawn_rate": 1, #Fruition - Amount of pear spawn
		"cactus_growth": 1000, #Epoch GMO - Time it takes for a pear to grow
		"less_walls": 5, #Migration - Less walls tile map, procedurally generated
		"wurm_speed": 0.6, #Balanced Tail - Speed in seconds
		"cinnamon_rate": 10.0, #The Spice Must Flow - Cinnamon every X points
		"size_points": 1.0, #Elder - Multiplier based on the size of the wurm
		"eat_cacti": false, #Keratin Papillae - Allows you to eat cacti
		"break_walls": false, #Annular Teeth - Allows you to go through walls
		"can_eat_self": false, #Lizard Tails - Eating your tail doesn't kill you
		"ouroboros": false, #Ouroboros - Eating yourself gives points
	}
}

# Currency
var currency = {
	"guap": 0,
	"cinnamon": 0
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
			high_scores = data.high_scores
			currency = data.currency
	else:
		print("No data saved...")

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	var save_data = {
		"high_scores": high_scores,
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
