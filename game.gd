extends Node2D

func spawn_enemy():
	var new_mob = preload("res://enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_mob.global_position = %PathFollow2D.global_position
	add_child(new_mob)


func _on_timer_timeout() -> void:
	spawn_enemy()


func _on_player_health_depleted() -> void:
	%gameover.visible = true
	get_tree().paused = true


func _ready() -> void:
	$player.health_depleted.connect(_on_player_health_depleted)
