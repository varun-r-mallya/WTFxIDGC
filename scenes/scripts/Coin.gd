extends Area2D

@onready var tilemap = $"../TileMap"
signal point

func _ready():
	pass

func _process(delta):
	pass

func _on_body_entered(body):
	#change_all_tiles()
	point.emit()
	queue_free()
#
#func change_all_tiles():
	## Get all used cells in the TileMap
	#var used_cells = tilemap.get_used_cells(0)  # 0 is the layer index
	#
	## Iterate through all used cells and change them
	#for cell_pos in used_cells:
		## Get the current tile data
		#var tile_data = tilemap.get_cell_tile_data(0, cell_pos)
		#
		#if tile_data:
			## Get the current source id, atlas coords, and alternative tile
			#var source_id = tilemap.get_cell_source_id(0, cell_pos)
			#var atlas_coords = tilemap.get_cell_atlas_coords(0, cell_pos)
			#var alt_tile = tilemap.get_cell_alternative_tile(0, cell_pos)
			#
			#print("Cell at ", cell_pos, ": source_id=", source_id, ", atlas_coords=", atlas_coords, ", alt_tile=", alt_tile)
			#
			## Calculate new atlas coordinates
			#var new_atlas_coords = Vector2i(atlas_coords.x + 1, atlas_coords.y)
			#
			## Set the new tile
			#tilemap.set_cell(0, cell_pos, source_id, new_atlas_coords, alt_tile)
	#
	## Force update the TileMap
	#tilemap.force_update()
