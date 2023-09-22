extends KinematicBody2D

const GRAVITY = 1000
var velocity = Vector2.ZERO
var speed = 0
onready var animation = $AnimatedSprite
onready var sprite = $Sprite 

func _physics_process(delta):
	# Check if the character is grounded (on the floor)
	var is_grounded = is_on_floor()
	
	# Handle horizontal movement
	if speed == 0:
		# If the character is not moving, set a default animation
		animation.play("default")
	else:
		# If the character is moving, set a running animation
		animation.play("run")

	# Calculate the horizontal velocity based on input
	velocity.x = Input.get_action_strength("right") * 200 - Input.get_action_strength("left") * 200
	
	if velocity.x > 0:
		$AnimatedSprite.flip_h = false
	elif velocity.x <0:
		$AnimatedSprite.flip_h = true

	# Apply gravity
	velocity.y += GRAVITY * delta

	# Handle jumping
	if is_grounded and Input.is_action_just_pressed("jump"):
		velocity.y = -1000
	
	# Move and slide the character
	move_and_slide(velocity, Vector2.UP)

	# Remember the last speed
	speed = velocity.x
