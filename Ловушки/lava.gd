extends Node2D

@onready var timer = $Timer

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Игрок":
		body.velocity.y -= 150
		body.get_node("CollisionShape2D").queue_free()
		timer.start()
	
func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
