extends Control
@onready var player: CharacterBody2D = get_parent().get_node("/root/World/Player")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
#	self.position =Vector2(player.position.x-100,player.position.y-100)
	$HealthBar.value = PlayerData.Health
	$BulletsBar.value=PlayerData.Bullet
