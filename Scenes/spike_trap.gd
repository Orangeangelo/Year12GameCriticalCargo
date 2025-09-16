extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("SpikeTrigger")

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print("Player is dead")
