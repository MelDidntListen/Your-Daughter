extends Node2D
class_name Gameplay

@onready var hand_cursor_normal = preload("res://Assets/2d_assets/cursors/cursor_normal.png")
@onready var hand_cursor_active = preload("res://Assets/2d_assets/cursors/cursor_active.png")
@onready var hand_cursor_off = preload("res://Assets/2d_assets/cursors/cursor_off.png")

static var current_activity:Activity
static var current_age = {
	0: "baby",
	1: "toddler",
	2: "child",
	3: "preteen",
	4: "teen",
	5: "adult"
}

func _ready() -> void:
	#await get_tree().physics_frame
	Input.set_custom_mouse_cursor(hand_cursor_normal)

func player_click():
	pass

func change_cursor_active():
	Input.set_custom_mouse_cursor(hand_cursor_active)

func change_cursor_back():
	Input.set_custom_mouse_cursor(hand_cursor_normal)

func change_cursor_off():
	Input.set_custom_mouse_cursor(hand_cursor_off)

func setAge(newAge):
	current_age = newAge
	print("Age changed to ", newAge)
	pass

func getAge():
	print("Getting age called")
	print("Current age is ", current_age, ". Is this redundant?")
	return current_age


func _on_area_2d_mouse_entered() -> void:
	pass # Replace with function body.
