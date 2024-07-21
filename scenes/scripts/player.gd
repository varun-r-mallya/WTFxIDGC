extends CharacterBody2D

const bulletPath = preload("res://scenes/bullet.tscn")
const SPEED = 130.0
const JUMP_VELOCITY = -300.0

signal shoot
var can_shoot :bool
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var ray_cast = $RayCast2D
@onready var tile_map: TileMap = $TileMap
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and can_shoot:
		var dir= get_global_mouse_position()-position
		shoot.emit(position,dir)
		can_shoot=false
		$ShotTimer.start()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	
	if direction>0:
		animated_sprite.flip_h=false
	elif direction<0:
		animated_sprite.flip_h=true
	
	if direction != 0:
		animated_sprite.play("run")
	else:
		animated_sprite.play("default")
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()



func _on_shot_timer_timeout():
	can_shoot=true
