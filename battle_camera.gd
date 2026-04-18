extends Camera2D
class_name CombatCamera

# zoom magnitude
var zoom_mag := 1.0
@export var zoom_speed := 0.25
@export var zoom_innest := 1.0
@export var zoom_outest := -3.0



func _process(delta: float) -> void:
	position = get_parent().position
	
	if Input.is_action_just_pressed("zoom_in"):
		zoom_mag -= zoom_speed
	if Input.is_action_just_pressed("zoom_out"):
		zoom_mag += zoom_speed
	zoom_mag = clamp(zoom_mag, zoom_outest, zoom_innest)
	
	var mouse_pos = get_viewport().get_mouse_position()
	var size = get_viewport().get_visible_rect().size
	mouse_pos -= size * 0.5
	mouse_pos *= 2
	
	zoom = Vector2.ONE * pow(2, zoom_mag) 
	position = position.lerp(mouse_pos, 10 * delta)
