extends CharacterBody2D

const MIN_DISTANCE_TO_PLAYER := 185

var following_player := false
var can_attack := true
var can_receive_hit := true
var health := 20
var speed := 10000

signal attack

func hit():
	if not can_receive_hit: return

	var damage_received = 10
	$AnimatedSprite2D.material.set_shader_parameter('progress', 1)
	$Particles/HitParticles.emitting = true

	health -= damage_received

	can_receive_hit = false
	$Timers/ReceiveHitCooldown.start()

	if health <= 0:
		await get_tree().create_timer(0.5).timeout
		queue_free()

func _physics_process(delta):
	if following_player and position.distance_to(Globals.player_pos) > MIN_DISTANCE_TO_PLAYER:
		look_at(Globals.player_pos)
		var player_direction = (Globals.player_pos - position).normalized()
		velocity = player_direction * speed * delta

		move_and_slide()

func _on_notice_area_body_entered(_body:Node2D):
	following_player = true
	$AnimatedSprite2D.play('walk')

func _on_notice_area_body_exited(_body:Node2D):
	following_player = false
	$AnimatedSprite2D.stop()

func _on_attack_area_body_entered(_body:Node2D):
	$AnimatedSprite2D.play('attack')

func _on_attack_area_body_exited(_body:Node2D):
	$AnimatedSprite2D.stop()
	$AnimatedSprite2D.play('walk')

func _on_receive_hit_cooldown_timeout():
	can_receive_hit = true
	$AnimatedSprite2D.material.set_shader_parameter('progress', 0)

func _on_attack_cooldown_timeout():
	can_attack = true


func _on_animated_sprite_2d_animation_finished():
	attack.emit()
	$Timers/AttackCooldown.start()
	$AnimatedSprite2D.play('attack')
	can_attack = false
