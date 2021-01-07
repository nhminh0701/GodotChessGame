"""
Original work by henriiquecampos/Chess-game-in-Godot.
https://github.com/henriiquecampos/Chess-game-in-Godot
"""

extends Area2D

class_name BasePiece


# Base logic booleans
var is_selected = false
var is_on_top = false
var mouse_click = false
var mouse_clicked = false
var already_moved = false

# Cell movement logic
var movable_cells = []
var parent_cell = null
var selected_cell = null


# Capture required variables
onready var parent = get_node('..')
onready var board = get_node('/root/GamePlay/Board')
onready var controller = get_node('/root/GamePlay')


func _ready() -> void:
	pass
	

# warning-ignore:unused_argument
func _process(delta: float) -> void:
	mouse_click = Input.is_action_pressed("mouse")
	if mouse_click and not mouse_clicked:
		if is_on_top:
			controller.reset_markers()
			select_piece()
		else:
			move_to()
	mouse_clicked = mouse_click	
			
			
func select_piece():
	if is_selected == false and parent.is_in_group(str(controller.turn)):
		is_selected = true
		parent_cell = board.world_to_map(parent.position)
		movable_cells = parent.calc_cell()
		controller.display_movable_cells(movable_cells)
	else:
		is_selected = false
		print("delected")

func move_to():
	selected_cell = board.world_to_map(get_viewport().get_mouse_position())
	
	
	if not selected_cell == parent_cell:
		if selected_cell in movable_cells:
			if board.world_to_map(controller.who.position) in movable_cells:
				print(controller.who.get_groups())
				print(parent.get_groups())
				if controller.who.get_groups() != parent.get_groups():
					controller.who.queue_free()
			parent.position = board.map_to_world(selected_cell)
			
			movable_cells.clear()
			is_selected = false
			controller.toggle_turn()


func _on_basepiece_mouse_entered() -> void:
	is_on_top = true
	controller.who = parent


func _on_basepiece_mouse_exited() -> void:
	is_on_top = false
