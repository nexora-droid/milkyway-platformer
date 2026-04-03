extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var killzone: Area2D = $"../Killzone"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


const SPEED = 150.0
const JUMP_VELOCITY = -275.0
var jumps := 0
var dead := false
func _ready() -> void:
	Engine.time_scale = 1

func _process(delta: float) -> void:
	if System.alive != true and dead == false:
		dead = true
		die()

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor(): 
		velocity += get_gravity() * delta
	else:
		jumps = 0

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and jumps < 3:
		velocity.y = JUMP_VELOCITY
		jumps += 1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction < 0:
		animated_sprite_2d.flip_h = true
	if direction > 0:
		animated_sprite_2d.flip_h = false
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("default")
		else:
			animated_sprite_2d.play("run")
	elif jumps > 1:
		animated_sprite_2d.play("double_jump")
	else:
		animated_sprite_2d.play("jump")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func die() -> void :
	collision_shape_2d.queue_free()
	Engine.time_scale = 1.5
	await get_tree().create_timer(1).timeout
	get_tree().quit()
