extends Node2D

var move_speed: int = 200

func _process(delta):
	handle_input(delta)
	
func handle_input(delta):
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	position += direction * move_speed * delta
	
	if (Input.is_action_pressed('primary action')):
		print('shoot laser')
		
	if (Input.is_action_pressed("secondary action")):
		print('shoot grenade')
