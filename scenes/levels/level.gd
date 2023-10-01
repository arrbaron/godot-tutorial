extends Node2D
class_name BaseLevel

var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")


func _on_player_laser(pos: Vector2, direction: Vector2):
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$Projectiles.add_child(laser)


func _on_player_grenade(pos: Vector2, direction: Vector2):
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.position = pos
	grenade.linear_velocity = direction * grenade.speed
	$Projectiles.add_child(grenade)


func _on_house_player_entered():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D2, 'zoom', Vector2(1, 1), 1).from(0.5)
#	tween.tween_property($Player, 'modulate:a', 0, 2).set_trans(Tween.TRANS_QUAD)


func _on_house_player_exited():
	var tween = create_tween()
	tween.tween_property($Player/Camera2D2, 'zoom', Vector2(0.6, 0.6), 1)
