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

var health: int = 60:
	get:
		return health
	set(value):
		health = value
		health_change.emit()
