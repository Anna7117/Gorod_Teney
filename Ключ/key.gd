extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Игрок":
		body.key = true
		queue_free()
