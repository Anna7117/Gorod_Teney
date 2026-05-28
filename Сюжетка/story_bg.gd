extends ParallaxBackground

var speed = 70

func _process(delta: float) -> void:
	scroll_offset.x -= speed * delta
