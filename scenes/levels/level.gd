extends Node2D
class_name ParentLevel
var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_player_laser(laser_position, _laser_direction):
	var laser = laser_scene.instantiate()
	laser.position = laser_position
	laser.direction = _laser_direction
	laser.rotation_degrees = rad_to_deg(_laser_direction.angle()) +90
	$Projectiles.add_child(laser)
	$PlayerUI.update_laser_text()

func _on_player_grenade(grenade_position, grenade_direction):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = grenade_position
	grenade.linear_velocity = grenade.speed * grenade_direction
	$Projectiles.add_child(grenade)
	$PlayerUI.update_grenade_text()
