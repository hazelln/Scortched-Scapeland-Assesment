extends KinematicBody2D

const GRAVITY = 1000
var velocity = Vector2.ZERO

var playername = "Munhu"


func _physics_process(delta):
	print("Hello there players<3")
	print(playername)
	velocity.x =  Input.get_axis("left","right") * 200
	velocity.y +=  GRAVITY * delta
	move_and_slide(velocity,Vector2.UP)
	if Input.is_action_just_pressed("jump"):
			velocity.y = -200
