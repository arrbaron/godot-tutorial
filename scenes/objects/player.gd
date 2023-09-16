extends CharacterBody2D

var move_speed: int = 200

func _process(_delta):
	handle_input()
	
func handle_input():
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * move_speed
	move_and_slide()
	
	if (Input.is_action_pressed('primary action')):
		print('shoot laser')
		
	if (Input.is_action_pressed("secondary action")):
		print('shoot grenade')
