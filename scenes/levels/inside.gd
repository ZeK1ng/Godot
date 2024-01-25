extends ParentLevel

@export var outside_level_scene:PackedScene


func _on_exit_body_entered(body):
	outside_level_scene.get_script()
	get_tree().change_scene_to_file("res://scenes/levels/outside.tscn")
