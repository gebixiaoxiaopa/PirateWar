extends Control
@onready var player: CharacterBody2D = get_parent().get_node("/root/World/Player")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HealthBar.value = Player.Health
	$BulletsBar.value=Player.Bullets
	self.position =Vector2(player.position.x-100,player.position.y-100)
