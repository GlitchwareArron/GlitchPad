extends Node
class_name GlitchPad

@onready var config = $Config
@onready var main_screen = $MainScreen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	config.load_config()
	load_entries()
	pass # Replace with function body.

func load_entries() -> void:
	var _entries = config.config["entries"]
	var _keys = config.config["entries"].keys()
	for _i in _keys.size():
		main_screen.load_entry(_keys[_i],_entries[_keys[_i]]['target'])
	return
