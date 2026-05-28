extends CharacterBody2D

const speed = 150
var pogony = false
var alive = true
@onready var anim = $AnimatedSprite2D
@onready var timer = $"смерть игрока/Timer"

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	var player = %"Игрок"
	var direction = (player.position - self.position).normalized()
	
	if alive == true:
		if pogony == true:
			velocity.x = direction.x * speed
			anim.play("ходьба")
		else:
			velocity.x = 0
			anim.play("на месте")
		
		if direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	move_and_slide()


func _on_обнаружение_body_entered(body: Node2D) -> void:
	if body.name == "Игрок":
		pogony = true

func _on_обнаружение_body_exited(body: Node2D) -> void:
	if body.name == "Игрок":
		pogony = false

func _on_смерть_body_entered(body: Node2D) -> void:
	if body.name == "Игрок":
		body.velocity.y -= 300
		alive = false
		anim.play("смерть")
		await anim.animation_finished
		queue_free()

func _on_смерть_игрока_body_entered(body: Node2D) -> void:
	if body.name == "Игрок":
		body.get_node("CollisionShape2D").queue_free()
		timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
