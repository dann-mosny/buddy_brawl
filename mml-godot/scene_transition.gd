extends Node2D

var curr_scene_path = GlobalControls.main_menu_path

func transition_to_scene(next_scene_path):
	$AnimationPlayer.play("fade")
	await $AnimationPlayer.animation_finished
	get_tree().change_scene_to_file(next_scene_path)
	$AnimationPlayer.play_backwards("fade")
	curr_scene_path = next_scene_path
