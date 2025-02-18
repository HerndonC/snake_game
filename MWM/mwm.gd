extends Node

var game_data: GameData
#var save_path = "user://variable.save"

#var level = {
	#"landfill": {
		#"level1": {
			#"highscore": 0, 
		#},
		#"level2": {
			#"highscore": 0, 
		#},
		#"level3": {
			#"highscore": 0, 
		#},
		#"level4": {
			#"highscore": 0, 
		#},
		#"level5": {
			#"highscore": 0, 
		#},
		#"level6": {
			#"highscore": 0, 
		#},
		#"level7": {
			#"highscore": 0, 
		#}
	#},
	#"constraint": {
		#"basicDistanceConstraint": false, 
		##function ConstrainDistance(point, anchor, distance) {
			##return ((point - anchor).normalize() * distance) + anchor;
		##}
		#"distanceConstantConstraint": false,
		##https://github.com/zalo/zalo.github.io/blob/master/assets/js/Constraints/Chain.js
		#"FABRIKChain": false, 
		##https://github.com/zalo/zalo.github.io/blob/master/assets/js/Constraints/FABRIK.js
		#"collisionConstraint": false,
		##https://github.com/zalo/zalo.github.io/blob/master/assets/js/Constraints/Collision.js
		#"collisionConstraintsWithVerlet": false,
		##https://github.com/zalo/zalo.github.io/blob/master/assets/js/Constraints/VerletCollision.js
		#"verletRope": false,
		##https://github.com/zalo/zalo.github.io/blob/master/assets/js/Constraints/RedRope.js
		#"volumePreservingSoftBody": false
		##https://github.com/zalo/zalo.github.io/blob/master/assets/js/Constraints/VolumeBlob.js
	#},
	#"slime": {
		#"agar": {
			#"highscore": 0,
		#},
		#"gum": {
			#"highscore": 0,
		#},
		#"molasses": {
			#"highscore": 0,
		#},
		#"oil": {
			#"highscore": 0,
		#},
		#"hazardous_waste": {
			#"highscore": 0,
		#},
		#"mercury": {
			#"highscore": 0,
			#"inretrograde": false
		#},
		#"antimatter": {
			#"highscore": 0,
		#}
	#},
	#"spider": {
		#"grass": { #Predatory Mite - Mite Spider
			#"highscore": 0, 
		#}, 
		#"log": { #Bug Spider - Sheetweb Spider
			#"highscore": 0, 
		#}, 
		#"pond": { #Dolomedes - Fish Eating Spider
			#"highscore": 0, 
		#},
		#"rainforest": { #FunnelWeb - Vermin Eating Spider
			#"highscore": 0, 
		#},
		#"islands": { #Huntsman - Man Eating Spider
			#"highscore": 0, 
		#},
		#"bermuda_triangle": { #Arachnocetus - Ship Eating Spider
			#"highscore": 0, 
		#},
		#"andromeda (M31)": { #Asteroid Eating Spider
			#"highscore": 0, 
		#}
	#},
	#"scarecrow": { #Requirements: Grain Wreaths
		#"farm": {
			#"highscore": 0,
		#},
		#"valley": {
			#"highscore": 0,
		#},
		#"crop_circle": {
			#"highscore": 0,
		#},
		#"forest": {
			#"highscore": 0,
		#},
		#"peridot_city": {
			#"highscore": 0,
			#"strawman": 0, #Create fakes
		#},
		#"bedlam": {
			#"highscore": 0,
		#},
		#"strawpocalypse":{
			#"highscore": 0,
		#}
	#},
	#"hunger": {
		#"locusts": {
			#"highscore": 0,
		#},
		#"piranha": {
			#"highscore": 0,
		#},
		#"hippo": {
			#"highscore": 0,
		#},
		#"wendigo": {
			#"highscore": 0,
		#},
		#"gashadokuro": {
			#"highscore": 0,
		#},
		#"gluttony": {
			#"highscore": 0,
		#},
		#"cooper": {
			#"highscore": 0,
		#}
	#},
	#"projectiles": {
		#"one": {
			#"highscore": 0,
		#},
		#"two": {
			#"highscore": 0,
		#},
		#"three": {
			#"highscore": 0,
		#},
		#"medusa": {
			#"highscore": 0,
		#},
		#"harpy": {
			#"highscore": 0,
		#},
		#"chimera": {
			#"highscore": 0,
		#},
		#"hydra": {
			#"highscore": 0,
		#}
	#},
	#"maze": {
		#"threads": { #Naxos - Ariadne's Thread
			#"highscore": 0,
			##2d Platformer, start from left, go right. The further right
			##the more points (Points based on max distance traveled right). 
			##Start with fixed amount of yarn. Recover yarn by backtracking.
			##
			##Create permanant structures that consume yarn.
				##Bridges, ladders, restraints for enemies
			##Can repel down holes and climb back up, recovering yarn.
			##Running out of yarn unravels you, ending run
			#
		#},
		#"labyrinth": { #Asterius - Grain Wreaths - Requrements: Ariadne's Thread
			#"highscore": 0,
			##Top down maze, darkness around edges
			##Anti-pacman, 14 boys and girls, running from you. More traps to make them run towards you
			##Longer it takes, less terrifying, sooner hero comes to kill you, end the run.
				##Faster captures increases terror
			##Daedulus can add traps with upgrades to herd sacrifices
			##Victims react to hearing range - Move faster away from you or turn around
			##Upgrades - Charge, Speed Increase, Quieter, More traps, More terror
			#
		#},
		#"twin_flames": { #Jack/Jill or TBD - Foolish Fire - Requirements: Grain Wreaths
			#"highscore": 0, # Control two characters, switching with a button
			## Light based puzzles, can only see around you
			## Water and wind hazards
			## Losing one character ends the run
			## upgrade: Fire Walk With Me
		#},
		#"snowman": { #Snowman - Coal - RQ: Helel Ice, Book of Prayers
			#"highscore": 0, # Top down
			## Start small, collecting snow increases your size. 
			## Time mechanic, the longer time goes, the more you melt, melting rate increases. starts at midnight
			## Points based on biggest size achieved and total amount of snow collected
			## Avoid hotter zones, stay alive as long as possible
		#},
		#"playing_god": { #Prometheus - Vital Sparks - RQ: 
			#"highscore": 0, #Navigate through city avoiding mob
			##Manage electrical charge
			##Various charging methods
			##Health system
			##Points based on survival time
			#
		#},
		#"homunculus": { #Name: - Mirror Fragments - Requirements: Vital Sparks
			#"highscore": 0,# Different abilities possibly at random? Upgrade allows for more than one ability
			## Chips challenge style, different elements, different abilities. Procedural chips challenge?
			## Transmute between states
		#},
		#"simulacrum": { #Name: - Motes of Reflection - Requirements: Motes of Scient, Mirror Fragments
			#"highscore":0 ,# Form rating system
			## Synchonized movement of all simulacrum
			## Mirror breaking creates copies but reduces form
			## Barriers requiring certain amount of simulacra
			## Combining Simulacra increases perfection
			##Upgrades:
				##Uncanny Valley: Reduces Form loss when breaking mirrors 8 levels? 20%-90%
				##Perfect Form: Increases base Form rating
				##Ideal Number: Allows more max simulacra
				##Divided Line: Halve Form to create copies
				##Anamnesis: Improves recombination efficiency (20% to 90%)
				##Cave Shadows: TBD
		#}
	#},
	#"stealth": {
		## Nessie
		## Skunkape
		## Mothman
		#"monastery": { #Name: Demon, Currency: Book of Prayers
			##Monastery - Possess inanimate objects, perhaps eventually people
			##Different people, different strength
				##Bishop
			##Spiritual energy, can only possess very close by, upgrade for longer distance
			##Observe monk patterns in the game
			##Monks have sanity?
			##Stamina in different vessels
			##Keys can unlock doors, candles to start fires
			##Books can fly over salt
			##bells make sound
			##
			##Upgrades:
				##Range of possession
				##Object mastery - Increases abilities (size of candle flame, how far a book can fly)
				##Extinguish candles - Lowers sanity
				##
			#
			#
		#}
	#}
