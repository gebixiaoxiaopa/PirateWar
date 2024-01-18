extends TileMap
@onready var player = get_parent().get_node("Player")
var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()
var width = 64
var height =64

var loaded_chunck =[]
@onready var Enemy = preload("res://classes/enemy/enemy.tscn")
func _ready() -> void:
	
	moisture.seed = WorldOptions.Seed
	temperature.seed = WorldOptions.Seed
	altitude.seed = WorldOptions.Seed
	altitude.frequency =0.01
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var player_pos = local_to_map(player.position)
	gen_chunk(player_pos)
	
func gen_chunk(pos:Vector2)->void:
	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(pos.x-(width/2)+x,pos.y -(height/2)+y) * 10
			var temp = temperature.get_noise_2d(pos.x-(width/2)+x,pos.y -(height/2)+y) * 10
			var alt = altitude.get_noise_2d(pos.x-(width/2)+x,pos.y -(height/2)+y) * 1
			if alt<0:
				set_cell(0,Vector2i(pos.x-(width/2)+x,pos.y -(height/2)+y),0,Vector2(8,4))
				
			else:
				set_cell(1,Vector2i(pos.x-(width/2)+x,pos.y -(height/2)+y),0,Vector2(3,4))



