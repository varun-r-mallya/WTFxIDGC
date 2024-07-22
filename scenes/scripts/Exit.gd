extends Area2D

var points = false
var path_name = ""
@onready var level_change = $levelchange

func _ready():
	pass
	print("hello?")
	hide()

func _process(delta):
	pass

func _on_body_entered(body):
	print(points)
	if points:
		if path_name != "":
			level_change.play()
			get_tree().paused = true
			Global.next_scene = path_name
			Global.count += 1
			var name=""
			if Global.count == 9:
				name="res://scenes/main.tscn"
			else:
				name = "res://scenes/loading" + str(Global.count) + ".tscn"
			#var name = "res://scenes/loading" + str(9) + ".tscn"
			print(name)
			get_tree().change_scene_to_file(name)
			#get_tree().paused = false
			#get_tree().change_scene_to_file(path_name)
		else:
			print("Path is not set!")

func _on_level_1_exit(point, new_path):
	show()
	points = point
	path_name = new_path 
