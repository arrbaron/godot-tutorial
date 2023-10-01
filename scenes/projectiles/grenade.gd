extends RigidBody2D

@export var speed = 1500
var explosion_active: bool = false
var explosion_radius: int = 500

func explode():
	$AnimationPlayer.play("Explosion")
	explosion_active = true
	
func _process(_delta):
	if explosion_active:
		var targets = get_tree().get_nodes_in_group('Entity') + get_tree().get_nodes_in_group('Container')
		for target in targets:
			var distance = global_position.distance_to(target.global_position)
	
			if distance <= explosion_radius && target.has_method('hit'):
				target.hit()
