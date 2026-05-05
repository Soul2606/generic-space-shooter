extends Node2D
class_name Battlefield


@export var ships:Array[Ship]
@export var camera:CombatCamera
@export var battlefield_path:NodePath
var battlefield:Node



func _ready() -> void:
	battlefield = get_node(battlefield_path)



func spawn_ship(scene: PackedScene, team: int) -> Ship:
	var ship: Ship = scene.instantiate()
	
	battlefield.add_child(ship)
	ship.team = team
	
	ships.append(ship)
	
	return ship



func remove_ship(ship: Ship):
	ships.erase(ship)
	ship.queue_free()



func get_ships_on_team(team: int) -> Array[Ship]:
	var results:Array[Ship] = []
	for ship in ships:
		if ship.team == team:
			results.append(ship)
	return results
