extends ItemContainer

func hit():
	if opened: return
	
	$LidSprite.hide()
	open.emit($SpawnPositions/Marker2D.global_position, current_direction)
	opened = true
