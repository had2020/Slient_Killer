extends Camera3D

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("esc"):
		get_tree().quit()
