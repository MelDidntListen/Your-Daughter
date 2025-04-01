extends Panel

@onready var color_rect = $ColorRect
@onready var color_rect2 = $ColorRect2
@onready var animation_player = $ColorRect/AnimationPlayer
@onready var animation_player2 = $ColorRect2/AnimationPlayer2

func _ready():
	color_rect.visible = true
	animation_player.play("oneSitting_fadeIn")
	color_rect2.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	animation_player2.animation_finished.connect(_on_animation_finished)
	# $Timer.start()
	
func _on_animation_finished(anim_name):
	if anim_name == "oneSitting_fadeIn":
		animation_player2.play("guilt_fadeIn")
		color_rect2.visible = true
	elif anim_name == "guilt_fadeIn":
		color_rect.visible = false
		color_rect2.visible = false
		get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn")
