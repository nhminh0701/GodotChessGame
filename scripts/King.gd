"""
Original work by henriiquecampos/Chess-game-in-Godot.
https://github.com/henriiquecampos/Chess-game-in-Godot
"""


extends Sprite


# Base piece access variables
export var which_piece = "king"
onready var base = $BasePiece

# King only variables
var can_cast = true
var dead = false
#####################################

func calc_cell():
	print("Calculating King")
	var movable_cells = []
	
	if base.already_moved:
		can_cast = false
		
	append_base_movable_cells(
		Vector2(base.parent_cell.x - 1, base.parent_cell.y - 1), 
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x + 1, base.parent_cell.y + 1), 
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x - 1, base.parent_cell.y + 1), 
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x + 1, base.parent_cell.y - 1), 
		movable_cells)
		
	#Vertical and horizontal
	append_base_movable_cells(
		Vector2(base.parent_cell.x, base.parent_cell.y - 1), 
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x, base.parent_cell.y + 1), 
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x - 1, base.parent_cell.y), 
		movable_cells)
	append_base_movable_cells(
		Vector2(base.parent_cell.x + 1, base.parent_cell.y), 
		movable_cells)
	
	return movable_cells
	
	
func append_base_movable_cells(cell, movable_cells):
	if cell.x >= 8 or cell.x < 0 or cell.y >= 8 or cell.y < 0:
		return
	if cell in base.controller.pieces_cells:
		return
	movable_cells.append(cell)
