extends TileMap

export var score_trigger : PackedScene

#func _ready():
#	var last_blank = 8
#	for y in range(2, 7):
#		#add score trigger
#		var instance = score_trigger.instance()
#		instance.position.y = y * 7
#		add_child(instance)
#		#generate blank space
#		var blank = randi() % 15
#		if last_blank == blank:
#			#discourages picking the same number (but doesn't prohibit repeats)
#			blank = randi() % 15
#		for x in range(16):
#			if x == blank:
#				_set_cellv(Vector2(x, y * 7), -1)
#			elif x == blank + 1 or x == blank - 1:
#				_set_cellv(Vector2(x, y * 7), -1)
#			else:
#				_set_cellv(Vector2(x, y * 7), 0)
#		last_blank = blank

func _ready():
	var last_blank = 0
	#35 per tile
	#1400 effective space
	#40 available spaces
	for ypos in range(2, 38, 8):
		#add score trigger
		#TODO:
#		#remove score_trigger instance and implement custom tile with area2D 
#		that emits score accumulation
#		var instance = score_trigger.instance()
#		instance.position.y = ypos * 35 + 35
#		add_child(instance)
#		print_debug(instance.position.y)
		#generate blank_space
		var blank = 1 + randi() % 14
		for x in range(16):
			if x == blank:
				_set_cellv(Vector2(x, ypos), -1)
			elif x == blank + 1 or x == blank - 1:
				_set_cellv(Vector2(x, ypos), -1)
			else:
				_set_cellv(Vector2(x, ypos), 0)
		last_blank = blank

func _set_cellv(pos, tile, flip_x = false, flip_y = false, transpose = false):
	set_cellv(pos, tile, flip_x, flip_y, transpose)
