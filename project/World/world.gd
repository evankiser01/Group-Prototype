extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var audio_player = $MainMusic
	audio_player.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
