extends Node2D

onready var tween = $Tween
onready var marked = $marked
onready var color1 = $color1
onready var color2 = $color2
onready var color3 = $color3
onready var next_position = color2.rect_position + marked.rect_position # posiotion mid
var sequence = 1
var tween_completed = true

func _input(event):
	change_selected()

func _ready():
	var position_marked = marked.rect_position

func player1():
	tween.interpolate_property(marked, "rect_position", marked.rect_position, next_position, 0.1, Tween.EASE_OUT, Tween.EASE_IN_OUT)
	tween.start()
	get_node("AudioStreamPlayer").play()
	tween_completed = false
	print(sequence)
	
func change_selected(): 
	if Input.is_action_just_pressed("player1"):
		if tween_completed == true:
			if sequence == 1:
				next_position = color2.rect_position + marked.rect_position 
				sequence = 2
				Global.player1 = 2
			elif sequence == 2:
				next_position = color2.rect_position + marked.rect_position 
				sequence = 3
				Global.player1 = 3
			elif sequence == 3:
				next_position = next_position  - (color1.rect_position + marked.rect_position + Vector2(12,12))
				sequence = 1
				Global.player1 = 1
			player1()
			yield($Tween,"tween_completed")
			tween_completed = true
		

