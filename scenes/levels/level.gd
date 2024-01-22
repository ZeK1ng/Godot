extends Node2D
class_name ParentLevel
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
var drone_scene: PackedScene = preload("res://scenes/enemies/drone.tscn")
const default_player_zoom = Vector2(0.5,0.5)
const house_player_zoom = Vector2(1,1)

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
