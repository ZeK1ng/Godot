extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var drone_scene: PackedScene = preload("res://scenes/enemies/drone.tscn")
const default_player_zoom = Vector2(0.5,0.5)
const house_player_zoom = Vector2(1,1)

func _on_gate_player_entered_gate(body):
	print("player entered gate")
	print(body)

func _ready():
	$DroneSpawnTimer.start()

func _on_player_laser(laser_position, _laser_direction):
	var laser = laser_scene.instantiate()
	laser.position = laser_position
	laser.direction = _laser_direction
	laser.rotation_degrees = rad_to_deg(_laser_direction.angle()) +90
	$Projectiles.add_child(laser)

func _on_player_grenade(grenade_position, grenade_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_position
	grenade.linear_velocity = grenade.speed * grenade_direction
	$Projectiles.add_child(grenade)

func _on_house_player_entered():
	set_player_zoom(house_player_zoom)

func _on_house_player_exit():
	set_player_zoom(default_player_zoom)
	
func set_player_zoom(zoom):
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",zoom,1)

func _on_drone_spawn_timer_timeout():
	var drone = drone_scene.instantiate() as CharacterBody2D
	drone.position = Vector2(153,828)
	$".".add_child(drone)
