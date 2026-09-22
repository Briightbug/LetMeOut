extends CharacterBody2D

@export var move_speed = 15.0
@export var move_speed_multiplier = 10.0
@export var jump_strength = -20.0
@export var jump_strength_multiplier = 10.0

var direction = 0.0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_strength * jump_strength_multiplier

	# Get the input direction and handle the movement/deceleration.
	direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * move_speed * move_speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, move_speed)

	move_and_slide()
