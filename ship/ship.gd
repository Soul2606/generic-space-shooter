extends RigidBody2D
class_name Ship

@export var speed := 500.0
@export var top_speed := 20000.0
@export var turn_speed := 10.0
@export var top_turn_speed := 100.0
@export var turn_friction := 0.1

var velocity := Vector2(0,0)
var ang_velocity := 0.0



func thrust(dir:Vector2):
	velocity += dir.rotated(rotation)



func _physics_process(delta: float) -> void:
	if velocity.length() > top_speed:
		velocity = velocity.normalized() * top_speed
	linear_velocity = velocity * delta
	angular_velocity = (clamp(ang_velocity, -top_turn_speed, top_turn_speed)) * delta
	ang_velocity *= clamp(1 - turn_friction, 0, 1)
