extends RigidBody2D


var speed:int = 400

func explode():
	$AnimationPlayer.play('explosion_animation')
