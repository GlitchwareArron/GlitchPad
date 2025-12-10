extends Control

@onready var background_selector = $MarginContainer/VBoxContainer/HBoxContainer/TabContainer/Background/ColorPanel
@onready var background_button = $MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/BackgroundButton
@onready var tabs = $MarginContainer/VBoxContainer/HBoxContainer/TabContainer
@onready var apply_button = $MarginContainer/VBoxContainer/HBoxContainer2/Apply
var config:Config

signal settings_confirmed(settings:Dictionary)
signal settings_updated()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	background_button.pressed.connect(select_background)
	apply_button.pressed.connect(apply_changed_settings)
	return

func apply_changed_settings() -> void:
	var _settings = {}
	if background_selector.change_pending:
		_settings['background_color'] = background_selector.selected_color
		print("New Settings!")
		print(_settings)
		settings_confirmed.emit(_settings)
		settings_updated.emit()
	pass
	
func clear_pending_changes() -> void:
	pass
	
func select_background() -> void:
	tabs.current_tab = 0
	return
