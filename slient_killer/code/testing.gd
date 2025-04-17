extends Panel



func _ready() -> void:
	var size = self.get_rect()
	var rand_x = randf_range(0, size.position.x)
	var rand_y = randf_range(0, size.position.y)
	var point_position = Vector2(rand_x, rand_y)
	
	
