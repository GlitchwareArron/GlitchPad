extends Control

@onready var entry_template:PackedScene = preload("res://entry.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func launch(target:String,arguments:Array = []) -> void:
	var _pid = OS.create_process(target,arguments,false)
	print(_pid)
	return
	
func close() -> void:
	return
	
func load_entry(target_name:String,target_path:String) -> void:
	var _entry:Entry = entry_template.instantiate()
	_entry.text = target_name
	_entry.target = target_path
	_entry.launch.connect(launch)
	add_child(_entry)
	return
