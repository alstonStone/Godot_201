extends Node2D


func _ready() -> void:
	$Timer.start(randf_range(3.0,7.0))

func resolve_duel(action):
	if action == "p1_shoot":
		$Cowboy2.kill()
	if action == "p2_shoot":
		$Cowboy.kill()


func start_duel():
	display_shoot()
	$Cowboy.is_allowed_to_shoot = true
	$Cowboy2.is_allowed_to_shoot = true
	

func display_shoot():
	$Plank/Label.text = "SHOOT"
	$Plank/Label.modulate = Color.hex(0x00ff00ff)


func _on_cowboy_winner() -> void:
	$EndMusic.play()
