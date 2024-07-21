extends Node2D

@onready var powerup_sound = $powerup
		
signal exit
var points = false
func _on_coin_point():
	var nodeName = get_name()
	#print("Node Name:", nodeName)
	powerup_sound.play()
	var SceneIndex = int(Global.remove(nodeName,"Level"))
	var NextScene="level" + str(SceneIndex + 1)
	var NextScenePath = "res://scenes/" + NextScene + ".tscn"
	points=true
	exit.emit(points,NextScenePath)
	print(points)

