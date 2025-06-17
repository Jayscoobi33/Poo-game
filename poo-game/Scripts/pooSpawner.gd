extends Node2D

@export var POO1 = preload("res://Scenes/poo1.tscn")
@export var POO2 = preload("res://Scenes/poo2.tscn")
@export var POO3 = preload("res://Scenes/poo3.tscn")
@onready var poo_1_timer: Timer = $poo1Timer
@onready var poo_1_timer_2: Timer = $poo1Timer2
@onready var poo_2_timer: Timer = $poo2Timer


var second = 1000
var poo1SpawnWait = 5
var poo2SpawnWait = 3
var poo3SpawnWait = 5
var spawnVariation = 2
var poo1LowEnd
var poo1Range
var poo2LowEnd
var poo2Range
func _ready() -> void:
	randomize()
	pass

func _physics_process(delta: float) -> void:
	
	var rand_num = randi()
	pass

func _on_poo_1_timer_timeout() -> void:
	var side = randi() % 2
	var poo = POO1.instantiate()
	get_parent().add_child(poo)
	if side == 0:
		poo.direction = 1
		poo.global_position.y = 1060
		poo.global_position.x = -100
	else:
		poo.direction = -1
		poo.global_position.y = 1060
		poo.global_position.x = 2020
	poo.maxSpeed += 30
	poo1LowEnd = (poo.maxSpeed / 3) * 2
	poo1Range = poo.maxSpeed - poo1LowEnd
	poo.speed = randi() % poo1Range + poo1LowEnd

	poo_1_timer.wait_time = poo1SpawnWait
	poo_1_timer.wait_time += randi() % (spawnVariation * 2)
	pass 


func _on_poo_1_timer_2_timeout() -> void:
	print("hello")
	var poo = null
	var spawnChance = 100
	var side = randi() % 2
	var spawnFactor = randi() % 100 + 1
	
	if spawnFactor <= spawnChance:
		poo = POO1.instantiate()
		get_parent().add_child(poo)
	
	if poo != null:
		if side == 0:
			poo.direction = 1
			poo.global_position.y = 1060
			poo.global_position.x = -100
		else:
			poo.direction = -1
			poo.global_position.y = 1060
			poo.global_position.x = 2020
		poo.speed = randi() % poo1Range + poo1LowEnd
	if side == 1:
		poo_1_timer_2.wait_time = 3.5
	else:
		poo_1_timer_2.wait_time = 2
	pass 


func _on_poo_2_timer_timeout() -> void:
	var side = randi() % 2
	var poo = POO2.instantiate()
	get_parent().add_child(poo)
	if side == 0:
		poo.direction = 1
		poo.global_position.y = 1010
		poo.global_position.x = -100
	else:
		poo.direction = -1
		poo.global_position.y = 1010
		poo.global_position.x = 2020
	
	poo.maxSpeed += 50
	poo2LowEnd = (poo.maxSpeed / 3) * 2
	poo2Range = poo.maxSpeed - poo2LowEnd
	poo.speed = randi() % poo2Range + poo2LowEnd
	poo.speed = randi() % poo2Range + poo2LowEnd
	print("Poo2 speed" + str(poo.speed))
	poo_2_timer.wait_time = poo2SpawnWait
	poo_2_timer.wait_time += randi() % (spawnVariation * 2)
	pass 


func _on_poo_3_timer_timeout() -> void:
	var side = randi() % 2
	var poo = POO3.instantiate()
	get_parent().add_child(poo)
	if side == 0:
		poo.direction = 1
		poo.global_position.y = 900
		poo.global_position.x = -100
	else:
		poo.direction = -1
		poo.global_position.y = 900
		poo.global_position.x = 2020
	
	poo.maxSpeed += 30
	poo2LowEnd = (poo.maxSpeed / 3) * 2
	poo2Range = poo.maxSpeed - poo2LowEnd
	poo.speed = randi() % poo2Range + poo2LowEnd
	poo.speed = randi() % poo2Range + poo2LowEnd
	print("Poo2 speed" + str(poo.speed))
	poo_2_timer.wait_time = poo2SpawnWait
	poo_2_timer.wait_time += randi() % (spawnVariation * 2)
	pass 
