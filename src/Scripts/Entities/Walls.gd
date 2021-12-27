extends StaticBody2D


"""
	These are the walls that the balls collide.
"""


onready var Polygon: CollisionPolygon2D = $Polygon


func _ready() -> void:
	initialize_walls()
	

func initialize_walls() -> void:
	# Creates and sets the collision polygon of the outer walls. This function
	# simply creates wall around the visible screen so the ball can bounce
	# on collision with the edges.
	var ss: Vector2 = OS.get_screen_size()
	var tl_in: Vector2 = Vector2(0, 0)
	var tl_out: Vector2 = tl_in + Vector2(-100, -100)
	var tr_in: Vector2 = Vector2(ss.x, 0)
	var tr_out: Vector2 = tr_in + Vector2(100, -100)
	var br_in: Vector2 = ss
	var br_out: Vector2 = br_in + Vector2(100, 100)
	var bl_in: Vector2 = Vector2(0, ss.y)
	var bl_out: Vector2 = bl_in + Vector2(-100, 100)
	var gap_in: Vector2 = tl_in + Vector2(0, 100)
	var gap_out: Vector2 = gap_in + Vector2(-100, -100)
	var polygon_arr: PoolVector2Array = [
		tl_in, tr_in, br_in, bl_in, gap_in,
		gap_out, bl_out, br_out, tr_out, tl_out
	]
	Polygon.polygon = polygon_arr
