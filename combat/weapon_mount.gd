extends Node2D
class_name WeaponMount

enum Type { turret, hardpoint }
enum Size { small, medium, large }

@export var arc := 180.0
@export var size := Size.small
@export var type := Type.turret
@export var weapon_path:NodePath

var weapon:Weapon
var turn_multplier := 1.0

func _ready() -> void:
	weapon = get_node(weapon_path)
	if type == Type.hardpoint:
		turn_multplier = 0.1


func rotate_towards(target_pos:Vector2, delta:float):
	var a := deg_to_rad(arc)

	var local_target := to_local(target_pos).angle() + PI / 2
	local_target = wrapf(local_target, -PI, PI)

	if arc >= 360:
		weapon.rotation = rotate_toward(
			weapon.rotation,
			local_target,
			weapon.turn_speed * turn_multplier * delta
		)
		return

	weapon.rotation = move_toward(
		weapon.rotation,
		local_target,
		weapon.turn_speed * turn_multplier * delta
	)

	weapon.rotation = clamp(
		weapon.rotation,
		-a / 2.0,
		a / 2.0
	)