#}



func _ready() -> void:
	game_data = GameData.new()
	game_data.desert_data = DesertData.new()
	
	## Wurm
	#print("Creating wurm data...")
	#game_data.desert_data = DesertData.new()
	#game_data.marsh_data = MarshData.new()
	#game_data.mountain_data = MountainData.new()
	#game_data.abyss_data = AbyssData.new()
	#game_data.hell_data = HellData.new()
	#game_data.heaven_data = HeavenData.new()
	#game_data.knowledge_data = KnowledgeData.new()
	#print("Wurm data created")
	#
	#print("Loading saved data...")
	#load_data()
	#print("Data loaded")

#func save():
	#var file = FileAccess.open(save_path, FileAccess.WRITE)
	#var save_data = {
		#"wurm": {
			#"desert": resource_to_dict(game_data.desert_data),
			#"marsh": resource_to_dict(game_data.marsh_data),
			#"mountain": resource_to_dict(game_data.mountain_data),
			#"abyss": resource_to_dict(game_data.abyss_data),
			#"hell": resource_to_dict(game_data.hell_data),
			#"heaven": resource_to_dict(game_data.heaven_data),
			#"knowledge": resource_to_dict(game_data.knowledge_data)
		#},
		#"currency": {
			#"guap": game_data.guap,
			#"cinnamon": game_data.cinnamon,
			#"peat": game_data.peat,
			#"bluepoppy": game_data.bluepoppy,
			#"anoxicpearls": game_data.anoxicpearls,
			#"helelice": game_data.helelice,
			#"tovwaraseeds": game_data.tovwaraseeds,
			#"scientmotes": game_data.scientmotes
		#}
	#}
	#file.store_var(save_data)

