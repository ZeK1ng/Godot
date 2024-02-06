extends CanvasLayer

@onready var laser_lable = $"Laser Counter/VBoxContainer/Label"
@onready var grenade_lable = $"Grenade Counter/VBoxContainer/Label"
@onready var laser_ammo_icon = $"Laser Counter/VBoxContainer/TextureRect"
@onready var grenade_ammo_icon = $"Grenade Counter/VBoxContainer/TextureRect"
var green:Color = Color("4f932f")
var red:Color = Color("a94308")

func _ready():
	laser_lable.text = str(Globals.laser_current_ammo)
	grenade_lable.text = str(Globals.grenade_current_ammo)
	laser_lable.modulate = green
	grenade_lable.modulate = green
	laser_ammo_icon.modulate = green
	grenade_ammo_icon.modulate = green
	
func update_laser_text():
	laser_lable.text = str(Globals.laser_current_ammo)
	updateColor(laser_lable, laser_ammo_icon, Globals.laser_current_ammo)

func update_grenade_text():
	grenade_lable.text=str(Globals.grenade_current_ammo)
	updateColor(grenade_lable, grenade_ammo_icon, Globals.grenade_current_ammo)
	
func updateColor(lable, icon, ammo_count):
	if ammo_count == 0:
		lable.modulate = red
		icon.modulate = red
	else:
		lable.modulate = green
		icon.modulate = green
