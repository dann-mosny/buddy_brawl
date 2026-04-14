extends Camera2D

@export var FollowingPlayer : CharacterBody2D

func _ready():
	global_position = FollowingPlayer.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#position = FollowingPlayer.position
	var target_position = FollowingPlayer.position
	var camera_position = position

	var offset = target_position - camera_position

	global_position += offset * 0.05