#func load_data():
	#if FileAccess.file_exists(save_path):
		#var file = FileAccess.open(save_path, FileAccess.READ)
		#var data = file.get_var()
		#if data:
			## Load wurm data
			#if "wurm" in data:
				#if "desert" in data.wurm:
					#dict_to_resource(data.wurm.desert, game_data.desert_data)
				#if "marsh" in data.wurm:
					#dict_to_resource(data.wurm.marsh, game_data.marsh_data)
				#if "mountain" in data.wurm:
					#dict_to_resource(data.wurm.mountain, game_data.mountain_data)
				#if "abyss" in data.wurm:
					#dict_to_resource(data.wurm.abyss, game_data.abyss_data)
				#if "hell" in data.wurm:
					#dict_to_resource(data.wurm.hell, game_data.hell_data)
				#if "heaven" in data.wurm:
					#dict_to_resource(data.wurm.heaven, game_data.heaven_data)
				#if "knowledge" in data.wurm:
					#dict_to_resource(data.wurm.knowledge, game_data.knowledge_data)
			#
			## Load currency
			#if "currency" in data:
				#game_data.guap = data.currency.get("guap", 0.0)
				#game_data.cinnamon = data.currency.get("cinnamon", 0.0)
				#game_data.peat = data.currency.get("peat", 0.0)
				#game_data.bluepoppy = data.currency.get("bluepoppy", 0.0)
				#game_data.anoxicpearls = data.currency.get("anoxicpearls", 0.0)
				#game_data.helelice = data.currency.get("helelice", 0.0)
				#game_data.tovwaraseeds = data.currency.get("tovwaraseeds", 0.0)
				#game_data.scientmotes = data.currency.get("scientmotes", 0.0)
	#else:
		#print("No save data found...")

func resource_to_dict(resource: Resource) -> Dictionary:
	var dict = {}
	for property in resource.get_property_list():
		if property.usage & PROPERTY_USAGE_SCRIPT_VARIABLE:
			dict[property.name] = resource.get(property.name)
	return dict

func dict_to_resource(dict: Dictionary, resource: Resource) -> void:
	for key in dict:
		if resource.get(key) != null:  # Only set if property exists
			resource.set(key, dict[key])

#func _on_save_button_pressed():
	#save()

#func _on_load_button_pressed():
	#load_data()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_game_data() -> GameData:
	print("Accessing game_data:", game_data != null)
	return game_data
