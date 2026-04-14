extends Node2D

func _ready():
	$AnimationPlayer.play("fade_in")
	$Timer.start()
	await $Timer.timeout
	SceneTransition.transition_to_scene("res://MainMenu.tscn")
