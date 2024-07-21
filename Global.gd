extends Node

func remove(string: String, removal: String):
	var length = removal.length()
	var i = 0

	while i < string.length() - length:
		var piece = ''
		var j = i

		while j < i + length:
			piece += string[j]
			j += 1

		if piece == removal:
			return string.substr(0, j - length) + string.substr(j)

		i += 1

	return string

#func decrease_opacity_and_free():
	#var currentOpacity = modulate.a
	#var nodeName = get_name()
	#var tileIndex = int(Global.remove(nodeName, "Tile"))
#
	#if currentOpacity < 1.0:
	#currentOpacity -= 4 * delta
	#currentOpacity = max(0.0, currentOpacity)
	#modulate.a = currentOpacity
#
	#if currentOpacity <= 0.1:
		#var nextTile = "Tile" + str(tileIndex + 1)
		#var nextTilePath = "../" + nextTile
		#var nextTileNode = get_node(nextTilePath)
		#
		#if nextTileNode:
	#nextTileNode.modulate.a -= 0.1
		#
		#queue_free()
