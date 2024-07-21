extends Node2D

@export var bullet_scene: PackedScene

signal send_detect

func _on_player_shoot(pos,dir):
	var bullet = bullet_scene.instantiate()
	add_child(bullet)
	bullet.position=pos
	bullet.direction=dir.normalized()
	bullet.add_to_group("bullets")	
	bullet.detect.connect(_on_detect)

func _on_detect(position,node):
	
	send_detect.emit(position)
	node.queue_free()
