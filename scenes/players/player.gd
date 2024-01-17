extends CharacterBody2D
var has_grenade = true
var has_laser = true
signal laser(laser_position)
signal grenade(grenade_position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	handle_actions()
	
		
func handle_actions():
	if Input.is_action_pressed("primary") and has_laser:
		#Randomly select a marker 2d for the laser startin position
		var laser_markers = $LaserStartPositions.get_children()
		var selected_laser_position = laser_markers[randi() % laser_markers.size()]
		has_laser = false
		$LaserTimer.start()
		#emit the selected position to catch when rendering laser
		laser.emit(selected_laser_position.global_position)
	
	if Input.is_action_pressed("secondary") and has_grenade:
		var grenade_markers = $GrenadeStartPositions.get_children()
		var selected_grenade_marker = grenade_markers[randi() % grenade_markers.size()]
		has_grenade = false
		$GrenadeTimer.start()
		print(selected_grenade_marker.global_position)
		grenade.emit(selected_grenade_marker.global_position)

func _on_grenade_timer_timeout():
	has_grenade = true


func _on_laser_timer_timeout():
	has_laser = true
