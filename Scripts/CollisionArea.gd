extends Area2D

var game_over = false

export var fail_text : PackedScene

func _process(_delta):
	if not get_overlapping_bodies().empty() and not game_over:
		game_over = true
		var text_instance = fail_text.instance()
		add_child(text_instance)
		Signals.emit_signal("game_over_man")
	if not get_overlapping_areas().empty():
		Signals.emit_signal("bounds_hit")

func _input(event):
	if Input.is_action_just_pressed("ui_accept"):
		if game_over:
			_end_game()

func _end_game():
	#copied from https://godotengine.org/qa/554/is-there-a-way-to-close-a-game-using-gdscript
	var currentScene = get_tree().get_current_scene().get_filename()
	get_tree().change_scene(currentScene)

