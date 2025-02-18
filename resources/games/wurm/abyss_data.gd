## Resource class for storing Abyss level data and upgrades
extends Resource
class_name AbyssData

#Vents shoot you up and down
#Thermal vents lower brightness /5, danger layers /2
## Current high score for the Abyss level
@export var highscore: int = 0

# Leveling Upgrades

## Health regeneration level (1-5)
## Each level increases health regen by a percentage of your max health per second
@export var planarian: int = 0

## Brightness level control (1-5)
## Increases visibility around the wurm and jellyfish
@export var bioluminescence: int = 0

## Rubber duck drop rate per minute amount (1-5)
## Easter egg unlocks by grabbing a rubber duck from a jeep
## Rubber ducks give points = to 50x fish
@export var ownajeep: int = 0

## Whale fall level (60/52/46/34/28/20)
## Increases spawnrate of whale falls that bring lots of fish 
@export var whalefall: int = 60 

## Tentacle amount level (1-10
@export var gangliaimplants: int = 1

## Tentacle length level (1.0 to 3.0)
@export var magnapinna: float = 1.0

## Tentacle speed level (1.0 to 5.0)
@export var conductionvelocity: float = 1.0 # Speed of tentacles

# Bool Upgrades and Unlocks

@export var underpressure: bool = false #Can go into the upper zone //ice ice baby
@export var neuralring: bool = false #Unlocks tentacle upgrades
@export var papillae: bool = false #Can Eat Jellyfish
@export var cryptobiosis: bool = false #Anoxic layer is safer, Health regen is increased by the difference = 0
@export var chemosynthesis: bool = false #Thermal vents no longer hurt, increases regen x5
