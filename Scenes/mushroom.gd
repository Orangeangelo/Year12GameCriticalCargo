extends CharacterBody2D

const SPEED = 75.0

var direction = 1
var health = 1

func add_gravity(delta):
	if not is_on_floor():
		velocity.y += get_gravity() * delta



func move_enemy():
	velocity.x = SPEED * direction
