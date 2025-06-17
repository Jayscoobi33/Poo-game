extends CharacterBody2D

var direction
var speed = 0
var points = 200
var type = "poo2"

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
		
