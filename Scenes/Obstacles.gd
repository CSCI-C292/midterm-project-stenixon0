extends TileMap


func _ready():
	var last_blank = 3
	for y in range(2, 9):
		var blank = randi() % 7
		if last_blank == blank:
			#discourages picking the same number (but doesn't prohibit repeats)
			blank = randi() % 7
		for x in range(8):
			if x == blank:
				_set_cellv(Vector2(x, y * 5), -1)
			elif x == blank + 1:
				_set_cellv(Vector2(x, y * 5), -1)
			else:
				_set_cellv(Vector2(x, y * 5), 0)
		last_blank = blank
		

func _set_cellv(pos, tile, flip_x = false, flip_y = false, transpose = false):
	set_cellv(pos, tile, flip_x, flip_y, transpose)
