extends Area2D

@onready var score_money = $"../../CanvasLayer/Счетчик монет"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Игрок":
		score_money.add_point()
		queue_free()
		
