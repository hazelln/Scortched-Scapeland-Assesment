extends KinematicBody2D

const GRAVITY = 1000
var velocity = Vector2.ZERO




func _physics_process(delta):

	velocity.x =  Input.get_axis("left","right") * 200
	velocity.y +=  GRAVITY * delta
	move_and_slide(velocity,Vector2.UP)
	if Input.is_action_just_pressed("jump"):
			velocity.y = -200
	
	
