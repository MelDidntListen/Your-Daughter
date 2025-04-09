extends Node3D

func _ready():
	pass

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		$SubViewportContainer/SubViewport/CPUParticles3D.emitting = true

func pass_days():
	if GameManager.getAge() == [0] || GameManager.getAge() == [1] || GameManager.getAge() == [2]:
		SceneManager.swap_scenes("res://Scenes/Activities/HappyBirthday/Birthday_ToddlerToPreTeen.tscn")
	elif GameManager.getAge() == [3] || GameManager.getAge() == [4]:
		SceneManager.swap_scenes("res://Scenes/Activities/HappyBirthday/Birthday_TeenAndAdult.tscn")
	else:
		print("Not able to pass days, age not found.")
