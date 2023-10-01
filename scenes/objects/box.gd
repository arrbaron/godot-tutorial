extends ItemContainer

func hit():
	if opened: return
	
	$LidSprite.hide()
	for i in range(5):
		var pos = $SpawnPositions.get_children().pick_random().global_position
		open.emit(pos, current_direction)
	
	opened = true
		
