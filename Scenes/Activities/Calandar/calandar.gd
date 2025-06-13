extends Node2D

@onready var calendarPages : CPUParticles3D = $SubViewportContainer/SubViewport/CPUParticles3D
var is_dragging = false
var click_position = Vector2.ZERO

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		calendarPages.emitting = true
	if is_dragging:
		global_position = get_global_mouse_position() - click_position

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("Click"):
		is_dragging = true
		click_position = get_local_mouse_position()
		print("Shape clicked")

func _input(event):
	if event.is_action_released("Click"):
		is_dragging = false


# Ending function, changes scenes
func pass_days():
	if GameManager.getAge() == [0] || GameManager.getAge() == [1] || GameManager.getAge() == [2]:
		get_tree().change_scene_to_file("res://Scenes/Activities/HappyBirthday/Birthday_ToddlerToPreTeen.tscn")
	elif GameManager.getAge() == [3] || GameManager.getAge() == [4]:
		get_tree().change_scene_to_file("res://Scenes/Activities/HappyBirthday/Birthday_TeenAndAdult.tscn")
	else:
		print("Not able to pass days, age not found.")
