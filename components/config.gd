extends Node
class_name Config

var config:Dictionary
var default_config_path:String = "res://config.yaml"
var user_config_path: String = "user://config.yaml"
var user_config_path_absolute: String = ProjectSettings.globalize_path(user_config_path)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func load_config() -> void:
	if !(FileAccess.file_exists(user_config_path)):
		reset_config()
	var _import = YAML.load_file(user_config_path)
	config = _import.get_data()
	print(config)
	return

func reset_config() -> void:
	DirAccess.copy_absolute(default_config_path,user_config_path)
	pass
	
func delete_user_config() -> void:
	OS.move_to_trash(user_config_path_absolute)
	return
	
func update_settings(new_settings:Dictionary) -> void:
	if new_settings.has("background_color"):
		config["theme"]["background"]["color"] = new_settings["background_color"]
	print(config)
	apply_settings()
	return

func apply_settings() -> void:
	return
