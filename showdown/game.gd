extends Node2D

var world = null

func _ready() -> void:
	create_new_world()


func create_new_world():
	var world_blueprint = load("res://world.tscn")
	world = world_blueprint.instantiate()
	world.reset_world.connect(reset_world)
	add_child(world)


func reset_world():
	world.queue_free()
	create_new_world()
	
