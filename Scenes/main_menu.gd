extends Control

@onready var main_buttons: VBoxContainer = $"Main buttons"
@onready var settings: Panel = $settings


func _ready():
	main_buttons.visible = true
	settings.visible = false


func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Level.tscn")


func _on_settings_pressed():
	print("Settings pressed")
	main_buttons.visible = false
	settings.visible = true


func _on_exit_pressed():
	get_tree().quit()


func _on_back_settings_pressed() -> void:
	_ready()
