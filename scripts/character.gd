extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var isShooting = false
var targetPosition: Vector2
var shootDirection: Vector2
var preloadBlast = preload("res://scenes/blast.tscn")
@onready var sprite = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.play("idle")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		if direction == 1:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
		sprite.play("move_ahead")
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	_shoot()
	move_and_slide()

func _set_animation(direction):
	if direction.x < 0: sprite.flip_h = true
	elif direction.x > 0: sprite.flip_h = false
	
	if isShooting:
		if shootDirection.x < 0: sprite.flip_h = true
		elif shootDirection.x > 0: sprite.flip_h = false
		
		var shootDegree = rad_to_deg(position.angle_to_point(targetPosition))
		
		if shootDegree > 45 && shootDegree < 135: sprite.play("move_ahead")
		elif shootDegree < -45 && shootDegree > -135: sprite.play("idle")
		else: sprite.play("back")
	else:
		if velocity != Vector2.ZERO: sprite.play("move_ahead")	
		else: sprite.play("move_ahead")
		
func _shoot():
	if Input.is_action_just_pressed("ui_accept"):
		if isShooting: return
		
		isShooting = true
		targetPosition = get_global_mouse_position()
		shootDirection = (targetPosition-global_position).normalized()
		
		await get_tree().create_timer(0.5).timeout
		var blast = preloadBlast.instantiate()
		blast.set_arrow(global_position,targetPosition)
		get_parent().add_child(blast)
		
		await get_tree().create_timer(0.2).timeout
		isShooting = false
		
		
		
