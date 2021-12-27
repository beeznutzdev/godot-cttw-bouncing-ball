extends RigidBody2D


"""
	This is the overlay sprite that the program utilizes.
"""


export (int, 1, 100, 1) var impulse_mul: int = 32
export (float, 1, 4, 0.1) var input_deadzone_mul: float = 3.2

onready var Polygon: CollisionPolygon2D = $Polygon
	
	
func get_click_polygon() -> PoolVector2Array:
	# Creates and returns the click polygon depending on the ball's collision
	# polygon.
	var cp: PoolVector2Array = []
	for c in Polygon.polygon:
		cp.append(global_position + c * Polygon.scale.x * input_deadzone_mul)
	return cp


func _on_Area_input_event(_viewport: Node, event: InputEvent,
		_shape_idx: int) -> void:
	# Triggered when left clicked, "LMB" event is created in Project ->
	# Project Settings -> Input Map.
	if event.is_action_pressed("LMB"):
		var mouse_pos: Vector2 = get_global_mouse_position()
		var offset: Vector2 = mouse_pos - global_position
		var impulse_vec: Vector2 = global_position - mouse_pos
		apply_impulse(offset, impulse_mul * impulse_vec)
