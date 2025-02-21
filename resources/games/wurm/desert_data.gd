## Resource class for storing Desert level data and upgrades
extends Resource
class_name DesertData

## Current high score for the Desert level
@export var highscore: int = 0

# Game Stats and Leveling Upgrades
## Big Boned Level (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
## Determines starting size of wurm
@export var wurm_size: int = 1
## Fibrous Level (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
## Determins points per pear. Cacti plants are worth 50x pear points
@export var pear_points: int = 1
## Self Hype Level (2, 3, 4, 5, 10, 20, 40, 80, 200, 500)
## Determines multiplier for when you get a new high score
@export var hs_multiplier: int = 2
## Botanist Level (16, 13, 10, 7, 4, 1)
## Determines how long it takes for new pear to spawn around a cacti
@export var fruit_respawn: int = 16
## Fruition Level (1, 2, 3, 4, 5, 6, 7, 8)
## Determines the amount of pears that spawn per spawn
@export var pear_spawn_rate: int = 1
## Epoch GMO Level (1000, 60, 50, 40, 30, 25, 20, 15, 10, 5)
@export var cactus_growth: int = 1000
## Migrate Level (5, 4, 3, 2, 1)
## Each level has 20(x)% of the max walls on a map
@export var less_walls: int = 5
## Balanced Tail Level (0.6, 0.5, 0.4, 0.3, 0.2, 0.1)
## Move every (x) seconds
@export var wurm_speed: float = 0.6
## The Spice Must Flow Level (10, 9, 8, 7, 6, 5, 4, 3, 2, 1)
## Gain cinnamon every (x) points
@export var cinnamon_rate: float = 10.0
## Respect of the Elders (1.0, 1.1, 1.2, 1.4, 1.8. 2.4, 3.2, 4.0)
## Multiplier of points based on size of wurm times (x)
@export var size_points: float = 1.0	

# Bool Upgrades and Unlocks
## Mirage Walker
## Toggleable ability to wrap around sides - Unlocks Sidewinder
@export var no_bounds: bool = false
## Sidewinder - Requires Sidewinder
## Shifts position by one upon wrapping
@export var shift_position: bool = false
## Keratin Papillae
## Cacti are now edible, worth a pear 50x
@export var eat_cacti: bool = false
## Annular Teeth Requires Migrate level 5
## Able to break through walls
@export var break_walls: bool = false
## Cannibalize - Requires Mirage Walker and Annular Teeth
## Eating your tail doesn't kill you
@export var cannibalize: bool = false
## Ouroboros - Requres Cannibalize and Keratin Papillae
## Eating yourself gives pear points times the amount you are eating, and additional length
@export var ouroboros: bool = false		#Eating yourself gives points and length
