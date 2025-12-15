extends CanvasLayer
@export var first_level_path: String = "res://platformer_tp3/assets/scenes/areas/area_1.tscn"

func _ready() -> void:
	$CenterContainer/VBoxContainer/StartButton.pressed.connect(_on_start_pressed)
	$CenterContainer/VBoxContainer/QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	# Optional: reset your manager when starting a new run
	if has_node("/root/GameManager"):
		GameManager.current_area = 1
		GameManager.reset_energy_cells()

	get_tree().change_scene_to_file(first_level_path)

func _on_quit_pressed() -> void:
	get_tree().quit()
