extends Hitbox
var dir = Vector2(0,0)
const SPEED = 800.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.translate(dir * SPEED * delta)


func _on_hit(hurtbox) -> void:
	if hurtbox.owner.is_in_group("enemy"):
		hurtbox.owner.queue_free()
		queue_free()
