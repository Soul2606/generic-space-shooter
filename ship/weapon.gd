extends Node2D
class_name Weapon

enum DamageType {kinetic, explosive, fragment}

@export var damage := 10.0
@export var damage_type := DamageType.kinetic
@warning_ignore("shadowed_global_identifier")
@export var range := 800.0
@export var turn_speed := 25.0

# use @GDScript to get shadowed functions
