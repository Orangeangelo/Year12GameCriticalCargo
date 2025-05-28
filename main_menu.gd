extends Control


func _on_start_pressed():
	print("Start pressed") #get_tree().change_scene_to_file()


func _on_settings_pressed():
	print("Settings pressed")


func _on_exit_pressed():
	get_tree().quit()
