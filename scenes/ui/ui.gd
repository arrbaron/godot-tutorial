extends CanvasLayer

var green: Color = Color.GREEN
var red: Color = Color.RED

@onready var laser_label: Label = $LaserCounter/VBoxContainer/Label
@onready var grenade_label: Label = $GrenadeCounter/VBoxContainer/Label
@onready var laser_icon: TextureRect = $LaserCounter/VBoxContainer/TextureRect
@onready var grenade_icon: TextureRect = $GrenadeCounter/VBoxContainer/TextureRect
@onready var health_bar: TextureProgressBar = $HealthBar/MarginContainer/TextureProgressBar

func _ready():
	Globals.connect('laser_amount_change', update_laser_text)
	Globals.connect('grenade_amount_change', update_grenade_text)
	Globals.connect('health_change', update_health)
	update_laser_text()
	update_grenade_text()
	update_health()

func update_laser_text():
	laser_label.text = str(Globals.laser_amount)
	update_color(Globals.laser_amount, laser_label, laser_icon)

func update_grenade_text():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount, grenade_label, grenade_icon)
	
func update_health():
	health_bar.value = Globals.health
	
func update_color(amount: int, label: Label, icon: TextureRect) -> void:
	if (amount <= 0):
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
