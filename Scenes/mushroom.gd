extends CharacterBody2D

const SPEED = 200.0

var direction = 1
var health = 1

func add_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta

func move_enemy():
	velocity.x = SPEED * direction

func reverse_direction():
	if is_on_wall():
		direction = -direction

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	move_enemy()
	move_and_slide()
	reverse_direction()
