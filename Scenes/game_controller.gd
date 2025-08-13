extends Node

var total_diamonds: int = 0

func diamond_collected(value: int):
	total_diamonds += value
	EventController.emit_signal("diamond_collected", total_diamonds)
