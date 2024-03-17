class_name Plank
extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





func _on_hitbox_hit(hurtbox) -> void:
	if hurtbox.owner.is_in_group("Player"):
		if PlayerData.Health!=10:
			self.queue_free() 
