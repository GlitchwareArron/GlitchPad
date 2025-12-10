extends PanelContainer

@onready var picker = $VBoxContainer/ColorPicker
@onready var accept_button = $VBoxContainer/HBoxContainer/Accept
@onready var cancel_button = $VBoxContainer/HBoxContainer/Cancel
var original_color:Color
var pending_color:Color
var selected_color:int
var change_pending:bool = false

signal color_confirmed(color:Color)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	picker.color_changed.connect(set_color)
	accept_button.pressed.connect(accept)
	cancel_button.pressed.connect(cancel)
	pass # Replace with function body.

func set_color(new_color:Color) -> void:
	pending_color = new_color
	return
	
func accept() -> void:
	selected_color = pending_color.to_rgba32()
	print(selected_color)
	color_confirmed.emit(selected_color)
	change_pending = true
	return

func cancel() -> void:
	picker.color = original_color
	selected_color = original_color.to_rgba32()
	change_pending = false
	return
