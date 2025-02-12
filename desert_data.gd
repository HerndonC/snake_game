# Create a new script called desert_data.gd
extends Resource
class_name DesertData

# Game Stats, Upgradable
@export var highscore: int = 0
@export var wurm_size: int = 1
@export var pear_points: int = 1
@export var hs_multiplier: int = 2
@export var fruit_respawn: int = 16
@export var pear_spawn_rate: int = 1
@export var cactus_growth: int = 1000
@export var less_walls: int = 5
@export var wurm_speed: float = 0.6
@export var cinnamon_rate: float = 10.0
@export var size_points: float = 1.0

# Bool Upgrades
@export var no_bounds: bool = false
@export var shift_position: bool = false
@export var eat_cacti: bool = false
@export var break_walls: bool = false
@export var cannibalize: bool = false
@export var ouroboros: bool = false
