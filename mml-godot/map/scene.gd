extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	add_child(StaticVariables.maps[StaticVariables.level_selected].instantiate())
	$"Player".position = StaticVariables.positions[StaticVariables.level_selected]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
