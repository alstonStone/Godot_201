extends Node2D


func _ready() -> void:
	$Timer.start(randf_range(3.0,7.0))

func resolve_duel(action):
	if action == "p1_shoot":
		$Cowboy2.kill()
	if action == "p2_shoot":
		$Cowboy.kill()


func start_duel():
	$Cowboy.is_allowed_to_shoot = true
	$Cowboy2.is_allowed_to_shoot = true
	
