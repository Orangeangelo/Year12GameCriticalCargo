extends Node2D

@onready var bg = $TextureRect

var start_x
var start_y
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_x = bg.position.x
	start_y = bg.position.y


func move_tiles():
	bg.position.x -= 1
	bg.position.y -= 1
	
	if bg.position.x == start_x - 64:
		bg.position.x = start_x
		bg.position.y = start_y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_tiles()
