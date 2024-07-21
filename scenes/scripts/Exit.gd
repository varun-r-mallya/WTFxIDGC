extends Area2D

var points = false
var path_name = ""

func _ready():
	pass
	hide()

func _process(delta):
	pass

func _on_body_entered(body):
	print(body.name)
	if points:
		print(path_name)  
		if path_name != "":
			get_tree().change_scene_to_file(path_name)
		else:
			print("Path is not set!")

func _on_level_1_exit(point, new_path):
	show()
	points = point
	path_name = new_path 
