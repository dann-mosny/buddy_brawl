extends Node

const main_menu_path = "res://MainMenu.tscn"

func _process(delta):
	if Input.is_action_just_pressed("Escape") and SceneTransition.curr_scene_path != main_menu_path:
		GlobalMusicPlayer.get_node("AudioStreamPlayer").stop()
		SceneTransition.transition_to_scene(main_menu_path)
