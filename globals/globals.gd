extends Node

signal laser_amount_change
signal grenade_amount_change
signal health_change

var laser_amount: int = 5:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		laser_amount_change.emit()
		
var grenade_amount: int = 3:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		grenade_amount_change.emit()

var player_vulnerable: bool = true

var health: int = 60:
	get:
		return health
	set(value):
		if value > health:
			health = min(value, 100) # sets health to value or 100, whichever is lower
		elif player_vulnerable:
			health = value
			player_vulnerable = false
			player_invulnerable_timer()
			
		health_change.emit()


var player_pos: Vector2

func player_invulnerable_timer():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true