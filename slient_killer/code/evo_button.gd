extends Control

func _on_evo_button_button_down() -> void:
	$"../../Sound_effects/submit".play();
	$"../Evolution_window".visible = true;
