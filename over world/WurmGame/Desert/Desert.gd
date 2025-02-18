extends Node

@export var snake_scene : PackedScene
var mwm
var upgrade: DesertData

#game variables
var score : int
var game_started : bool = false

#grid variables
var cells : int = 20
var cell_size : int = 50

#food variables
var food_pos : Vector2
var regen_food : bool = true

#snake variables
var old_data : Array
var snake_data : Array #Segments, head is 0
var snake : Array

#movement variables
var start_pos = Vector2(9, 9)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var move_direction : Vector2
var can_move : bool


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mwm = get_node("/root/MWM")
	#upgrade = mwm.game_data.desert_data
	new_game()

func new_game():
	get_tree().paused = false
	get_tree().call_group("segments", "queue_free")
	$GameOverMenu.hide()
	score = 0
	$Hud.get_node("MarginContainer/HBoxContainer/ScoreLabel").text = "SCORE: " + str(score)
	move_direction = up
	can_move = true
	generate_snake()
	move_food()

func generate_snake():
	old_data.clear()
	snake_data.clear()
	snake.clear()
	#starting in the start_pos, create tail segments vertically down
	for i in range(upgrade.wurm_size):
		add_segment(start_pos + Vector2(0,i))

func add_segment(pos):
	snake_data.append(pos)
	var SnakeSegment = snake_scene.instantiate()
	SnakeSegment.position = (pos * cell_size) + Vector2(0, cell_size)
	add_child(SnakeSegment)
	snake.append(SnakeSegment)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_snake()
	$Hud.get_node("MarginContainer/HBoxContainer/CurrencyLabel").text = "Cinnamon: " + str(mwm.game_data.cinnamon)

func move_snake():
	if can_move:
		#Update movement from keypress
		if Input.is_action_just_pressed("move_down") and move_direction != up:
			move_direction = down
			can_move = false
			if not game_started:
				start_game()
		if Input.is_action_just_pressed("move_up") and move_direction != down:
			move_direction = up
			can_move = false
			if not game_started:
				start_game()
		if Input.is_action_just_pressed("move_left") and move_direction != right:
			move_direction = left
			can_move = false
			if not game_started:
				start_game()
		if Input.is_action_just_pressed("move_right") and move_direction != left:
			move_direction = right
			can_move = false
			if not game_started:
				start_game()

func start_game():
	game_started = true
	$MoveTimer.start()


func _on_move_timer_timeout() -> void:
	can_move = true
	old_data = [] + snake_data
	snake_data[0] += move_direction
	for i in range(len(snake_data)):
		#move all segments along by one
		if i > 0:
			snake_data[i] = old_data[i - 1]
	
	check_out_of_bounds()
	check_in_wall()
	check_self_eaten()
	check_cacti_eaten()
	check_food_eaten()
	
	update_snake_visual() #Update visuals after all position corrections

func check_out_of_bounds():
	if snake_data[0].x < 0 or snake_data[0].x > cells - 1 or snake_data[0].y < 0 or snake_data[0].y > cells - 1:
		if upgrade.no_bounds:
			if upgrade.shift_position:
				if snake_data[0].x < 0 or snake_data[0].x > cells - 1:
					pass
				elif snake_data[0].y < 0 or snake_data[0].y > cells - 1:
					pass
			else:
				pass
			if snake_data[0].x < 0:
				snake_data[0].x = cells - 1
			elif snake_data[0].x > cells - 1:
				snake_data[0].x = 0
				
			if snake_data[0].y < 0:
				snake_data[0].y = cells - 1
			elif snake_data[0].y > cells - 1:
				snake_data[0].y = 0
		else:
			end_game()


func update_snake_visual():
	for i in range(len(snake_data)):
		snake[i].position = (snake_data[i] * cell_size) + Vector2(0, cell_size)

func check_in_wall():
	pass
	
func check_self_eaten():
	for i in range(1, len(snake_data)):
		if snake_data[0] == snake_data[i]:
			if not upgrade.cannibalize:
				pass
			else:
				end_game()

func check_cacti_eaten():
	pass

func check_food_eaten():
	#if snake eats the food, add segment and move the food
	if snake_data[0] == food_pos:
		score += upgrade.pear_points
		$Hud.get_node("MarginContainer/HBoxContainer/ScoreLabel").text =  "Score: " + str(score)
		add_segment(old_data[-1])
		move_food()

func move_food():
	while regen_food:
		regen_food = false
		food_pos = Vector2(randi_range(0, cells - 1), randi_range(0, cells - 1))
		for i in snake_data:
			if food_pos == i:
				regen_food = true
	$Food.position = (food_pos * cell_size) + Vector2(0, cell_size)
	regen_food = true

func end_game():
	var cinnamongained = score / upgrade.cinnamon_rate
	$GameOverMenu.get_node("GameOverPanel/VBoxContainer/CurrencyGainedSubtotal").text = "SUBTOTAL: " + str(cinnamongained)
	var multiplier = 1.0
	if score > upgrade.highscore:
		$GameOverMenu.get_node("GameOverPanel/VBoxContainer/ResultsLabel").text = "HIGH SCORE!"
		multiplier *= upgrade.hs_multiplier
		$GameOverMenu.get_node("GameOverPanel/VBoxContainer/Multiplier").text = "MULTIPLIER: x" + str(int(multiplier))
		cinnamongained *= multiplier
		upgrade.highscore = score
	else:
		$GameOverMenu.get_node("GameOverPanel/VBoxContainer/ResultsLabel").text = "RESULTS!"
		$GameOverMenu.get_node("GameOverPanel/VBoxContainer/Multiplier").text = "MULTIPLIER: x" + str(multiplier)
	mwm.game_data.cinnamon += cinnamongained
	
	mwm.save()
	$GameOverMenu.show()
	$MoveTimer.stop()
	$GameOverMenu.get_node("GameOverPanel/VBoxContainer/ResultsPoints").text = "SCORE: " + str(score)
	$GameOverMenu.get_node("GameOverPanel/VBoxContainer/HighScore").text = "HIGHSCORE: " + str(upgrade.highscore)
	$GameOverMenu.get_node("GameOverPanel/VBoxContainer/CurrencyGainedTotal").text = "TOTAL: " + str(cinnamongained)
	$GameOverMenu.get_node("GameOverPanel/VBoxContainer/Currency").text = "TOTAL CINNAMON: " + str(mwm.game_data.cinnamon)

	
	game_started = false
	get_tree().paused = true

func _on_game_over_menu_restart() -> void:
	new_game()
