extends Node2D

@export var POO1 = preload("res://Scenes/poo1.tscn")
@export var POO2 = preload("res://Scenes/poo2.tscn")
@export var POO3 = preload("res://Scenes/poo3.tscn")
@export var POO4 = preload("res://Scenes/poo4.tscn")
@onready var poo_1_timer: Timer = $poo1Timer
@onready var poo_2_timer: Timer = $poo2Timer
@onready var poo_3_timer: Timer = $poo3Timer
@onready var poo_4_timer: Timer = $poo4Timer

@onready var gameTime: Timer = $clock


var second = 1000
var poo1SpawnWait = 3
var poo2SpawnWait = 3
var poo3SpawnWait = 3
var levelIncrease = 10
var level = 0
func _ready() -> void:
	var time_seed = Time.get_unix_time_from_system()
	seed(time_seed)
	
	pass

func logWithBase(value: int, base: int): return log(value)/log(base)
	
func _physics_process(delta: float) -> void:
	pass
	
var clock = 0
func _on_clock_timeout() -> void:
	print("clock" + str(clock))
	clock += 1
	if clock % levelIncrease == 0:
		level += 1
	gameTime.wait_time = 1
	pass 

func calc_speed(poo: CharacterBody2D) -> void:
	if poo.type == "poo1":
		poo.speed = 30*(clock**0.5) + 300
	elif poo.type == "poo2":
		poo.speed = 70*(clock**0.5) + 300
	elif poo.type == "poo3":
		poo.speed = 40*(clock**0.5) + 300
	elif poo.type == "poo4":
		poo.speed = 300
	print(poo.type + " speed: " + str(poo.speed))
	
	

func pooSpawn(yPos: int, poo: CharacterBody2D, timer: Timer) -> void:
	var side = randi() % 2
	calc_speed(poo)
	
	
	if side == 0:
		poo.direction = 1
		poo.global_position.y = yPos
		poo.global_position.x = -100
	else:
		poo.direction = -1
		poo.global_position.y = yPos
		poo.global_position.x = 2020
		
	if poo.name == "poo1":
		timer.wait_time = 1
	elif poo.name == "poo2":
		timer.wait_time = randi() % 4 + 1
	elif poo.type == "poo3":
		timer.wait_time = randi() % 5 + 1
	elif poo.type == "poo4":
		timer.wait_time = randi() % 6 + 1
	pass 

func _on_poo_1_timer_timeout() -> void:
	var poo = POO1.instantiate()
	get_parent().add_child(poo)
	pooSpawn(1060, poo, poo_1_timer)

func _on_poo_2_timer_timeout() -> void:
	var poo = POO2.instantiate()
	get_parent().add_child(poo)
	pooSpawn(1010, poo, poo_2_timer)

func _on_poo_3_timer_timeout() -> void:
	var poo = POO3.instantiate()
	get_parent().add_child(poo)
	pooSpawn(850, poo, poo_3_timer)

func _on_poo_4_timer_timeout() -> void:
	var poo = POO4.instantiate()
	get_parent().add_child(poo)
	pooSpawn(700, poo, poo_4_timer)
