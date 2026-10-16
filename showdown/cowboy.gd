extends Node2D

var current_health = 100
var is_alive = true
var ammo_count = 6
var is_reloding = false

func _ready() -> void:
	set_can_fire_test(true,6,false)
	print(can_fire())
	set_can_fire_test(true, 0 , false)
	print(can_fire())
	set_can_fire_test(true,6,true)
	print(can_fire())
	pass

func _process(delta: float) -> void:
	Input.is_action_just_pressed("p1_shoot")
	pass

func get_state():
	if current_health <= 0:
		return "DOWN"
	elif current_health < 30:
		return "CRITICAL"
	elif current_health < 60:
		return "WOUNDED"
	else:
		return "SAFE"

func resolve_draw(you:int,rival:int):
	if you < rival:
		return "WIN"
	elif rival < you:
		return "LOSE"
	else:
		return "DRAW"

func can_fire():
	if is_alive and ammo_count > 0 and not is_reloding :
		return true
	else:
		return false

func set_can_fire_test(ia:bool,ac:int,ir:bool):
	is_alive = ia
	ammo_count = ac
	is_reloding = ir
