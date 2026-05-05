extends Node2D
class_name Projectile

@export var damage := 10.0
@export var type := CombatTypes.DamageType.kinetic
@export var speed := 600.0
@export var life_time := 1.0
@export var activation_time := 0.0

var owner_sip:Ship
var time := 0.0


func _ready() -> void:
	$Area2D.body_entered.connect(on_hit)


func on_hit(body:Node2D):
	if (owner_sip.mounts + [owner_sip]).has(body): return
	if time < activation_time: return
	queue_free()


func _process(delta: float) -> void:
	time += delta
	if (time >= life_time): queue_free()
	position += Vector2.from_angle(rotation - PI/2) * speed * delta
	
