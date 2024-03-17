extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_back_pressed() -> void:
	get_tree().paused=false
	get_tree().change_scene_to_file("res://classes/gui/main_menu.tscn")
func _on_button_restart_pressed() -> void:
	PlayerData.Health=10
	PlayerData.Bullet=10
	get_tree().reload_current_scene()
	get_tree().paused = false
	
