extends Node2D

export var scroll_speed : float = 100.0

func _process(delta):
	move_local_y(-delta*scroll_speed, false)
