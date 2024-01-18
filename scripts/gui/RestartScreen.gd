extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_back_pressed() -> void:
	get_tree().change_scene_to_file("res://classes/gui/main_menu.tscn")
func _on_button_restart_pressed() -> void:
	Player.Health =10
	Player.Bullets=10
	get_tree().change_scene_to_file("res://classes/world.tscn")
	
