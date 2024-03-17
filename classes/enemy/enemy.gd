class_name EnemyBody
extends CharacterBody2D
var Speed=200
signal Hit()
@onready var player: CharacterBody2D = get_parent().get_node("/root/World/Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var player_pos = player.global_position
	var dir = (player_pos - position).normalized()
	velocity=(dir*Speed)
	move_and_slide()
	look_at(player_pos)
	








		


func _on_area_2d_hit(hurtbox) -> void:
	if hurtbox.owner.name=="Player":
		Hit.emit()
