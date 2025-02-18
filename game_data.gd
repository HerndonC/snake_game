extends Resource
class_name GameData

# Wurm Games
@export var desert_data: DesertData
@export var marsh_data: MarshData
@export var mountain_data: MountainData
@export var abyss_data: AbyssData
@export var hell_data: HellData
@export var heaven_data: HeavenData
@export var knowledge_data: KnowledgeData

# Currency
	# Game
@export var guap: float = 0.0
	# Wurm
@export var cinnamon: float = 0.0		#Desert - Sand
@export var peat: float = 0.0			#Marsh - Mud
@export var bluepoppy: float = 0.0		#Mountain - Snow
@export var anoxicpearls: float = 0.0	#Abyss - Kraken
@export var helelice: float = 0.0		#Hell - Leviathan
@export var tovwaraseeds: float = 0.0	#Heaven - Apocrapha
@export var scientmotes: float = 0.0		#Knowledge - Book
