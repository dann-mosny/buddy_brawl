extends Node2D


func _on_first_level_button_pressed():
	GlobalMusicPlayer.stop_menu_music()
	GlobalMusicPlayer.play_level_music()
	StaticVariables.level_selected = 0
	SceneTransition.transition_to_scene("res://main_scene.tscn")


func _on_second_level_button_pressed():
	GlobalMusicPlayer.stop_menu_music()
	GlobalMusicPlayer.play_level_music()
	StaticVariables.level_selected = 1
	SceneTransition.transition_to_scene("res://main_scene.tscn")


func _on_third_level_button_pressed():
	GlobalMusicPlayer.stop_menu_music()
	GlobalMusicPlayer.play_level_music()
	StaticVariables.level_selected = 2
	SceneTransition.transition_to_scene("res://main_scene.tscn")


func _on_back_button_pressed():
	SceneTransition.transition_to_scene("res://MainMenu.tscn")
