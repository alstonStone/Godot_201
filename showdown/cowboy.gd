extends Node2D

enum State {Waiting, Shooting, Dying, Fumbling}

signal shot_gun(action)
signal winner

@export var action_name = "p1_shoot"

var current_state = State.Waiting
var is_allowed_to_shoot = false


func _process(delta: float) -> void:
	
	if current_state == State.Waiting and Input.is_action_just_pressed(action_name):
		if is_allowed_to_shoot :
			shoot()
		else:
			fumble()




func shoot():
	$AudioStreamPlayer.play()
	current_state = State.Shooting
	$AnimationPlayer.play("shoot")
	shot_gun.emit(action_name)

func fumble():
	current_state = State.Fumbling
	$AnimationPlayer.play("fumble")

func kill():
	current_state = State.Dying
	$AnimationPlayer.play("die")

func holster():
	$AnimationPlayer.play("holster")

func wait():
	current_state = State.Waiting
	$AnimationPlayer.play("idle")


func display_winner():
	$WinnerSprite.visible = true
	winner.emit()
