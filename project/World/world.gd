extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var background_music = $AudioStreamPlayer
	background_music.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
