extends CharacterBody2D

const speed: int = 250

func _process(_delta):
	handle_movement()
	
func handle_movement():
	var direction = Vector2.RIGHT
	velocity = direction * speed
	move_and_slide()
	
	if (position.x > 1000):
		position = Vector2(0, position.y)

func hit():
	print('drone hit')
