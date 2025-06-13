extends Control
@onready var SceneManager: Label = $Managers/SceneManager


func _on_start_pressed() -> void:
	print("Start pressed")
	get_tree().change_scene_to_file("res://Scenes/TheGame.tscn")


func _on_optionsMenu_pressed() -> void:
	print("Options pressed")


func _on_exitGame_pressed() -> void:
	print("Exit Game pressed")
	get_tree().quit()




func _on_button_button_up() -> void:
	SceneManager.swap_scenes("res://Gameplay/gameplay.tscn",get_tree().root,self,"wipe_to_right")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		SceneManager.swap_scenes("res://Gameplay/gameplay.tscn",get_tree().root,self,"wipe_to_right")
