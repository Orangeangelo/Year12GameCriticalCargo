extends Node2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if Input.is_action_pressed("reset"):
		var spawn_point = GameStats.get_spawn()
		if spawn_point:
			$CharacterBody2D.position = spawn_point.position
		GameStats.reset()
