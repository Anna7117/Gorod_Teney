extends Node

var config
var path_to_save_file = "user://game_project"
var section_name = "game"

var last_level_easy: String = ""   # для лёгкого режима
var last_level_hard: String = ""   # для сложного режима
var current_mode: String = "easy"  # easy или hard

func _ready() -> void:
	load_game()

func save_game() -> void:
	config.set_value(section_name, "last_level_easy", last_level_easy)
	config.set_value(section_name, "last_level_hard", last_level_hard)
	config.save(path_to_save_file)
	

func load_game() -> void:
	config = ConfigFile.new()
	config.load(path_to_save_file)
	last_level_easy = config.get_value(section_name, "last_level_easy", "")
	last_level_hard = config.get_value(section_name, "last_level_hard", "")

	
func reset_after_finale():
	if current_mode == "easy":
		last_level_easy = ""
	elif current_mode == "hard":
		last_level_hard = ""
	save_game()

# Сохранить уровень для текущего режима
func save_current_level(level_path: String) -> void:
	if current_mode == "easy":
		last_level_easy = level_path
	elif current_mode == "hard":
		last_level_hard = level_path
	save_game()
	
