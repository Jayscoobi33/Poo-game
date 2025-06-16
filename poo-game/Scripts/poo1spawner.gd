extends Node2D

@export var TEST_POO_LEFT = preload("res://Scenes/test_poo.tscn")

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass
	


func _on_timer_timeout() -> void:
	var poo1Right = TEST_POO_LEFT.instantiate()
	get_parent().add_child(poo1Right)
	poo1Right.direction = 0;
	poo1Right.global_position = global_position
