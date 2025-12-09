extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(check_config())
	pass # Replace with function body.

func check_config() -> String:
	if !(FileAccess.file_exists("user://config.yaml")):
		var _file = DirAccess.copy_absolute("res://default_config/config.yaml","user://config.yaml")
		return "Default config set"
	return "Config Exists"
	
func load_config() -> void:
	var _import = YAML.load_file("res://default_config/config.yaml")
	var _config = _import.get_data()
	pass

func reset_config() -> void:
	pass
	
