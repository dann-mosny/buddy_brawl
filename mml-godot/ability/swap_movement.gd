extends Ability

class_name SwapMovement

func _init():
	cooldown = 20
	duration = 5
	time = 15
	icon_texture = load("res://imgs/concussion-1.png")
	ability_index = 0
	
func _activate(player):
	if not super._activate(player):
		return false

	var pom  = player.left_input
	player.left_input = player.right_input
	player.right_input = pom

	var animation = player.get_node("StarsAroundHead")
	animation.play("default")
	player.get_node("Stars").visible = true

	return true
	
func _deactivate(player):
	super._deactivate(player)

	var pom  = player.left_input
	player.left_input = player.right_input
	player.right_input = pom

	var animation = player.get_node("StarsAroundHead")
	animation.stop()
	player.get_node("Stars").visible = false

	return true

