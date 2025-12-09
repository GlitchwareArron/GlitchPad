extends Control

@onready var test_button:Button = $TestButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	test_button.pressed.connect(test_launch)
	pass # Replace with function body.

func launch(target:String,arguments:Array = []) -> void:
	OS.create_process(target,arguments,false)
	return
	
func close() -> void:
	return
	
func load_entry() -> void:
	return

func test_functions() -> void:
	
	return

func test_launch() -> void:
	launch("konsole")
	return
