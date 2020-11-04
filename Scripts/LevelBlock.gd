extends Node2D

export var base_scroll_speed : float = 250.0
var scroll_speed : float = 200.0

var orientation = 0
export var multiplier = 50.0

var obstacles

func _ready():
	obstacles = get_child(1)
	Signals.connect("orientation_changed", self, "_change_scroll_speed")
	scroll_speed = base_scroll_speed - multiplier * abs(orientation)

func _process(delta):
	move_local_y(-delta*scroll_speed, false)


func _change_scroll_speed(orientation : int):
	scroll_speed = base_scroll_speed - multiplier * abs(orientation)
