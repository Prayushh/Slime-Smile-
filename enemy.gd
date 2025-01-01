extends CharacterBody2D
var health= 100
@onready var player= get_node("/root/game/player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity= direction*300
	move_and_slide()

func _ready():
	%Slime.play_walk()
func take_damage():
	%Slime.play_hurt()
	health -= 50

	if health == 0:
		const SMOKE_SCENE = preload("res://smoke_explosion/smoke_explosion.tscn")
		var smoke = SMOKE_SCENE.instantiate()  # Properly create an instance of the smoke scene
		smoke.global_position = global_position  # Set the smoke position before freeing the node
		get_parent().add_child(smoke)  # Add the smoke to the scene
		queue_free()  # Free the enemy node after handling the smoke explosion
