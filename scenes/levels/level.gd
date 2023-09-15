extends Node2D

const move_speed: float = 5
const rotation_speed: float = 100
var test_array: Array[String] = ['Test', 'Hello', 'Yo']

func _ready():
#	get_node("Logo").rotation_degrees = 90
	$Logo.rotation_degrees = 90
	
	print(test_array[0])
	
	for i in test_array:
		print(i)

func _process(delta):
	$Logo.rotation_degrees += rotation_speed * delta
	
	if $Logo.rotation_degrees > 180:
		$Logo.rotation_degrees = 0
		
	move()
	
		

func move():
	$Logo.position += Vector2(move_speed, 0)
	
	if $Logo.pos.x > 1000:
		$Logo.pos = Vector2.ZERO
		
