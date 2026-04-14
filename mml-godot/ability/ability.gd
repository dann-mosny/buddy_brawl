
class_name Ability

var cooldown : float = 10
var duration : float = 5
var was_deactive: bool = true
var ability_index = -99

var time : float = 0

var icon_texture

func _global_cooldouwn(dur):
	if cooldown - time < dur:
		time = cooldown - dur
		
func _is_avalaible():
	return time == cooldown
	
func _activate(player):
	if not _is_avalaible():
		return false
		
	var speech_player = player.get_node("SpeechPlayer")
	if not speech_player.playing:
		speech_player.stream = load(Quotes.matrix[player.character_index][ability_index])
		speech_player.play()
		
	time = 0
	was_deactive = false
	return true
	
func _deactivate(player):
	was_deactive = true
	return true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _update(delta, player, icon, cooldown_label):
	icon.texture = icon_texture
	time += delta
	if time > cooldown:
		time = cooldown
		cooldown_label.text = ""
		icon.modulate = Color.WHITE
	else:
		cooldown_label.text = str(ceil(cooldown-time))
		icon.modulate = Color(1,1,1,0.2)
		pass
		
	if not was_deactive and time >= duration:
		if _deactivate(player):
			return true
	return false
