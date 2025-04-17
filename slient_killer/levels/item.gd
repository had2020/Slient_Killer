extends Control

@export var cost = 0;

func _on_button_button_down() -> void:
	if Globals.evo_points >= cost:
		Globals.evo_points -= cost;
		$Cing.play();
	else:
		$error_msg.visible = true;
		$Error.play();
		$Error_timer.start();

func _on_error_timer_timeout() -> void:
	$error_msg.visible = false;
