extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump: AudioStreamPlayer2D = $jump
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_up: RayCast2D = $RayCastUp
@onready var ray_cast_down: RayCast2D = $RayCastDown
@onready var game_manager: Node = %GameManager
@onready var kill_sound: AudioStreamPlayer2D = $killSound

const SPEED = 700
const JUMP_VELOCITY = -1200


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta + Vector2(0, 30)
	
	if ray_cast_down.is_colliding() && global_position.y < 1030:
		velocity.y = JUMP_VELOCITY
		var collision = ray_cast_down.get_collider()
		for i in range(collision.points):
			game_manager.add_point()
		kill_sound.play()
		collision.queue_free()
		pass
	
	if ray_cast_left.is_colliding() || ray_cast_right.is_colliding() || ray_cast_up.is_colliding():
		queue_free()
	
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	# Flip the Sprite
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
