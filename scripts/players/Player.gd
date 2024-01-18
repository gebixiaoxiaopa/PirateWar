class_name PlayerBody
extends CharacterBody2D
@export var Health =10
@onready var Plank = preload("res://classes/planks/plank.tscn")
@export var Bullets= 10
@export var Speed = 20
@onready var Enemy= preload("res://classes/enemy/enemy.tscn")
var mouse_pos = 0
var pos = (self.global_position)
@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	velocity = Vector2(0,0)
	mouse_pos = get_global_mouse_position()
	if Input.is_action_pressed("move"):
		var direction = (mouse_pos-position).normalized()
		velocity=(direction*Speed)
	move_and_slide()
	look_at(mouse_pos)
	pos = (self.global_position)
	Shoot()

func _on_timer_timeout() -> void:
	GenEnemy()
	GenPlank()
func Shoot()->void:
	if Bullets>0 and Input.is_action_just_pressed("Shoot"):
		Bullets -=1
		print(Bullets)
func GenEnemy()->void:
	var new_enemy = Enemy.instantiate()
	new_enemy.global_position = Vector2(randf_range(self.global_position.x+1152/2,self.global_position.x-1152/2)+1152/1.1,randf_range(self.global_position.y+648/2,self.global_position.y-648/2)+648/1.1)
	get_parent().add_child(new_enemy)
	$Timer.wait_time = randi_range(1,10)
func GenPlank()->void:
	var new_plank = Plank.instantiate()
	new_plank.global_position = Vector2(randf_range(self.global_position.x+1152/2,self.global_position.x-1152/2)+1152/1.1,randf_range(self.global_position.y+648/2,self.global_position.y-648/2)+648/1.1)
	get_parent().add_child(new_plank)
	
	
	
