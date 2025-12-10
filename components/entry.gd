extends Button
class_name Entry

var target:String 
signal launch(target:String)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(trigger)
	pass # Replace with function body.

func trigger() -> void:
	release_focus()
	launch.emit(target)
	return
