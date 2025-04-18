extends Node3D

var current_story_progress = 0;
var zone;

var check_for_evo = false;
var check_to_evo = 0;

var played_cap = false;

func clear_messages():
	for child in $Gui/Messages.get_children():
		child.visible = false

func _physics_process(delta: float) -> void:
	if Globals.sigma	:
		$Gui/story/Next_Button.visible = true;

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Tap"):
		
		var tap_effect = preload("res://levels/tap_effect.tscn");
		var tap_effect_init = tap_effect.instantiate();
		tap_effect_init.global_position = event.global_position;
		add_child(tap_effect_init);
		
		if Globals.evo_points != 100:
			Globals.evo_points += 1;
			$Gui/Evo_points/ProgressBar.value = Globals.evo_points;
			$Gui/Evo_points/Counter.text = str(Globals.evo_points);
			
		if check_for_evo:
			$Gui/Tutorial/earning/counter.text = str(int($Gui/Tutorial/earning/counter.text) - 1);
			if check_to_evo == Globals.evo_points:
				check_for_evo = false;
				$Gui/story/Next_Button.visible = true;
				
		if Globals.evo_points == 100 and not played_cap:
			played_cap = true;
			$cap_alert.start();
			$Sound_effects/alert.play();
			$Gui/Evo_points/Cap_label.visible = true;

func _on_next_button_button_down() -> void:
	$Sound_effects/submit.play();
	
	# progressing story
	current_story_progress += 1;
	
	# step handling
	match current_story_progress:
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
			$Gui/Tutorial/earning.visible = true;
		4:
			$Gui/story/textblob4.visible = false;
			$Gui/story/textblob5.visible = true;
			$Gui/Tutorial/earning.visible = false;
		5: 
			$Gui/story/textblob5.visible = false;
			$Gui/story/textblob6.visible = true;
			$Gui/story/Next_Button.visible = false;
			$Gui/Zone_points/Madison.visible = true;
		6:
			$Gui/story/textblob6.visible = false;
			$Gui/story/textblob7.visible = true;
			$Gui/story/Next_Button.visible = false;
		7:
			$Gui/story/textblob7.visible = false;
			$Gui/story/textblob8.visible = true;
		8:
			$Infection_Timer.start()
			$Gui/story/textblob8.visible = false;
			$Gui/story/Next_Button.visible = false;
			$Gui/story.visible = false;
			$EPA_timer.start()

# TODO game over and clear_messages() beforehand, transfer user to gameover scene 
func _on_infection_timer_timeout() -> void:
	var children = $Gui/Zone_points.get_child_count();
	# End game
	if children < 1:
		$Gui/QR_Code_share.visible = true
		Engine.time_scale = 0.0
	else:
		$Timer_to_infect.start();
		var zone_id = randi_range(1, children - 1);
		zone = $Gui/Zone_points.get_child(zone_id);
		zone.visible = true;
		var cost = randi_range(10, 70);
		Globals.zone_cost = cost
		zone.get_child(4).text = "Price: " + str(cost) + " Evo"

func _on_timer_to_infect_timeout() -> void:
	if is_instance_valid(zone):
		zone.visible = false;
	$Infection_Timer.wait_time = randi_range(1, 10)
	$Infection_Timer.start();

func _on_zone_refill_timeout() -> void:
	if Globals.evo_points < 100:
		Globals.evo_points += (1 * Globals.infected_zones);
		if Globals.infected_zones > 0:
			$Gui/Evo_points/ProgressBar.value = Globals.evo_points;
			$Gui/Evo_points/Counter.text = str(Globals.evo_points);
			$Gui/Evo_points/Bonus.visible = true;
			$Gui/Evo_points/Bonus/Timer.start();
			$Gui/Evo_points/Cing_sound.play();

func _on_timer_timeout_bonus() -> void:
	$Gui/Evo_points/Bonus.visible = false;

func _on_cap_alert_timeout() -> void:
	played_cap = false;
	$Gui/Evo_points/Cap_label.visible = false;

func _on_epa_timer_timeout() -> void:
	$Gui/News/EPA_filters.visible = true;
	$Sound_effects/News.play()
	$Gui/News/EPA_filters/Timer.start()

func _on_broke_timer_timeout() -> void:
	$Gui/broke_alert.visible = false;
