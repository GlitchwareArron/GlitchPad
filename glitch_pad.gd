extends Node
class_name GlitchPad

@onready var config = $Config
@onready var main_screen = $MainScreen
@onready var theme = $Theme
@onready var launch_timer = $LaunchTimer
@onready var close_timer = $CloseTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	theme.config = config
	theme.main_screen = main_screen
	config.load_config()
	theme.set_theme()
	load_entries()
	close_timer.timeout.connect(close_glitchpad)
	pass # Replace with function body.

func load_entries() -> void:
	var _entries = config.config["entries"]
	var _keys = config.config["entries"].keys()
	for _i in _keys.size():
		main_screen.load_entry(_keys[_i],_entries[_keys[_i]]['target'])
	return
	
func start_launch(target:String,arguments:Array = []) -> void:
	print("Starting Launch: " + target)
	launch_timer.start()
	print("Waiting for " + str(launch_timer.wait_time) + " seconds")
	await launch_timer.timeout
	launch(target,arguments)
	pass

func launch(target:String,arguments:Array = []) -> void:
	print("Launching: " + target)
	var _pid = OS.create_process(target,arguments,false)
	print(_pid)
	if config.config["settings"]["main"]["close_after_launch"]:
		print("Close starting in " + str(close_timer.wait_time))
	close_timer.start()
	return

func close_glitchpad() -> void:
	if config.config["settings"]["main"]["debug"]:
		print("Debug enabled, deleting user config at " + config.user_config_path_absolute)
		config.delete_user_config()
	print("Closing now")
	# Case for pending changes
	get_tree().quit()
	return
