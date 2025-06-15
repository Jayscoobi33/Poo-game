extends CharacterBody2D

var direction = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if global_position.x > 1900:
		direction = 0
	elif global_position.x < 20:
		direction = 1
	
	if direction == 1:
		position.x += 5
	else:
		position.x -= 5 
	
	pass
		
