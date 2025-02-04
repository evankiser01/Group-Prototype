extends CharacterBody2D

@onready var animated_sprite = $AnimationSprite2D
@onready var frog_croak = $FrogCroakSound
@onready var frog_walk = $FrogWalkSound

const SPEED = 200.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	#if Input.is_action_just_pressed("jump") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		if (velocity.x > 0):
			animated_sprite.scale.x = 1
		if (velocity.x < 0):
			animated_sprite.scale.x = -1
		
		animated_sprite.play("hop")
		frog_croak.play()
		#frog_walk.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle")
		frog_walk.play()
		#frog_croak.play()


	move_and_slide()
