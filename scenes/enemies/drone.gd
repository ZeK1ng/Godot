extends CharacterBody2D


#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0
#
## Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _process(_delta):
	var direction = Vector2.RIGHT
	velocity = direction *100
	move_and_slide()
	
func hit():
	print("dmg")

func _physics_process(_delta):
	#var direction = Vector2.RIGHT
	#velocity = direction * 400
	#move_and_slide()
	#if(position.x > get_viewport_rect().size.x):
		#position.x = 0
	pass
	
