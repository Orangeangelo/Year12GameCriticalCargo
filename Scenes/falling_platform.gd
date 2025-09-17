extends RigidBody2D


@onready var tween = create_tween()
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var hover_distance = 10.0
var hover_duration = 1.0

func _ready() -> void:
	gravity_scale = 0.0 
	start_hover()


func start_hover():
	var start_y = global_position.y
	
	#Move up
	tween.set_loops()
	tween.tween_property(self, "global_position:y", start_y - hover_distance,hover_duration)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)
	
	#Move down
	tween.set_loops()
	tween.tween_property(self, "global_position:y", start_y + hover_distance,hover_duration)
	tween.set_trans(Tween.TRANS_SINE)
	tween.set_ease(Tween.EASE_IN_OUT)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.global_position.y < self.global_position.y:
		animated_sprite_2d.play("off")
		await get_tree().create_timer(0.25).timeout
		gravity_scale = 1.0
		tween.stop()
