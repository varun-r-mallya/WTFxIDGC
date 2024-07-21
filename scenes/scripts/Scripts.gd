extends Node2D

@onready var tilemap = $"../TileMap"
@onready var timer = $"../Timer"
@onready var raycast = $RayCast2D


var clicked_pos
var layers_to_process = []  
var current_layer = []  
var animation_layer = []

func _ready():
	pass

func animation(pos):
	tilemap.set_cell(0, pos, 0, Vector2(3,0), 0)

#func _input(event):
	#if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		#clicked_pos = tilemap.local_to_map(get_global_mouse_position())
		#print(clicked_pos)
		#if tilemap.get_cell_tile_data(0, clicked_pos) != null:
			#layers_to_process.append([clicked_pos])

func _physics_process(delta):
	if timer.is_stopped() and (not layers_to_process.is_empty() or not current_layer.is_empty()):
		process_current_layer()
		timer.start()

func process_current_layer():
	#if current_layer.is_empty():
	if not layers_to_process.is_empty():
		current_layer = animation_layer
		animation_layer = layers_to_process.pop_front()
	else:
		current_layer = animation_layer
		animation_layer = []
		

	var next_layer = []
	for tile in current_layer:
		tilemap.erase_cell(0, tile)
	
	for tile in animation_layer:
		# Animate the tile
		animation(tile)

		# Add surrounding tiles to the next layer
		var surrounding_tiles = tilemap.get_surrounding_cells(tile)
		for surrounding_tile in surrounding_tiles:
			if tilemap.get_cell_tile_data(0, surrounding_tile) != null and surrounding_tile not in next_layer:
				next_layer.append(surrounding_tile)

		# Erase the current tile
		
	

	# Add the next layer to be processed if it's not empty
	if not next_layer.is_empty():
		layers_to_process.append(next_layer)

	# Clear the current layer
	#current_layer.clear()
	#animation_layer.clear()


func _on_bullet_manager_send_detect(pos):
	#print(pos)
	clicked_pos = tilemap.local_to_map(pos)
	print(clicked_pos)
	if tilemap.get_cell_tile_data(0, clicked_pos) != null:
		if layers_to_process.size()>0:
			layers_to_process[0].append(clicked_pos)
		else:
			layers_to_process.append([clicked_pos])
	
	
