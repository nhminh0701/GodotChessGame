"""
Original work by henriiquecampos/Chess-game-in-Godot.
https://github.com/henriiquecampos/Chess-game-in-Godot
"""


extends Node


var turn = "black"

func toggle_turn():
	reset_markers()
	setup_pieces()
#	if turn == "black":
#		turn = "white"
#	else:
#		turn = "black"
	process_en_passant()


var who = null
var pieces = []
var pieces_cells = []

var pawn = null
var pawn_pos = null
var en_passant = false
onready var Board = $Board
onready var MarkerController = $MarkerController


func _ready() -> void:
	setup_pieces()
	

func setup_pieces() :
	pieces_cells.clear()
	pieces = $BlackPlayer.get_children() + $WhitePlayer.get_children()
	for piece in pieces:
		pieces_cells.append(Board.world_to_map(piece.position))


func process_en_passant():
	if pawn != null and pawn.is_in_group(turn):
		print("Cleaning")
		pawn = null
		pawn_pos = null
		en_passant = false
	elif pawn == null:
		en_passant = false
		print("Can't Passant")
	else:
		en_passant = true
		print("Can En Passant")


func display_movable_cells(movable_cells):
	MarkerController.mark_movable_cells(movable_cells)


func reset_markers():
	MarkerController.reset_markers()
