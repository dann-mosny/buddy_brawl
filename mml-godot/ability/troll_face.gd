extends Ability

class_name TrollFace


func _init():
	cooldown = 15
	duration = 5
	time = 10
	icon_texture = load("res://imgs/blind.png")
	ability_index = 2

func _activate(player: Player):
	if not super._activate(player):
		return false

	player.get_node("TrollFace").visible = true
	return true

func _deactivate(player: Player):
	super._deactivate(player)

	player.get_node("TrollFace").visible = false
	return true

