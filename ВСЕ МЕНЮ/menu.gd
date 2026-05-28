extends Node2D

func _on_выход_pressed() -> void:
	get_tree().quit()

func _on_играть_pressed() -> void:
	get_tree().change_scene_to_file("res://ВСЕ МЕНЮ/меню_режимов.tscn")
