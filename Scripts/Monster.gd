extends KinematicBody2D

const SPEED = 10
const GRAVITY = 500
const ATTACK_DAMAGE = 10

var velocity = Vector2()
var direction = 1 
var is_attacking = false
var health 

func _physics_process(delta):
	# Apply gravity
	velocity.y += GRAVITY * delta

	velocity.x = SPEED * direction

	#if is_attacking:

	move_and_slide(velocity, Vector2(0, -1))

	# Change direction when hitting a wall
	if is_on_wall():
		direction = -direction
		$AnimatedSprite.scale.x = direction  
		
	if velocity.x > 0:
		$AnimatedSprite.flip_h = true
	elif velocity.x <0:
		$AnimatedSprite.flip_h = false

func _on_EnemyBodyEntered(body):
	if body.has_method("take_damage"):
		body.take_damage(ATTACK_DAMAGE)
		is_attacking = true

func _on_EnemyBodyExited(body):
	if body.has_method("take_damage"):
		is_attacking = false


func _on_Monster_child_entered_tree(node):
	
	
	pass # Replace with function body.
