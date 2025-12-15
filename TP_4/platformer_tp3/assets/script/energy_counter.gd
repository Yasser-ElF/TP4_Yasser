extends Label

func _ready():
	# update immediately
	_on_energy_changed(GameManager.energy_cells, GameManager.TOTAL_CELLS)

	# listen to updates
	GameManager.energy_cells_changed.connect(_on_energy_changed)

func _on_energy_changed(current: int, total: int) -> void:
	text = str(current) + " / " + str(total)
