extends Node2D

export var _level_block : PackedScene
"""
Functions dependent on child indexing of Main, DO NOT MESS WITH THE CHILDREN
"""
var switch = true

func _process(delta):
	if get_child(0).position.y < 0 and switch:
		switch = false
		_add_level()
	if get_child(0).position.y < -2870:
		switch = true
		get_child(0).queue_free()

func _add_level():
	var instance = _level_block.instance()
	instance.position.y = 2870
	add_child_below_node(get_child(0), instance)
