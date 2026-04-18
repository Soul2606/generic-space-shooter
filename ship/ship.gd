extends RigidBody2D
class_name Ship

@export var speed := 200.0
@export var top_speed := 200.0
@export var turn_speed := 10.0
@export var top_turn_speed := 100.0
@export var turn_friction := 0.1
@export var size_class:int = 1

var lat_thrust := Vector2(0,0)
var ang_thrust := 0.0

# what this ship will do when labeled with:
# search_and_destroy: search for and engage enemis
# escort: same as search_and_destroy but smaller ships nearby will be ordered to escort it
# retreat: run away from the battle while avoiding danger
enum Instruction {search_and_destroy, escort, retreat}



func add_thrust(dir:Vector2):
	lat_thrust += dir.rotated(rotation)


func add_thrust_absolute(dir:Vector2):
	lat_thrust += dir


func _physics_process(delta: float) -> void:
	apply_central_force(lat_thrust)
	if linear_velocity.length() > top_speed:
		linear_velocity = linear_velocity.normalized() * top_speed
	angular_velocity = (clamp(ang_thrust, -top_turn_speed, top_turn_speed)) * delta
	ang_thrust *= clamp(1 - turn_friction, 0, 1)
	lat_thrust *= 0.0
