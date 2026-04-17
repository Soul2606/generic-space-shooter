extends Node

@export var ship:Ship

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Ship controller running")


func _physics_process(delta: float) -> void:
	# Latteral direction is absolute and irrelevant to rotation
	var lat_direction := Vector2(0,0)
	if Input.is_action_pressed('move_forward'):
		lat_direction += Vector2(0,-1)
	if Input.is_action_pressed('move_backwards'):
		lat_direction += Vector2(0,1)
	if Input.is_action_pressed('move_right'):
		lat_direction += Vector2(1,0)
	if Input.is_action_pressed('move_left'):
		lat_direction += Vector2(-1,0)
	ship.thrust(lat_direction.normalized() * ship.speed)
	
	# Rotation in degrees going clockwise
	var rot_direction := 0.0
	if Input.is_action_pressed("turn_right"):
		rot_direction += 1
	if Input.is_action_pressed("turn_left"):
		rot_direction += -1
	ship.ang_velocity += rot_direction * ship.turn_speed
	
	ship.apply_movement(delta)
