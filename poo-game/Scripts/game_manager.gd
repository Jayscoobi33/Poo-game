extends Node

@onready var scoreText: Label = $"../score"

var score = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scoreText.text = "SCORE:"

func add_point():
	score += 1
	scoreText.text = "SCORE: " + str(score)
