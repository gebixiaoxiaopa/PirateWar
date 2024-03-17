extends Node2D

@onready var PauseScreen = preload("res://classes/gui/Pause.tscn")
@onready var Enemy = preload("res://classes/enemy/enemy.tscn")
@onready var restart_screen: Control = $CanvasLayer/RestartScreen

@onready var pause: Control = $CanvasLayer/Pause

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	PlayerData.Health = 10
	PlayerData.Bullet=10
	get_tree().paused = false
	restart_screen.visible=false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause.visible=true 
		get_tree().paused =true
	if PlayerData.Health<=0:
		restart_screen.show()
		get_tree().paused = true
		
	
