extends RigidBody2D

@onready var animated_sprite = $AnimationSprite2D
const SPEED = 200.0
const JUMP_VELOCITY = -400.0
var attacked = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("frog") and attacked:
		animated_sprite.play("hurt")
		$AnimationSprite2D.queue_free()


func _on_frog_attack() -> void:
	attacked = true
