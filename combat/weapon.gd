extends Node2D
class_name Weapon

@export var damage := 10.0
@export var damage_type := CombatTypes.DamageType.kinetic
@warning_ignore("shadowed_global_identifier")
@export var range := 800.0
@export var turn_speed := 25.0
#How do i implement fire rate?
@export var fire_rate := 0.5
@export var projectile:PackedScene

var cooldown := 0.0

# Simplest possible weapon. This is overwritten by other weapon scripts
func fire(spawn:Node2D, ship:Ship):
	if cooldown > 0: return
	var node:Projectile = projectile.instantiate()
	node.global_position = global_position
	node.global_rotation = global_rotation
	node.owner_sip = ship
	spawn.add_child(node)
	cooldown = fire_rate


func _process(delta: float) -> void:
	cooldown = max(0, cooldown - delta)
