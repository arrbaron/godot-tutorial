extends CharacterBody2D

var player_nearby: bool = false
var can_laser: bool = true
var use_right_gun: bool = true

signal laser(pos, direction)

func _process(_delta):
	if player_nearby:
		look_at(Globals.player_pos)
		
		if can_laser:
			var marker_node = $LaserSpawnPositions.get_child(int(use_right_gun))
			use_right_gun = not use_right_gun
			var pos: Vector2 = marker_node.global_position
			var direction: Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos, direction)
			can_laser = false
			$LaserCooldown.start()

func _on_attack_area_body_entered(_body:Node2D):
	player_nearby = true
	print('nearby true')

func _on_attack_area_body_exited(_body:Node2D):
	player_nearby = false
	print('nearby false');

func _on_laser_cooldown_timeout():
	can_laser = true
