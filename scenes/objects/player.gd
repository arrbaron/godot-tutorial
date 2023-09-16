extends CharacterBody2D

var move_speed: int = 200
var can_laser: bool = true
var can_grenade: bool = true

signal laser
signal grenade


func _process(_delta):
	handle_input()
	
func handle_input():
	var direction = Input.get_vector('left', 'right', 'up', 'down')
	velocity = direction * move_speed
	move_and_slide()
	
	if (Input.is_action_pressed('primary action')):
		if (!can_laser): return
		laser.emit()
		can_laser = false
		$LaserTimer.start()
		
	if (Input.is_action_pressed("secondary action")):
		if (!can_grenade): return
		grenade.emit()
		can_grenade = false
		$GrenadeTimer.start()


func _on_laser_timer_timeout():
	can_laser = true


func _on_grenade_timer_timeout():
	can_grenade = true
