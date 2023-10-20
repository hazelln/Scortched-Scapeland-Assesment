extends KinematicBody2D

const GRAVITY = 1000
var velocity = Vector2.ZERO
var speed = 0
onready var animation = $AnimatedSprite
onready var sprite = $Sprite 
var start_position = Vector2.ZERO
var health = 30
var score = 0 
onready var score_label = $Camera2D/Score
func _ready():
	start_position = position

#func _process(delta):
		 #if position.y > 480 :
			 #position = start_position
func take_damage():
	print("I collided with ")


	
func respwan():
	position = start_position

func _physics_process(delta):
	# Check if the character is grounded (on the floor)
	var is_grounded = is_on_floor()
	
	
	if is_grounded:
	# Handle horizontal movement
		if speed == 0:
		# If the character is not moving, set a default animation
			animation.play("default")
		else:
		# If the character is moving, set a running animation
			animation.play("run")

	else:
		if velocity.y < 0:
			animation.play("jump up")
		else:
			animation.play("jump down")

	# Calculate the horizontal velocity based on input
	velocity.x = Input.get_action_strength("right") * 500 - Input.get_action_strength("left") * 500
	velocity.y += GRAVITY * delta
	
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

	if position.y > 10000:
		position = start_position


func _on_Coin_body_entered(body):
	score += 1
	score_label.text = "score " + str(score)
	#if body.name == "Playerr":
	if score == 20 :
		# after the player has 20 coins change to the win scene 
		get_tree().change_scene("res://Win.tscn")
	

		#get_node("/root/Playerr").score += 5
		#queue_free()
	pass # Replace with function body.


func _on_Spike_body_entered(body):
	health == -1
	score_label.text = "health " + str(health)
