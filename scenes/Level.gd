extends Node2D

var menu = load("res://scenes/Menu.tscn")
var endPanel = preload("res://scenes/EndGamePalen.tscn").instance()
onready var light = $Light
onready var timer = $Timer
onready var tween = $Tween
var increment = 0 
var player1 = 0
var player2 = 0
var more_light = 100
var more_dark = -100
var actual_light_dark = 0

func _process(delta):
	print(increment)
	print("punkty gracza 1", player1)

func _input(event):
	if Input.is_action_just_pressed("esc"):
		menu.instance()
		get_tree().change_scene_to(menu)

func _ready():
	restartGame()
	get_node("AnimationPlayer").play("start")
	yield( get_node("AnimationPlayer"), "animation_finished")
	get_node("GameplayMusic").play()
	timer.start(1)
	
func _on_Timer_timeout():
	increment += 1
	comparing_player_squares()
	end_game()
	whoisWinning()

func end_game():
	if player1 == 10 or player1 > player2 and increment == 60:
		timer.stop() # okno - wygrywa gracz 1 
		Global.winner = "player one"
		add_child(endPanel)
	elif  player2 == 10 or player2 > player1 and increment == 60:
		timer.stop()
		Global.winner = "player two"
		add_child(endPanel)
	elif increment == 60:
		timer.stop()
		Global.winner = "nobody"
		add_child(endPanel)

func whoisWinning():
	if player1 == player2:
		get_node("AnimationPlayer").stop()
	elif player1 > player2:
		get_node("AnimationPlayer").play("rabbitDance")
	elif player2 > player1:
		get_node("AnimationPlayer").play("dragonDance")		

func comparing_player_squares():
	if Global.player1 == 1 and Global.player2 == 3 or Global.player1 == 2 and Global.player2 == 1 or Global.player1 == 3 and Global.player2 == 2:
		actual_light_dark += more_light
		tween.interpolate_property(light, "position:x", light.position.x, actual_light_dark, 0.3, Tween.EASE_OUT, Tween.EASE_IN_OUT)
		tween.start()
		get_node("border").play()
		player1 += 1
		player2 -= 1
	if Global.player2 == 1 and Global.player1 == 3 or Global.player2 == 2 and Global.player1 == 1 or Global.player2 == 3 and Global.player1 == 2:
		actual_light_dark += more_dark
		tween.interpolate_property(light, "position:x", light.position.x, actual_light_dark, 0.3, Tween.EASE_OUT, Tween.EASE_IN_OUT)
		tween.start()
		get_node("border").play()
		player2 += 1
		player1 -= 1
	else:
		print("remis")
	
func restartGame():
	Global.player1 = 1
	Global.player2 = 1
	Global.winner = "error"

