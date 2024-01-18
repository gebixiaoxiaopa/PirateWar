extends Node2D

@onready var PauseScreen = preload("res://classes/gui/Pause.tscn")
@onready var Enemy = preload("res://classes/enemy/enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		Enemy.instantiate().queue_free()
		get_tree().change_scene_to_file("res://classes/gui/Pause.tscn")
	if Player.Health ==0:
		get_tree().change_scene_to_file("res://assets/gui/restart_screen.tscn")
