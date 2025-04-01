extends Control


func _on_start_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://Scenes/pressedStart.tscn")


func _on_optionsMenu_pressed() -> void:
	print("Options pressed")


func _on_exitGame_pressed() -> void:
	print("Exit Game pressed")
	get_tree().quit()
