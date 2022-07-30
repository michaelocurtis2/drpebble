extends TileMap


func _ready():
	for tile_pos in get_used_cells():
		
		Global.rng.randomize()
		var tile = Global.rng.randi_range(1, 6)
		
		Global.rng.randomize()
		var flip_x = Global.rng.randi_range(0, 1)
		
		Global.rng.randomize()
		var flip_y = Global.rng.randi_range(0, 1)
		
		Global.rng.randomize()
		var transpose = Global.rng.randi_range(0, 1)
		
		set_cellv(tile_pos, tile, flip_x, flip_y, transpose)
