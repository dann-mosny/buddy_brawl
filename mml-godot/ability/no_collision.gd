extends Ability

class_name NoCollision


func _init():
	cooldown = 45
	duration = 0.5
	time = 20
	icon_texture = load("res://imgs/ghost.png")
	ability_index = 1

func _activate(player: Player):
	if not super._activate(player):
		return false

	player.set_collision_mask_value(2, false)
	
	player.get_node("Biden-final-12").modulate = Color(1, 1, 1, 0.5)
	return true

func _deactivate(player: Player):
	if player.get_node("Area2D").has_overlapping_bodies():
		return false
	
	super._deactivate(player)

	player.set_collision_mask_value(2, true)
	player.get_node("Biden-final-12").modulate = Color(1, 1, 1, 1)
	return true
