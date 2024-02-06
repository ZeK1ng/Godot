extends Node
signal reload

var laser_max_ammo = 20
var grenade_max_ammo = 5
var laser_current_ammo = laser_max_ammo :
	get:
		return laser_current_ammo
	set(value):
		laser_current_ammo = value
		if(value == laser_max_ammo):
			reload.emit()
			
var grenade_current_ammo = grenade_max_ammo


