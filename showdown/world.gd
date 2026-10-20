extends Node2D


signal reset_world
var game_over = false



func _ready() -> void:
	$Timer.start(randf_range(3.0,7.0))

func _process(delta: float) -> void:
	if game_over and Input.is_action_just_pressed("restart"):
		reset_world.emit()


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
	game_over = true
	$EndMusic.play()
	$Plank.visible = false
	$RestartLabel.visible = true
	flicker_restart_label()
	
func flicker_restart_label():
	$AnimationPlayer.play("restart")
		
