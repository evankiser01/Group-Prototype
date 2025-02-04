extends CharacterBody2D

@onready var animated_sprite = $AnimationSprite2D
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var attack_def = 0
signal attack


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	$Area2D/tongueCollision.disabled = true
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
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not Input.is_anything_pressed():
			animated_sprite.play("idle")
		
	if Input.is_action_just_pressed("attack"):
		animated_sprite.play("attack")
		
		

	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if Input.is_action_just_pressed("attack") and body.is_in_group("bee"):
		$Area2D/tongueCollision.disabled = false
		attack.emit
		
