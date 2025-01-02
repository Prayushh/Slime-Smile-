extends Area2D
@onready var shootingpoint= get_node("%shootingpoint")

func _process(delta):
	# Get the mouse position relative to the gun's position
	var mouse_pos = get_global_mouse_position()
	var direction = mouse_pos - global_position
	

	# Rotate the gun towards the mouse
	rotation = direction.angle()
	if direction.x<0:
		scale.y=-1
	else:
		scale.y=1

func shoot():
	const BULLET = preload("res://bullet.tscn")
	var new_bullet=BULLET.instantiate()
	
	new_bullet.global_position=%shootingpoint.global_position
	get_tree().current_scene.add_child(new_bullet)
	new_bullet.rotation=rotation
	
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		shoot()
