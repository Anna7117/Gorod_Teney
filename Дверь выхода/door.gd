extends Node2D

@onready var anim = $AnimatedSprite2D
@export var next_scene : String

func _on_анимация_двери_body_entered(body: Node2D) -> void:
	if body.name == "Игрок":
		anim.play("open_door")
		
func _on_анимация_двери_body_exited(body: Node2D) -> void:
	if body.name == "Игрок":
		anim.play("close_door")

func _on_переход_на_новый_уровень_body_entered(body: Node2D) -> void:
	if body.name == "Игрок" and body.key:
		if next_scene.get_file() != "финал.tscn":
			GlobalVars.save_current_level(next_scene)
		get_tree().change_scene_to_file(next_scene)
		
