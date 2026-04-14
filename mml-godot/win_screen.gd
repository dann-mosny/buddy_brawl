extends Node2D

func _ready():
	$AnimationPlayer.play("win_idle")

func _on_button_pressed():
	GlobalMusicPlayer.stop_level_music()
	SceneTransition.transition_to_scene("res://LevelSelect.tscn")
