extends Node

var score = 0
@onready var счетчик = $Счетчик

func add_point():
	score += 1
	счетчик.text = "Монеты: " + str(score)
