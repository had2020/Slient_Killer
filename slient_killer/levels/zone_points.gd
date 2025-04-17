extends Control


#var uninfected = [];

#func _ready() -> void:
	#var child_count = self.get_child_count();
	#for child_number in child_count:
		#uninfected.append(self.get_child(child_number));

func infect(zone: String):
	$"../../Cough_effect".play(2.3)
	if Globals.zone_cost < Globals.evo_points:
		Globals.evo_points -= Globals.zone_cost;
		Globals.infected_zones += 1;
		$"../Evo_points/ProgressBar".value = Globals.evo_points;
		$"../Evo_points/Counter".text = str(Globals.evo_points);
		
		match zone:
			"Madison":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Madison/MeshInstance3D".material_override = infected_material;
				$Madison.queue_free()
			"A_Block":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/A_Block/MeshInstance3D".material_override = infected_material;
				$"A block".queue_free()
			"B_Block":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/B_Block/MeshInstance3D".material_override = infected_material;
				$"B block".queue_free()
			"C_Block":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/C_Block/MeshInstance3D".material_override = infected_material;
				$"C block".queue_free()
			"Hotel":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Hotel/MeshInstance3D".material_override = infected_material;
				$"Hotel".queue_free()
			"Mall":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Mall/MeshInstance3D".material_override = infected_material;
				$"Mall".queue_free()
			"Park":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Park/MeshInstance3D".material_override = infected_material;
				$"Park".queue_free()
			"D_Block":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/D_Block/MeshInstance3D".material_override = infected_material;
				$"D block".queue_free()
			"F_Block":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/F_Block/MeshInstance3D".material_override = infected_material;
				$"F Block".queue_free()
			"E_Block":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/E_Block/MeshInstance3D".material_override = infected_material;
				$"E block".queue_free()
			"G_Block":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/G_Block/MeshInstance3D".material_override = infected_material;
				$"G block".queue_free()
			"Highway":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Highway/MeshInstance3D".material_override = infected_material;
				$"Highway".queue_free()
			"Elementary":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Elementary/MeshInstance3D".material_override = infected_material;
				$"Elementary".queue_free()
			"Imiddle":
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Imiddle/MeshInstance3D".material_override = infected_material;
				$"Imiddle".queue_free()

func madison() -> void:
	infect("Madison");
	$"../story/Next_Button".visible = true; 

func A_block() -> void:
	infect("A_Block");

func B_block() -> void:
	infect("B_Block");

func C_block() -> void:
	infect("C_Block");

func Imiddle() -> void:
	infect("Imiddle");

func Highway() -> void:
	infect("Highway");

func Hotel() -> void:
	infect("Hotel");

func Mall() -> void:
	infect("Mall");

func D_block() -> void:
	infect("D_Block");

func E_block() -> void:
	infect("E_Block");

func F_block() -> void:
	infect("F_Block");

func G_block() -> void:
	infect("G_Block");

func Park() -> void:
	infect("Park");

func Elementary() -> void:
	infect("Elementary");
