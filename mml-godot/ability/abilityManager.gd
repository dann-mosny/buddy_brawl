
class_name AbilityManager

static var abitity_probabilities = [0.33,0.33,0.34]
static var class_array = [SwapMovement,TrollFace,NoCollision]

static func _get_ability():
	var index = randi_range (0, 2)
	return class_array[index].new()
