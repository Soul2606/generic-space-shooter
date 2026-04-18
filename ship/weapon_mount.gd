extends Node2D
class_name WeaponMount

enum Type {turret, hardpoint}
enum Size {small, medium, large}

@export var arc := 180.0
@export var size := Size.small
@export var type := Type.turret
@export var weapon_path:NodePath


var weapon:Weapon


func _ready() -> void:
	weapon = get_node(weapon_path)


func rotate_towards(target_pos:Vector2, delta:float):
	var target_dir := global_position.angle_to(target_pos)
	weapon.global_rotation = lerp(weapon.global_rotation, target_dir, 10 * delta)
	var a := deg_to_rad(arc)
	weapon.rotation = clamp(weapon.rotation, -a / 2, a / 2)
