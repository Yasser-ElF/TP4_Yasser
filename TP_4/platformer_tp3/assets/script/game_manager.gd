extends Node

signal energy_cells_changed(current: int, total: int)

const TOTAL_CELLS := 10

var current_area = 1
var area_path = "res://platformer_tp3/assets/scenes/areas/"
var energy_cells = 0

func next_level():
	current_area += 1
	var full_path = area_path + "area_" + str(current_area) + ".tscn"

	# safer to defer scene change (avoids physics callback issues)
	get_tree().call_deferred("change_scene_to_file", full_path)
	call_deferred("set_up_area")

func set_up_area():
	reset_energy_cells()

func add_energy_cell():
	energy_cells += 1
	emit_signal("energy_cells_changed", energy_cells, TOTAL_CELLS)

	if energy_cells >= TOTAL_CELLS:
		if current_area == 3:
			get_tree().call_deferred("change_scene_to_file", "res://platformer_tp3/assets/scenes/gameover.tscn")
		else:
			var portal = get_tree().get_first_node_in_group("area_exits") as AreaExit
			portal.open()

func reset_energy_cells():
	energy_cells = 0
	emit_signal("energy_cells_changed", energy_cells, TOTAL_CELLS)
