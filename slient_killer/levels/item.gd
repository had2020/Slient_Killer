extends Control

@export var cost = 0;

var brought = false;

func _ready() -> void:
	$price_msg.text = "Buy: " + str(cost) + " points";

func _on_button_button_down() -> void:
	if not brought:
		if Globals.evo_points >= cost:
			Globals.evo_points -= cost;
			$Cing.play();
			brought = true;
			$price_msg.text = "Brought";
			$price_msg.set_modulate(Color(1, 255, 1, 255));
			Globals.sigma = true;
			self.get_parent().get_parent().visible = false;
		else:
			$error_msg.visible = true;
			$Error.play();
			$Error_timer.start();

func _on_error_timer_timeout() -> void:
	$error_msg.visible = false;
