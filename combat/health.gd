extends Node
class_name Health

enum HealthType {Hull, Armour, Shield}
@export var value := 125.0
@export var type := HealthType.Hull


func damage(damage_value:float, damage_type:CombatTypes.DamageType):
	var multiplier := 1.0
	if type == HealthType.Hull:
		if damage_type == CombatTypes.DamageType.fragment:
			multiplier = 2.0
	
	if type == HealthType.Armour:
		if damage_type == CombatTypes.DamageType.explosive:
			multiplier = 2.0
		else:
			multiplier = 0.5
	
	if type == HealthType.Shield:
		if damage_type == CombatTypes.DamageType.kinetic:
			multiplier = 2.0
		else:
			multiplier = 0.5
	
	value = max(0, value - abs(damage_value) * multiplier)
