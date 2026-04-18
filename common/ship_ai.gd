extends Node

@export var ship:Ship
@export var battle:Battlefield
@export var aggresion:int = 1


# how many enemy weapon ranges am i within
var danger := 0.0
# how many ships are around me
var cramp := 0.0
# am i behind an enemy? is the enemy low? do i have a finisher weapon?
var opportunity := 0.0
# how many friendly weapon ranges am i within 
var support := 0.0


func get_allies() -> Array[Ship]:
	return battle.get_ships_on_team(ship.team)


func get_enemies() -> Array[Ship]:
	return battle.ships.filter(func(s):
		return s.team != ship.team
	)


func move(direction:Vector2):
	ship.add_thrust_absolute(direction * ship.speed)


func move_to(position:Vector2):
	var dir := ship.global_position.direction_to(position)
	var dist := ship.global_position.distance_to(position)
	move(dir * dist / 100)
