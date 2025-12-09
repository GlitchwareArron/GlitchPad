extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_config()
	pass # Replace with function body.

func check_config() -> void:
	pass
	
func load_config() -> void:
	var _import = YAML.load_file("res://default_config/config.yaml")
	var _config = _import.get_data()
	pass

func reset_config() -> void:
	pass
	
