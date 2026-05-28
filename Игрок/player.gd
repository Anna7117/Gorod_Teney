extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -360.0
const DOUBLE_JUMP_VELOCITY = -320.0
const WALL_JUMP_VELOCITY = -350.0

var gold = 0
var key: bool = false
var can_double_jump: bool = true
var last_wall = 0  #Запоминаем последнюю стену, от которой оттолкнулись

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#Гравитация
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#Прыжок
	if Input.is_action_just_pressed("jump"):
		var current_wall = get_wall_normal().x  # Касается ли стены и какой
		
		#Отскок от стены (только если это НЕ та же стена, что в прошлый раз)
		if is_on_wall() and not is_on_floor() and current_wall != last_wall:
			velocity.y = WALL_JUMP_VELOCITY
			anim.play("прыжок")
			can_double_jump = true
			last_wall = current_wall  #Запоминаем стену
		#Обычный прыжок с земли
		elif is_on_floor():
			velocity.y = JUMP_VELOCITY
			anim.play("прыжок")
			can_double_jump = true
			last_wall = 0  #Сбрасываем на земле
		#Двойной прыжок
		elif can_double_jump and not is_on_wall():
			velocity.y = DOUBLE_JUMP_VELOCITY
			anim.play("прыжок")
			can_double_jump = false
	
	#Сброс при касании земли
	if is_on_floor():
		can_double_jump = true
		last_wall = 0
	
	#Движение
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("бег")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("анимация на месте")
		
	if direction == -1:
		$AnimatedSprite2D.flip_h = true
	elif direction == 1:
		$AnimatedSprite2D.flip_h = false
			
	if velocity.y > 0:
		anim.play("падение")
		
	move_and_slide()
