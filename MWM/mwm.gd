extends Node

var desert_data: DesertData


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
			"amphibious": false,
			"shell_cracker": false, #Eat turtles
			"eat_the_ancients": false, #Eat crocodiles
			"Dam Buster": false,
			"mudskipperFins": false,
			
		},
		"mountain": {
			"highscore": 0,
			"windcutter": 0, #Can't be slowed by winds
			"splitter": 0, #Trees split wurm into clones
			"revenge": false, #Eat yetis
			"eatrocks": false,
			"variablespeed": false, #can slow or speed up
			"with a nice chianti": 1.0, #humans worth more points
			
		},
		"abyss": {
			"highscore": 0,
			"crushingpressure": false, #can go further up
			#things that shoot you up and down
			#stalactite and thermal vents
			#tentacle amount
			#tentacle reach
			#tentacle speed
			#health regen
			#bioluminescence, make it dark at the base with thermal vents and jellyfish visibile
			#eat jellyfish
			#rubber ducky easter egg
			#anoxic layer
			#chemosynthesis
			#hydrothermal vents
			#Whale fall
		},
		"hell": {
			"highscore": 0,
			#Respawn rate of the sinners
		},
		"heaven": {
			"highscore": 0,
			#floating islands and spheres
			# wheel angels
			#gather orbs to unlock further areas
		},
		"knowledge": {
			"highscore": 0,
			"epistemology": false,
			"experience": 1.0, #Experience increases guap
			"philosophy": false,
			"dialectic": false,
			"empiricism": false,
			"pedagogy": false,
			"cognition": false,
			"hermeneutics": false,
			"ontology": false,
			"heuristic": false,
			"metacognition": false,
			"axiom": false,
			"praxis": false,
			"syllogism": false,
			"synthesis": false,
			"gnosis": false,
			"rhetoric": false,
			"semiotics": false
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
	"scarecrow": { #Requirements: Grain Wreaths
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
			"strawman": 0, #Create fakes
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
		"one": {
			"highscore": 0,
		},
		"two": {
			"highscore": 0,
		},
		"three": {
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
	},
	"maze": {
		"threads": { #Naxos - Ariadne's Thread
			#2d Platformer, start from left, go right. The further right
			#the more points (Points based on max distance traveled right). 
			#Start with fixed amount of yarn. Recover yarn by backtracking.
			#
			#Create permanant structures that consume yarn.
				#Bridges, ladders, restraints for enemies
			#Can repel down holes and climb back up, recovering yarn.
			#Running out of yarn unravels you, ending run
			
		},
		"labyrinth": { #Asterius - Grain Wreaths - Requrements: Ariadne's Thread
			#Top down maze, darkness around edges
			#Anti-pacman, 14 boys and girls, running from you. More traps to make them run towards you
			#Longer it takes, less terrifying, sooner hero comes to kill you, end the run.
				#Faster captures increases terror
			#Daedulus can add traps with upgrades to herd sacrifices
			#Victims react to hearing range - Move faster away from you or turn around
			#Upgrades - Charge, Speed Increase, Quieter, More traps, More terror
			
		},
		"twin_flames": { #Jack/Jill or TBD - Foolish Fire - Requirements: Grain Wreaths
			# Control two characters, switching with a button
			# Light based puzzles, can only see around you
			# Water and wind hazards
			# Losing one character ends the run
			# upgrade: Fire Walk With Me
		},
		"snowman": { #Snowman - Coal - RQ: Helel Ice, Book of Prayers
			# Top down
			# Start small, collecting snow increases your size. 
			# Time mechanic, the longer time goes, the more you melt, melting rate increases. starts at midnight
			# Points based on biggest size achieved and total amount of snow collected
			# Avoid hotter zones, stay alive as long as possible
		},
		"playing_god": { #Prometheus - Vital Sparks - RQ: 
			#Navigate through city avoiding mob
			#Manage electrical charge
			#Various charging methods
			#Health system
			#Points based on survival time
			
		},
		"homunculus": { #Name: - Mirror Fragments - Requirements: Vital Sparks
			# Different abilities possibly at random? Upgrade allows for more than one ability
			# Chips challenge style, different elements, different abilities. Procedural chips challenge?
			# Transmute between states
		},
		"simulacrum": { #Name: - Motes of Reflection - Requirements: Motes of Scient, Mirror Fragments
			# Form rating system
			# Synchonized movement of all simulacrum
			# Mirror breaking creates copies but reduces form
			# Barriers requiring certain amount of simulacra
			# Combining Simulacra increases perfection
			#Upgrades:
				#Uncanny Valley: Reduces Form loss when breaking mirrors 8 levels? 20%-90%
				#Perfect Form: Increases base Form rating
				#Ideal Number: Allows more max simulacra
				#Divided Line: Halve Form to create copies
				#Anamnesis: Improves recombination efficiency (20% to 90%)
				#Cave Shadows: TBD
		}
	},
	"stealth": {
		# Nessie
		# Skunkape
		# Mothman
		"monastery": { #Name: Demon, Currency: Book of Prayers
			#Monastery - Possess inanimate objects, perhaps eventually people
			#Different people, different strength
				#Bishop
			#Spiritual energy, can only possess very close by, upgrade for longer distance
			#Observe monk patterns in the game
			#Monks have sanity?
			#Stamina in different vessels
			#Keys can unlock doors, candles to start fires
			#Books can fly over salt
			#bells make sound
			#
			#Upgrades:
				#Range of possession
				#Object mastery - Increases abilities (size of candle flame, how far a book can fly)
				#Extinguish candles - Lowers sanity
				#
			
			
		}
	}
}

# Currency
var currency = {
	"guap": 0.0,				#Generic money, used everywhere
	"cinnamon": 0.0,			#Desert - Sand Wurm
	"peat": 0.0,				#Marsh - Mud Wurm
	"bluepoppy": 0.0,		#Mountain - Snow Wurm
	"anoxicpearls": 0.0,		#Abyss - Kraken Wurm
	"helelice": 0.0,			#Hell - Leviathan Wurm
	"tovwaraseed": 0.0,		#Heaven - Apocrapha Wurm
	"scientmotes": 0.0		#Reality - Book Wurm
}

var save_path = "user://variable.save"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	desert_data = DesertData.new()
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
