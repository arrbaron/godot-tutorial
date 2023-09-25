extends Area2D

class_name Item

enum ITEM_TYPE { LASER, GRENADE, HEALTH }

var rotation_speed: int = 3
var types = [ITEM_TYPE.LASER, ITEM_TYPE.LASER, ITEM_TYPE.LASER, ITEM_TYPE.GRENADE, ITEM_TYPE.HEALTH]
var type = types.pick_random()

func _ready():
	set_color()


func _process(delta):
	rotation += rotation_speed * delta
	
	
func set_color():
	if type == ITEM_TYPE.LASER:
		$Sprite2D.modulate = Color.SKY_BLUE
	elif type == ITEM_TYPE.GRENADE:
		$Sprite2D.modulate = Color.RED
	else:
		$Sprite2D.modulate = Color.GREEN


func _on_body_entered(body):
	body.add_item(type)
	queue_free()
