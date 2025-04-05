extends Node
class_name Gameplay

## Sample game manager scene. In v1.0 of SceneManager, it kept track of the current scene for you, 
## because it was always simply replacing everything every time. In v1.1, we've decoupled the game
## logic from SceneManager so it's now on you to keep track of scenes you're loading, which in this
## example we're doing with [code]current_level[/code]. Also exemplified here are how this manager class
## listens for _on_level_loaded, _on_level_added, and _on_load_start to control the SceneTree to 
## achieve desired ordering (rather than passing all this into the SceneManager which would make those
## load calls long, bulky, and still restrited to whatever features I chose to include.  

@onready var activity_holder: Node2D = $ActivityHolder
@onready var hud: Control = $HUD
@onready var SceneManager: Label = $Managers/SceneManager


var current_activity:Activity

func _ready() -> void:
	
	SceneManager.load_complete.connect(_on_activity_loaded)
	SceneManager.load_start.connect(_on_load_start)
	SceneManager.scene_added.connect(_on_activity_added)
	current_activity = activity_holder.get_child(0) as Activity

func _on_activity_loaded(activity) -> void:
	if activity is Activity:
		current_activity = activity

# shows how we can use this signal to make sure the loading screen stays on top
func _on_activity_added(_activity,_loading_screen) -> void:
	pass
	# keep loading screen on top
	if _loading_screen != null:
		var loading_parent: Node = _loading_screen.get_parent() as Node
		loading_parent.move_child(_loading_screen, loading_parent.get_child_count()-1)
	# HUD example
	move_child(hud, get_child_count()-1) # uncomment to keep the HUD above the loading screen (like how it stays put in OG Zelda dungeons)

# shows how we can play with the HUD ordering to customize results, regardless of where SceneManager puts the loading screen
func _on_load_start(_loading_screen):
	pass
	# keep HUD on top of loading screen - uncomment below to keep HUD up top (see above)
#	_loading_screen.reparent(self)
#	move_child(_loading_screen,hud.get_index())

func player_click():
	pass
