extends Node2D

export var _timer_threshold = 0.1

var _timer = 0

var orientation : int = 0

var xvel : float = 0

var basevel : float = 100.0

func _process(delta):
	move_local_x(delta * xvel)
	_timer += delta
	if(_timer > _timer_threshold):
		_timer = 0
		_input_handler()

func _input_handler():
	if Input.is_action_pressed("Close"):
		get_tree().quit()
	var _leftpressed = Input.is_action_pressed("ui_left")
	var _rightpressed = Input.is_action_pressed("ui_right")
	
	if _leftpressed and _rightpressed:
		pass
	elif _leftpressed:
		_change_orientation(true)
	elif _rightpressed:
		_change_orientation(false)

func _change_orientation(changeleft : bool):
	if changeleft:
		if orientation > -3:
			orientation -= 1
	else:
		if orientation < 3:
			orientation += 1
	xvel = orientation * basevel
	print_debug("X velocity: " + String(xvel) + "Orientation: " + String(orientation))
