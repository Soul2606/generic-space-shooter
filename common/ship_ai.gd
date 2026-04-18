extends Node

@export var ship:Ship 
@export var aggresion:int = 1

# how many enemy wapon ranges am i within
var danger := 0.0
# how many ships are around me
var cramp := 0.0
# am i behind an enemy
var opputunity := 0.0
# how many friendly wapon ranges am i within 
var support := 0.0


func move(direction:Vector2):
	ship.add_thrust_absolute(direction * ship.speed)


func move_to(position:Vector2):
	var dir := ship.global_position.direction_to(position)
	var dist := ship.global_position.distance_to(position)
	move(dir * dist / 100)
