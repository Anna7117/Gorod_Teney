extends Node

@onready var paused_menu = $"../CanvasLayer/ПаузаМеню"

var game_paused: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		game_paused = !game_paused
	if game_paused == true:
		get_tree().paused = true
		paused_menu.show()
	else:
		get_tree().paused = false
		paused_menu.hide()


func _on_продолжить_pressed() -> void:
	game_paused = !game_paused


func _on_выйти_pressed() -> void:
	game_paused = !game_paused
	get_tree().paused = false
	get_tree().change_scene_to_file("res://ВСЕ МЕНЮ/меню_режимов.tscn")


func _on_перезапустить_pressed() -> void:
	game_paused = !game_paused
	get_tree().reload_current_scene()
	
	
