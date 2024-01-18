extends Control

@onready var Seed = randi()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_seed_text_submitted(new_text: String) -> void:
	if new_text =="":
		Seed = randi()
	elif $Panel/Seed.get_selected_text()==null:
		Seed=randi()
	else: 
		Seed =int(new_text)
	print(Seed)
	


func _on_button_create_pressed() -> void:
	get_tree().change_scene_to_file("res://classes/world.tscn")


func _on_button_cancle_pressed() -> void:
	get_tree().change_scene_to_file("res://classes/gui/main_menu.tscn")
