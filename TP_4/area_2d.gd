extends Area2D

var triggered := false

@onready var death_sfx: AudioStreamPlayer = $DeathSfx

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if triggered:
		return
	if body is PlayerController:
		triggered = true

		# Freeze gameplay so the player can't move during the death sound
		get_tree().paused = true
		death_sfx.process_mode = Node.PROCESS_MODE_ALWAYS

		death_sfx.play()

		# Wait until the sound is done
		await death_sfx.finished

		# Unpause, reset, reload
		get_tree().paused = false
		GameManager.reset_energy_cells()
		get_tree().reload_current_scene()
