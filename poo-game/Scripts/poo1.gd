extends CharacterBody2D

@onready var animated: Sprite2D = $animated

var direction
var speed = 0
var points = 100
var type = "poo1"

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
		animated.flip_h = true
	pass
		
