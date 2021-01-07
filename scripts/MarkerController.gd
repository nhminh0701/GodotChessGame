extends Node2D


# Declare member variables here. Examples:
# var a: int = 2
# var b: String = "text"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_markers()


func mark_movable_cells(movable_cells):
	for cell in movable_cells:
		var marker_index = cell.x + cell.y * 8
		get_child(marker_index).visible = true


func reset_markers():
	for marker in get_children():
		marker.visible = false
