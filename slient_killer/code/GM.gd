extends Node3D

var evo_points = 0;

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tap"):
		if evo_points != 100:
			evo_points += 1;
			$Gui/Evo_points/ProgressBar.value = evo_points
			$Gui/Evo_points/Counter.text = str(evo_points)
