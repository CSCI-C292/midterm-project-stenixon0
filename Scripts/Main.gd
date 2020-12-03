extends Node2D

export var _level_block : PackedScene
"""
Functions dependent on child indexing of Main 
DO NOT MESS WITH THE ORDER OF THE CHILDREN

Still isn't perfect, spawning new levels leaves a small gap
"""
var switch = false


func _process(delta):
	var first_child : LevelBlock = get_child(0)
	if first_child.position.y < 0 and switch:
		switch = false
		_add_level(first_child.scroll_speed)
	elif first_child.position.y < -1400:
		switch = true
		get_child(0).queue_free()

func _add_level(scroll_speed):
	var instance = _level_block.instance()
	instance.scroll_speed = scroll_speed
	instance.position.y = 1400
	add_child_below_node(get_child(0), instance)
