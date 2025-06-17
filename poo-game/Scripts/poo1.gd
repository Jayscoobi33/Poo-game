extends CharacterBody2D

@onready var death_sound_poo_1: AudioStreamPlayer2D = $DeathSoundPoo1

var direction = 1
var speed = 300
var maxSpeed = 300
var points = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if global_position.x > 2120:
		queue_free()
	elif global_position.x < -200:
		queue_free()
	
	if direction == 1:
		position.x += speed * delta
	else:
		position.x -= speed * delta
	
	pass
		
