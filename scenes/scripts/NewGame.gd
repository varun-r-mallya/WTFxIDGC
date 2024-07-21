extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_pressed():
	Global.next_scene = "res://scenes/level1.tscn"
	get_tree().change_scene_to_file("res://scenes/loading1.tscn")
