extends Node2D

@export var TEST_POO_LEFT = preload("res://Scenes/poo1.tscn")

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
	


func _on_timer_timeout() -> void:
	var poo = TEST_POO_LEFT.instantiate()
	get_parent().add_child(poo)
	poo.name = "poo"
	print(poo.name)
	if global_position.x < 0:
		poo.direction = 1
	else:
		poo.direction = 0
	poo.global_position = global_position
