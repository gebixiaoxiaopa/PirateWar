extends CharacterBody2D
@onready var Plank = preload("res://classes/planks/plank.tscn")
@onready var Enemy= preload("res://classes/enemy/enemy.tscn")
var mouse_pos = 0
var pos = (self.global_position)
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var Bullet = preload("res://classes/bullet/bullet.tscn")
func _ready() -> void:
	pass # Replace with function body.
func _process(delta: float) -> void:
	if PlayerData.Health ==0:
		get_tree().change_scene_to_file("res://assets/gui/restart_screen.tscn")
	velocity = Vector2(0,0)
	mouse_pos = get_global_mouse_position()
	if Input.is_action_pressed("move"):
		var direction = (mouse_pos-position).normalized()
		velocity=(direction*PlayerData.Speed)
	move_and_slide()
	look_at(mouse_pos)
	pos = (self.global_position)
	Shoot()
func _on_timer_timeout() -> void:
	GenEnemy()
	GenPlank()
func Shoot()->void:
	if PlayerData.Bullet>0 and Input.is_action_just_pressed("Shoot"):
		PlayerData.Bullet -=1
		var temp = Bullet.instantiate()
		add_sibling(temp)
		temp.global_position = $Marker2D.global_position
		# this sets the rotation as to where it will fire
		temp.set("dir", (get_global_mouse_position() - self.global_position).normalized())
		# These statements below handle camera shake
		
func GenEnemy()->void:
	var new_enemy = Enemy.instantiate()
	new_enemy.global_position = Vector2(randf_range(self.global_position.x+1152/2,self.global_position.x-1152/2)+1152/1.1,randf_range(self.global_position.y+648/2,self.global_position.y-648/2)+648/1.1)
	get_parent().add_child(new_enemy)
	$Timer.wait_time = randi_range(1,10)
func GenPlank()->void:
	var new_plank = Plank.instantiate()
	new_plank.global_position = Vector2(randf_range(self.global_position.x+1152/2,self.global_position.x-1152/2)+1152/1.1,randf_range(self.global_position.y+648/2,self.global_position.y-648/2)+648/1.1)
	get_parent().add_child(new_plank)
func _on_hurtbox_hurt(hitbox) -> void:
	if hitbox.owner.is_in_group("enemy"):
		PlayerData.Health-=1
	if hitbox.owner.is_in_group("plank"):
		if PlayerData.Health!=10:
			PlayerData.Health+=1
		
	



