extends Button
class_name Entry

var target:String 
signal launch(target:String)

func _ready() -> void:
	pressed.connect(trigger)
	return

func trigger() -> void:
	release_focus()
	launch.emit(target)
	return
