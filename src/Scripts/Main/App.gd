extends Node


"""
	This is the main scene the app utilizes.
"""


onready var Ball: Node2D = $Ball
onready var Updater: Timer = $Updater
	
	
func _ready() -> void:
	initialize_window()
	
	
func _physics_process(_delta: float) -> void:
	update_click_polygon()
	
	
func initialize_window() -> void:
	# Initializes the app window.
	# Do not forget to allow "Per Pixel Transparency" from project settings 
	# under Project -> Project Settings -> Display -> Window -> Per Pixel
	# Transparency menu, otherwise transparent background will not work.
	var ss: Vector2 = OS.get_screen_size()
	OS.set_window_size(ss - Vector2(1, 1))
	OS.set_window_position(Vector2(0, 0))
	OS.set_window_always_on_top(true)
	# If window size covers the whole screen, you'll get a black background. In
	# order to prevent that, the window size is set to `ss - Vector2(1, 1)`.
	OS.set_borderless_window(true)
	OS.set_window_per_pixel_transparency_enabled(true)
	# For better results, it is advised to enable the two settings above, from
	# the project settings instead of here.
	get_tree().get_root().set_transparent_background(true)
	Ball.global_position = ss / 2
	update_click_polygon(true)
	
	
func update_click_polygon(initial: bool = false) -> void:
	# Updates the area which is clickable, meaning that the inputs do not pass
	# through the window outside the specified area. It is only updated when
	# the ball is not sleeping, meaning that the ball is moving, or when it is
	# the inital update.
	if !Ball.sleeping or initial:
		OS.set_window_mouse_passthrough(Ball.get_click_polygon())
