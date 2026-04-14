extends Node2D


func _ready():
	if not GlobalMusicPlayer.get_node("MenuMusicStreamPlayer").playing:
		GlobalMusicPlayer.play_menu_music()


func _on_play_button_button_down():
	SceneTransition.transition_to_scene("res://LevelSelect.tscn")


func _on_help_button_pressed():
	SceneTransition.transition_to_scene("res://Help.tscn")


func _on_credits_button_pressed():
	SceneTransition.transition_to_scene("res://Credits.tscn")
