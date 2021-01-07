"""
Original work by henriiquecampos/Chess-game-in-Godot.
https://github.com/henriiquecampos/Chess-game-in-Godot
"""


extends Sprite

export var which_piece = "Piece"
onready var base = $BasePiece

var turn = 1

####################################
func calc_cell():
	print("Calculating pawn")
	if base.parent_cell.y in [0, 7]:
		return
	
	var movable_cells = []
		
	if self.is_in_group("black"):
		turn = -1
	if base.already_moved:
		movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y - 1 * turn))
				
	else:
		# En Passant variables
		base.controller.pawn_pos = base.board.world_to_map(position)
		base.controller.pawn_pos = Vector2(base.controller.pawn_pos.x, base.controller.pawn_pos.y + (1 * -turn))
		base.controller.pawn = self
				
		movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y - 1 * turn))
		movable_cells.append(Vector2(base.parent_cell.x, base.parent_cell.y - 2 * turn))
				
	for cell in base.controller.pieces_cells:
		if cell == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)):
			movable_cells.append(cell)
		if cell == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)):
			movable_cells.append(cell)
						
		if cell == Vector2(base.parent_cell.x, base.parent_cell.y - 1 * turn):
			movable_cells.erase(cell)
						
		if base.controller.pawn_pos == Vector2(base.parent_cell.x + (1 * -turn), base.parent_cell.y + (1 * -turn)) and base.controller.en_passant:
			movable_cells.append(base.controller.pawn_pos)
		elif base.controller.pawn_pos == Vector2(base.parent_cell.x - (1 * -turn), base.parent_cell.y + (1 * -turn)) and base.controller.en_passant:
			movable_cells.append(base.controller.pawn_pos)
		base.already_moved = true
			
				
	return movable_cells
