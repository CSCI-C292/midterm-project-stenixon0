extends Node2D

class_name LevelBlock

export var base_scroll_speed : float = 250.0
var scroll_speed : float = 250.0

export var multiplier = 50.0

func _ready():
	Signals.connect("orientation_changed", self, "_change_scroll_speed")

func _process(delta):
	move_local_y(-delta*scroll_speed, false)


func _change_scroll_speed(orientation : int):
	scroll_speed = base_scroll_speed - multiplier * abs(orientation)
