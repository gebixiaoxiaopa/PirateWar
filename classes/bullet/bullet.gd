extends CharacterBody2D
var dir = Vector2.RIGHT
var  Speed=0.0
func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	self.apply
func move(delta:float)->void:
	move_and_collide(dir*Speed*delta)
