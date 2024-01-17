extends Node2D

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")
func _on_gate_player_entered_gate(body):
	print("player entered gate")
	print(body)


func _on_player_laser(laser_position):
	var laser = laser_scene.instantiate()
	laser.position = laser_position
	$Projectiles.add_child(laser)


func _on_player_grenade(grenade_position):
	var grenade = grenade_scene.instantiate()
	grenade.position = grenade_position
	$Projectiles.add_child(grenade)

