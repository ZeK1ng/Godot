extends ParentLevel


func _on_exit_body_entered(body):
	LevelTransitionLayer.change_scene("res://scenes/levels/outside.tscn")
