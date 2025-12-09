extends Node

@onready var theme:Theme = preload("res://components/main_theme.tres")
var main_screen:MainScreen
var config:Config
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_background() -> void:
		main_screen.background.color = Color.hex(config.config['theme']['background']['color'])

func set_theme() -> void:
	set_background()
	return
