extends Label

var full_text = "Главная лампа зажглась. Свет побежал по проводам, загораясь в каждом окне, на каждой улице. Город Мутных Огней снова задышал. Двери, которые были заперты так долго, теперь открыты."
@export var typing_speed: float = 0.03  # секунд на букву

var current_index = 0
var skip_animation = false

func _ready():
	text = ""  # Очищаем текст в начале
	type_text()
	GlobalVars.reset_after_finale()
	
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
	var button = $"../Выход" 
	button.visible = true

func _on_выход_pressed() -> void:
	get_tree().change_scene_to_file("res://ВСЕ МЕНЮ/меню_режимов.tscn")
