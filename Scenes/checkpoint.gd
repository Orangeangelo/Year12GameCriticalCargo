extends Area2D

func _ready() -> void:
	$AnimationPlayer.play("Checkpoint")
	$AnimationPlayer.connect("animation_finished", _on_animation_finished)

func _process(delta: float) -> void:
	if GameStats.get_spawn() != self:
		$AnimationPlayer.play("Checkpoint")

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		GameStats.set_spawn(self)
		$AnimationPlayer.play("saved")

func _on_animation_finished(anim_name: String) -> void:
	if anim_name == "saved":
		$AnimationPlayer.play("Checkpoint")
