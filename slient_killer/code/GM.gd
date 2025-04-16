extends Node3D

var current_story_progress = 0;
var zone;

var check_for_evo = false;
var check_to_evo = 0;

func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tap"):
		if Globals.evo_points != 100:
			Globals.evo_points += 1;
			$Gui/Evo_points/ProgressBar.value = Globals.evo_points;
			$Gui/Evo_points/Counter.text = str(Globals.evo_points);
		if check_for_evo:
			if check_to_evo == Globals.evo_points:
				check_for_evo = false;
				$Gui/story/Next_Button.visible = true;

func _on_next_button_button_down() -> void:
	# progressing story
	current_story_progress += 1;
	
	# step handling
	match current_story_progress:
		8:
			$Infection_Timer.start()
		1:
			$Gui/story/textblob.visible = false;
			$Gui/story/textblob2.visible = true;
		2:
			$Gui/story/textblob2.visible = false;
			$Gui/story/textblob3.visible = true;
		3:
			$Gui/story/textblob3.visible = false;
			$Gui/story/textblob4.visible = true;
			$Gui/story/Next_Button.visible = false;
			check_for_evo = true;
			check_to_evo = Globals.evo_points + 10;
		4:
			$Gui/story/textblob4.visible = false;
			$Gui/story/textblob5.visible = true;
		5: 
			$Gui/story/textblob5.visible = false;
			$Gui/story/textblob6.visible = true;
			$Gui/story/Next_Button.visible = false;
			$Gui/Zone_points/Madison.visible = true;

func _on_infection_timer_timeout() -> void:
	$Timer_to_infect.start();
	var children = $Gui/Zone_points.get_child_count();
	var zone_id = randi_range(1, children - 1);
	zone = $Gui/Zone_points.get_child(zone_id);
	zone.visible = true;


func _on_timer_to_infect_timeout() -> void:
	zone.visible = false;
	$Infection_Timer.wait_time = randi_range(1, 10)
	$Infection_Timer.start();
