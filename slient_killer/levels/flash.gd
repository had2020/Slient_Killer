extends Control

func _on_timer_timeout() -> void:
	self.get_parent().visible = false
