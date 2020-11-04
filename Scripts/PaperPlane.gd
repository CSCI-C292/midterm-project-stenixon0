extends Node2D

export var _timer_threshold = 0.1

var _timer = 0

var orientation : int = 0

var xvel : float = 0

export var basevel : float = 75.0

export(Resource) var planesprites = planesprites as PlaneSprites
var current_sprite : Sprite

func _ready():
	xvel = basevel * orientation
	current_sprite = get_child(0)
	Signals.connect("bounds_hit", self, "_bounds_hit")
	Signals.connect("game_over_man", self, "_game_over_man")

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

func _bounds_hit():
	orientation = 0
	if position.x < 0:
		position.x = 0
	if position.x > 560:
		position.x = 560
	_change_sprite()
	Signals.emit_signal("orientation_changed", orientation)

func _change_orientation(changeleft : bool):
	if changeleft:
		if orientation > -2:
			orientation -= 1
			Signals.emit_signal("orientation_changed", orientation)
	else:
		if orientation < 2:
			orientation += 1
			Signals.emit_signal("orientation_changed", orientation)
	_change_sprite()
	xvel = orientation * basevel
	#print_debug("X velocity: " + String(xvel) + "  Orientation: " + String(orientation))

func _change_sprite():
	#flip sprite to represent left/right facing
	if orientation < 0:
		current_sprite.flip_h = true
	elif orientation > 0:
		current_sprite.flip_h = false
	
	#change texture of sprite to match orientation
	if orientation == 0:
		current_sprite.set_texture(planesprites.ninety)
	elif abs(orientation) == 1:
		current_sprite.set_texture(planesprites.forty_five)
	elif abs(orientation) == 2:
		current_sprite.set_texture(planesprites.zero)

func _game_over_man():
	current_sprite.visible = false
