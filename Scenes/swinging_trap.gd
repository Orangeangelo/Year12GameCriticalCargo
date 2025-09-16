extends Node2D

func _ready() -> void:
	$AnimationPlayer.play("Swing")

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("Player is dead")
		if GameStats.check_reset() == false:
			body.global_position = GameStats.get_spawn().global_position
