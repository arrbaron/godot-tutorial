extends CharacterBody2D

@export var move_speed: int = 600
var can_laser: bool = true
var can_grenade: bool = true

signal laser(position: Vector2, direction: Vector2)
signal grenade(position: Vector2, direction: Vector2)

func _process(_delta):
	handle_input()
	
func handle_input():
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	var player_direction = (get_global_mouse_position() - position).normalized()
	velocity = direction * move_speed
	move_and_slide()
	
	look_at(get_global_mouse_position())
	
	if (Input.is_action_pressed('primary action')):
		if (!can_laser): return
		var laser_markers = $LaserStartPositions.get_children()
		# var selected_laser = laser_markers[randi() % laser_markers.size()]
		var selected_laser = laser_markers.pick_random()

		can_laser = false
		$LaserTimer.start()
		laser.emit(selected_laser.global_position, player_direction)
		
	if (Input.is_action_pressed("secondary action")):
		if (!can_grenade): return
		
		grenade.emit($GrenadeStartPosition.global_position, player_direction)
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
