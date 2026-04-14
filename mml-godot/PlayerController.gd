extends CharacterBody2D

class_name Player

@export var identifier : String = "left"

@export var jump_speed: float = 555
@export var max_speed : float = 500

@export var acceleration : float = 800
@export var acceleration_damping : float = 0.5
@export var turning_damping : float = 0.01
@export var deceleration_damping : float = 0.005

@export var left_input: String = "left_key"
@export var right_input: String = "right_key"
@export var up_input: String = "up_key"

@export var ability1_input: String = ",_key"
@export var ability2_input: String = "._key"
@export var ability3_input: String = "-_key"

@export var texture_path: String = ""
@export var character_index = 0

@onready var is_jumping = false


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var abilities = [SwapMovement.new(),NoCollision.new(),TrollFace.new()]
var a_icon = []
var a_label = []
var a_input = []

@export var second_player: Player
func _get_dB_of_fall():
	var val = -10
	val += previos_fall_speed/50
	return val
	
	
func _ready():
	$"Biden-final-12".texture = load(texture_path)
	a_icon = [$CanvasLayer/Ability1Icon,$CanvasLayer/Ability2Icon,$CanvasLayer/Ability3Icon]
	a_label = [$CanvasLayer/CooldownLabel1,$CanvasLayer/CooldownLabel2,$CanvasLayer/CooldownLabel3]
	a_input = [ability1_input,ability2_input,ability3_input]

var previos_fall_speed = 0
func _physics_process(delta):
	velocity.x = clamp(velocity.x, -max_speed,max_speed)
	
	if abs(velocity.x) < 100:
		$AnimationPlayer.play("idle")
	
	if not is_on_floor():
		$AnimationPlayer.play("jump")
		# Add the gravity.
		velocity.y += gravity * delta
	else:
		if(previos_fall_speed > 0):
			$"landingPlayer".volume_db = _get_dB_of_fall()
			$"landingPlayer".play()
	previos_fall_speed = velocity.y
	
	for i in range(3):
		#random ability commented
		#if abilities[i]._update(delta,second_player, a_icon[i],a_label[i]):
			#abilities[i] = AbilityManager._get_ability()
		abilities[i]._update(delta,second_player, a_icon[i],a_label[i])
		if Input.is_action_just_pressed(a_input[i]):
			if abilities[i]._activate(second_player):
				active_gloabal_couldown(5)
	
	
	
	if Input.is_action_pressed(left_input):
		$"Biden-final-12".flip_h = true
		move_left(delta)
		$AnimationPlayer.play("running")
	elif Input.is_action_pressed(right_input):
		$"Biden-final-12".flip_h = false
		move_right(delta)
		$AnimationPlayer.play("running")
	else:
		decelerate(delta)

	if Input.is_action_just_pressed(up_input):
		jump()
	if Input.is_action_just_released(up_input):
		if is_jumping && velocity.y < 0:
			velocity.y /= 2
		is_jumping = false

	move_and_slide()
	
	
func active_gloabal_couldown(dur):
	for i in range(3):
		abilities[i]._global_cooldouwn(dur)
		
func move_left(delta):
	if velocity.x <= 0:
		accelerate(-1, acceleration_damping, delta)
	else:
		accelerate(-1, turning_damping, delta)
		
func move_right(delta):
	if velocity.x >= 0:
		accelerate(1, acceleration_damping, delta)
	else:
		accelerate(1, turning_damping, delta)

func accelerate(magnitude, damping, delta):
	velocity.x += magnitude * acceleration * delta
	velocity.x *= pow(damping, delta)
	
func decelerate(delta):
	velocity.x *= pow(deceleration_damping, delta)
	
func jump():
	if is_on_floor() && !is_jumping:
		is_jumping = true
		velocity.y = -jump_speed
