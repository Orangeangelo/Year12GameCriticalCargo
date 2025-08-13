extends Control

@onready var label = $Label

func _ready():
	EventController.connect("diamond_collected", on_event_diamond_collected)


func on_event_diamond_collected(value: int) ->  void:
	label.text = str(value)
