extends Control

onready var result = $ColorRect/Label
var menu = preload("res://scenes/Menu.tscn")
var new_game = load("res://scenes/Level.tscn")

var wynik

func _ready():
	result.text = String(Global.winner + " win!")

func _on_Button_pressed():
	new_game.instance()
	get_tree().change_scene_to(new_game)


func _on_Button2_pressed():
	menu.instance()
	get_tree().change_scene_to(menu)
	
