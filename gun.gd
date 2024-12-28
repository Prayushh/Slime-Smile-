extends Area2D

func _process(delta):
	# Get the mouse position relative to the gun's position
	var mouse_pos = get_global_mouse_position()
	var direction = mouse_pos - global_position

	# Rotate the gun towards the mouse
	rotation = direction.angle()
