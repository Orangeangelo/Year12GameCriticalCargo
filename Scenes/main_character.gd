extends CharacterBody2D

const SPEED = 425.0
const JUMP_VELOCITY = -750.0
var jump_count = 0
@onready var sprite_2d = $Sprite2D

func _physics_process(delta: float) -> void:
	# Animations
	if not is_on_floor():
		if velocity.y < 0:
			if jump_count == 1:
				sprite_2d.animation = "jump"
			elif jump_count == 2:
				sprite_2d.animation = "double_jumping"
		else: # Moving downward (falling)
			sprite_2d.animation = "Fall"
	else:
		if velocity.x > 1 || velocity.x < -1:
			sprite_2d.animation = "running"
		else:
			sprite_2d.animation = "idle"
	
	# Add the gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		jump_count = 0

	# Handle jump
	if Input.is_action_just_pressed("jump") and jump_count < 2:
		velocity.y = JUMP_VELOCITY
		jump_count += 1

	# Get the input direction and handle the movement/deceleration
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
