extends Control


var new_game = load("res://scenes/Level.tscn")

func _input(event):
	if Input.is_action_just_pressed("esc"):
		get_tree().quit()

func _ready():
	pass # Replace with function body.


func _on_TextureButton_pressed():
	new_game.instance()
	get_tree().change_scene_to(new_game)


func _on_TextureButton2_pressed():
	get_node("TextureButton4").visible = true


func _on_TextureButton3_pressed():
	get_node("TextureButton5").visible = true


func _on_TextureButton4_pressed():
	get_node("TextureButton4").visible = false


func _on_TextureButton5_pressed():
	get_node("TextureButton5").visible = false


func _on_TextureButton_mouse_entered():
	get_node("AudioStreamPlayer").play()


func _on_TextureButton2_mouse_entered():
	get_node("AudioStreamPlayer").play()


func _on_TextureButton3_mouse_entered():
	get_node("AudioStreamPlayer").play()
