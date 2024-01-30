extends CharacterBody2D
var has_grenade = true
var has_laser = true
var player_speed = 500
signal laser(laser_position, laser_direction)
signal grenade(grenade_position, grenade_direction)
signal reload()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * player_speed
	move_and_slide()
	look_at(get_global_mouse_position())
	handle_actions()
		
func handle_actions():
	if Input.is_action_pressed("sprint"):
		player_speed = 1000
	else:
		player_speed = 500
	var direction = (get_global_mouse_position() - position).normalized()	
	if Input.is_action_pressed("primary") and has_laser and Globals.laser_current_ammo>0:
		Globals.laser_current_ammo -=1
		$GPUParticles2D.emitting=true
		#Randomly select a marker 2d for the laser startin position
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser_position = laser_markers[randi() % laser_markers.size()]
		has_laser = false
		$LaserTimer.start()
		#emit the selected position to catch when rendering laser
		laser.emit(selected_laser_position.global_position, direction)
	
	if Input.is_action_pressed("secondary") and has_grenade and Globals.grenade_current_ammo>0:
		Globals.grenade_current_ammo -=1
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenade_marker = grenade_markers[randi() % grenade_markers.size()]
		has_grenade = false
		$GrenadeTimer.start()
		#direction between 2 vectors. Needs normalization because of the possible mouse positions.
		grenade.emit(selected_grenade_marker.global_position, direction)
		
	if Input.is_action_pressed("reload"):
		Globals.laser_current_ammo = Globals.laser_max_ammo
		Globals.grenade_current_ammo = Globals.grenade_max_ammo
		reload.emit()
		
func _on_grenade_timer_timeout():
	has_grenade = true

func _on_laser_timer_timeout():
	has_laser = true
