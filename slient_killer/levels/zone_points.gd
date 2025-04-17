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
		$"../Evo_points/ProgressBar".value = Globals.evo_points;
		$"../Evo_points/Counter".text = str(Globals.evo_points);
		
		match zone:
			"Madison":
				print("Madison");
				var infected_material = preload("res://assets/materials/infected.tres");
				$"../../zones/Madison/MeshInstance3D".material_override = infected_material;
				$Madison.visible = false;

func madison() -> void:
	infect("Madison");
	$"../story/Next_Button".visible = true;

func A_block() -> void:
	infect("Madison");

func B_block() -> void:
	infect("Madison");

func C_block() -> void:
	infect("Madison");

func Imiddle() -> void:
	infect("Madison");

func Highway() -> void:
	infect("Madison");

func Hotel() -> void:
	infect("Madison");

func Mall() -> void:
	infect("Madison");

func D_block() -> void:
	infect("Madison");

func E_block() -> void:
	infect("Madison");

func F_block() -> void:
	infect("Madison");

func G_block() -> void:
	infect("Madison");

func Park() -> void:
	infect("Madison");

func Elementary() -> void:
	infect("Madison");
