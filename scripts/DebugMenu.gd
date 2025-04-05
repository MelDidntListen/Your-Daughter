extends Node

@onready var debug_menu = $Debug
@onready var debug_trigger = $DebugTrigger

func _ready():
	debug_menu.visible = false
	debug_trigger.visible = true


func _on_debug_trigger_pressed() -> void:
	print("Debug panel opened")
	debug_menu.visible = true
	debug_trigger.visible = false


func _on_close_debug_pressed() -> void:
	print("Debug panel closed")
	debug_menu.visible = false
	debug_trigger.visible = true
