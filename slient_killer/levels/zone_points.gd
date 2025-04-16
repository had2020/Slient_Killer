extends Control


#var uninfected = [];

#func _ready() -> void:
	#var child_count = self.get_child_count();
	#for child_number in child_count:
		#uninfected.append(self.get_child(child_number));

func infect(zone: String):
	if Globals.zone_cost < Globals.evo_points:
		Globals.evo_points -= Globals.zone_cost;
		Globals.infected_zones += 1;
		match zone:
			"Madison":
				print("working");

func madison() -> void:
	infect("Madison");

func A_block() -> void:
	pass # Replace with function body.

func B_block() -> void:
	pass # Replace with function body.

func C_block() -> void:
	pass # Replace with function body.

func Imiddle() -> void:
	pass # Replace with function body.

func Highway() -> void:
	pass # Replace with function body.

func Hotel() -> void:
	pass # Replace with function body.

func Mall() -> void:
	pass # Replace with function body.

func D_block() -> void:
	pass # Replace with function body.

func E_block() -> void:
	pass # Replace with function body.

func F_block() -> void:
	pass # Replace with function body.

func G_block() -> void:
	pass # Replace with function body.

func Park() -> void:
	pass # Replace with function body.

func Elementary() -> void:
	pass # Replace with function body.
