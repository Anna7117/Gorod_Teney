extends Label

var full_text = "Предыстория:
Город Мутных Огней умирает. По улицам бродит Гудящая Тень — сгусток старого шума и холода. Она чует свет. Если коснётся тебя — лампы погаснут навсегда. Двери заперты. Осталась последняя искра — ты.

Что сделать:
Пройди три района, уворачиваясь от Гудящей Тени. На каждом уровне собирай монетки и найди ключ. Без ключа дверь на следующий уровень не откроется. После прохождения всех уровней включится главный генератор, и огни города зажгутся снова."

@export var typing_speed: float = 0.02  # секунд на букву

var current_index = 0
var skip_animation = false

func _ready():
	text = ""  # Очищаем текст в начале
	type_text()
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		skip_animation = true	

func type_text():
	if skip_animation:
		text = full_text
		current_index = full_text.length()
		show_exit_button()
		return
	if current_index < full_text.length():
		text += full_text[current_index]  # Добавляем одну букву
		current_index += 1
		await get_tree().create_timer(typing_speed).timeout  # Ждём
		type_text()  # Рекурсивно вызываем снова
	else:
		# Текст напечатан полностью — показываем кнопку
		show_exit_button()

func show_exit_button():
	# Находим кнопку и делаем её видимой
	var button = $"../Продолжить"
	button.visible = true


func _on_продолжить_pressed() -> void:
	GlobalVars.save_current_level("res://Уровни/сложный_1.tscn")
	get_tree().change_scene_to_file("res://Уровни/сложный_1.tscn")
