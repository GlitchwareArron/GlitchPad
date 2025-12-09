extends Node
class_name Config

var config:Dictionary

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func load_config() -> void:
	if !(FileAccess.file_exists("user://config.yaml")):
		reset_config()
	var _import = YAML.load_file("user://config.yaml")
	config = _import.get_data()
	print(config)
	return

func reset_config() -> void:
	DirAccess.copy_absolute("res://config.yaml","user://config.yaml")
	pass
	
