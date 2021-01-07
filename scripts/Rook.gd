"""
Original work by henriiquecampos/Chess-game-in-Godot.
https://github.com/henriiquecampos/Chess-game-in-Godot
"""


extends Sprite


#Base piece access variables
export var which_piece = "rook"
onready var base = $BasePiece


# Rook only variables
var can_cast = true
export var rook_var = 0
#####################################

func calc_cell():
	
	print("Calculating rook")
	var movable_cells = []
	if base.already_moved:
		can_cast = false
	for i in range(1, 8):
		var cell = Vector2(base.parent_cell.x, base.parent_cell.y - i)
		if cell in base.controller.pieces_cells:
			break
		append_base_movable_cells(cell, movable_cells)
	for i in range(1, 8):
		var cell = Vector2(base.parent_cell.x, base.parent_cell.y + i)
		if cell in base.controller.pieces_cells:
			break
		append_base_movable_cells(cell, movable_cells)
	for i in range(1, 8):
		var cell = Vector2(base.parent_cell.x - i, base.parent_cell.y)
		if cell in base.controller.pieces_cells:
			break
		append_base_movable_cells(cell, movable_cells)
	for i in range(1, 8):
		var cell = Vector2(base.parent_cell.x + i, base.parent_cell.y)
		if cell in base.controller.pieces_cells:
			break
		append_base_movable_cells(cell, movable_cells)
				
	return movable_cells


func append_base_movable_cells(cell, movable_cells):
	if cell.x >= 8 or cell.x < 0 or cell.y >= 8 or cell.y < 0:
		return
	movable_cells.append(cell)
