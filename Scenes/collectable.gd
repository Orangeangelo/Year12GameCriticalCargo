extends Area2D

@onready var value: int = 1


func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		GameController.diamond_collected(value)
		self.queue_free()
