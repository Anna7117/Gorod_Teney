extends Node2D

func _ready() -> void:
	if GlobalVars.last_level_easy == "":
		$"Продолжить_1".visible = false
	if GlobalVars.last_level_hard == "":
		$"Продолжить_2".visible = false

func _on_легкий_pressed() -> void:
	GlobalVars.last_level_easy = ""
	GlobalVars.save_game()
	# Устанавливаем текущий режим и начинаем с сюжета
	GlobalVars.current_mode = "easy"
	get_tree().change_scene_to_file("res://Сюжетка/Сюжет_1.tscn")
	
func _on_сложный_pressed() -> void:
	GlobalVars.last_level_hard = ""
	GlobalVars.save_game()
	# Устанавливаем текущий режим и начинаем с сюжета
	GlobalVars.current_mode = "hard"
	get_tree().change_scene_to_file("res://Сюжетка/сюжет_2.tscn")

func _on_продолжить_1_pressed() -> void:
	GlobalVars.current_mode = "easy"
	get_tree().change_scene_to_file(GlobalVars.last_level_easy)

func _on_продолжить_2_pressed() -> void:
	GlobalVars.current_mode = "hard"
	get_tree().change_scene_to_file(GlobalVars.last_level_hard)

func _on_назад_pressed() -> void:
	get_tree().change_scene_to_file("res://ВСЕ МЕНЮ/меню.tscn")
