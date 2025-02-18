## Resource class for storing Desert level data and upgrades
extends Resource
class_name DesertData

## Current high score for the Desert level
@export var highscore: int = 0

# Game Stats and Leveling Upgrades
@export var wurm_size: int = 1			#Big Boned
@export var pear_points: int = 1			#Fibrous
@export var hs_multiplier: int = 2		#Self Hype
@export var fruit_respawn: int = 16		#Botanist - How long it takes for a new pear to spawn
@export var pear_spawn_rate: int = 1		#Fruition - Amount of pears that spawn per spawn
@export var cactus_growth: int = 1000	#Epoch GMO - Time it takes pear to grow
@export var less_walls: int = 5			#Migrate - New tile map with % less walls
@export var wurm_speed: float = 0.6		#Balanced Tail
@export var cinnamon_rate: float = 10.0	#The Spice Must Flow
@export var size_points: float = 1.0		#Respect of the Elders

# Bool Upgrades and Unlocks
@export var no_bounds: bool = false		#Mirage Walker - Unlocks Sidewinder - Wraps sides
@export var shift_position: bool = false#Requires Mirage Walker - Shifts position on wrap
@export var eat_cacti: bool = false		#Keratin Papillae - Cactus are 50x current pear_points
@export var break_walls: bool = false	#Annular Teeth
@export var cannibalize: bool = false	#Eating your tail doesn't kill you - Unlocks Ouroboros
@export var ouroboros: bool = false		#Eating yourself gives points and length
