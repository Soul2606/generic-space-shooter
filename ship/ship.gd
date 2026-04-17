extends Node2D
class_name Ship

@export var speed := 10.0
@export var top_speed := 250.0
@export var turn_speed := 10.0
@export var top_turn_speed := 100.0
@export var turn_friction := 0.1

var velocity := Vector2(0,0)
var ang_velocity := 0.0


func apply_movement(delta:float):
	if velocity.length() > top_speed:
		velocity = velocity.normalized() * top_speed
	position += velocity * delta
	rotate(deg_to_rad(clamp(ang_velocity, -top_turn_speed, top_turn_speed)) * delta)
	ang_velocity *= clamp(1 - turn_friction, 0, 1)


# Add velocity relative to direction
func thrust(dir:Vector2):
	velocity += dir.rotated(rotation)
