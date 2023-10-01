extends BaseLevel

func _on_gate_player_entered_gate(_body):
	var tween = create_tween()
	tween.tween_property($Player, 'speed', 0, 0.5)
	TransitionLayer.change_scene("res://scenes/levels/inside.tscn")


func _on_house_player_entered():
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Player/Camera2D2, 'zoom', Vector2(1, 1), 1).from(0.5)
#	tween.tween_property($Player, 'modulate:a', 0, 2).set_trans(Tween.TRANS_QUAD)


func _on_house_player_exited():
	var tween = create_tween()
	tween.tween_property($Player/Camera2D2, 'zoom', Vector2(0.6, 0.6), 1)

