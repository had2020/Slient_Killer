extends Control

func _on_timer_timeout() -> void:
	for child in self.get_children():
		child.queue_free();
	self.queue_free();
