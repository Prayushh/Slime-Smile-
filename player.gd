
# $ = preload

extends CharacterBody2D

signal health_depleted
var health := 100.0

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600
	move_and_slide()
	
	if velocity == Vector2.ZERO:
		$HappyBoo.play_idle_animation()
	else:
		$HappyBoo.play_walk_animation()

	var overlapping_mobs = %hitbox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= 10 * overlapping_mobs.size() * delta
		%ProgressBar.value = health
		if health <= 0.0:
			emit_signal("health_depleted")
