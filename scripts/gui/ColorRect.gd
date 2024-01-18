extends ColorRect

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	await($AnimationPlayer.animation_finished)
	get_tree().change_scene_to_file("res://classes/gui/main_menu.tscn")
	self.queue_free()
