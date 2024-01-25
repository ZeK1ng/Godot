extends ParentLevel

var drone_scene: PackedScene = preload("res://scenes/enemies/drone.tscn")
@export var inside_scene: PackedScene
const default_player_zoom = Vector2(0.5,0.5)
const house_player_zoom = Vector2(1,1)

func _on_gate_player_entered_gate(body):
	get_tree().change_scene_to_packed(inside_scene)
	
# Called when the node enters the scene tree for the first time.	
func _ready():
	$DroneSpawnTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
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
