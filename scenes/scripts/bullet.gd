extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var raycast = $RayCast2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction: Vector2
var speed:int= 300

signal detect

func _physics_process(delta):
	#print("Direction:", direction)
	#print("RayCast2D target_position:", raycast.target_position)
	#print("Is colliding:", raycast.is_colliding())
	
	raycast.target_position = direction*10

	if raycast.is_colliding():
		detect.emit(raycast.get_collision_point()+direction.normalized(),self)
	
	position += speed * direction * delta
	move_and_slide()
