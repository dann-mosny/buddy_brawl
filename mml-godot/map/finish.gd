extends Area2D

func _ready():
	$AnimationPlayer.play("default")


func _on_body_entered(body):
	GlobalMusicPlayer.stop_level_music()
	GlobalMusicPlayer.play_menu_music()

	if body.identifier == "left":
		SceneTransition.transition_to_scene("res://LeftWinScreen.tscn")
	else:
		SceneTransition.transition_to_scene("res://RightWinScreen.tscn")
