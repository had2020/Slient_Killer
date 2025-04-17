extends Control

func _on_button_button_down() -> void:
	$"../../Sound_effects/submit".play();
	self.visible = false;
