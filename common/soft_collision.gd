extends Node

@export var collision_shape:Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision_shape.body_entered.connect(func(body):
		print("collided with:", body)
	)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
