extends Node2D
class_name Ship

@export var speed := 10.0
@export var top_speed := 250.0
@export var turn_speed := 10.0
@export var top_turn_speed := 100.0
@export var turn_friction := 0.1

var velocity := Vector2(0,0)
var ang_velocity := 0.0



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('ship script running')




func apply_movement(delta:float):
	position += velocity * delta
	rotate(deg_to_rad(ang_velocity) * delta)




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
	velocity += (lat_direction.normalized()*speed)
	if velocity.length() > top_speed:
		velocity = velocity.normalized() * top_speed
	
	# Rotation in degrees
	var rot_direction := 0.0
	if Input.is_action_pressed("turn_right"):
		rot_direction += 1
	if Input.is_action_pressed("turn_left"):
		rot_direction += -1
	if rot_direction == 0 and ang_velocity != 0:
		if ang_velocity > top_turn_speed*10:
			ang_velocity += (ang_velocity * -turn_friction)
		else:
			if ang_velocity > 0:
				ang_velocity += (-min(abs(ang_velocity), turn_speed))
			else:
				ang_velocity += (min(abs(ang_velocity), turn_speed))
	elif abs(ang_velocity) < top_turn_speed:
		ang_velocity += (rot_direction * turn_speed)
	
	apply_movement(delta)
