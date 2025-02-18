extends Resource
class_name MountainData # mountain_data.gd

# Game Stats and Leveling Upgrades
@export var highscore: int = 0
@export var windcutter: int = 10		# 10/8/6/4/2/0 Decreases forced wind movement
@export var avalanche: int = 0	# 0/1/2/3/4 Snow mounds create copies
@export var resistresistance: int = 1 #1/2/3 Can increase the speed x2 or x3
@export var specialmeat: int = 1 #1/2/3/4/5/6/7/8/9/10 //... with some fava beans and a nice chianti.

# Bool Upgrades and Unlocks
@export var woodsplitter: bool = false # Trees split wurms once //Wait... that's usually not what wood splitter means
@export var revenge: bool = false #Able to eat yetis, unlocks wintermoon, yetis are worth 50x people
@export var wintersolstice: bool = false #Spawn rate of humans and yetis are reversed
@export var kickrocks: bool = false #Rocks are no longer obstacles
