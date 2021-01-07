"""
Original work by henriiquecampos/Chess-game-in-Godot.
https://github.com/henriiquecampos/Chess-game-in-Godot
"""


extends Sprite


# Base piece access variables
export var which_piece = "knight"
onready var base = $BasePiece


func calc_cell():
	
	print("Calculating knight")
	var movable_cells = []
	append_base_movable_cells(
			Vector2(base.parent_cell.x +2, base.parent_cell.y +1),
			movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x +1, base.parent_cell.y +2),
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x +2, base.parent_cell.y - 1),
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x +1, base.parent_cell.y -2),
		movable_cells)
			
	append_base_movable_cells(
		Vector2(base.parent_cell.x -2, base.parent_cell.y +1),
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x -1, base.parent_cell.y +2),
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x -2, base.parent_cell.y -1),
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x -1, base.parent_cell.y -2),
		movable_cells)
		
	return movable_cells


func append_base_movable_cells(cell, movable_cells):
	if cell.x >= 8 or cell.x < 0 or cell.y >= 8 or cell.y < 0:
		return
	if cell in base.controller.pieces_cells:
		return
	movable_cells.append(cell)
