extends Node

onready var fade = get_node("Fade/Player")
onready var credits = get_node("AnimationPlayer")

func _ready():
	fade.play("fade_in")
	fade.connect("animation_finished", self, "fade_finish")
	
func fade_finish(value: String):
	credits.play("default")
	credits.connect("animation_finished", self, "all_done")
	
func all_done(value: String):
	get_tree().change_scene("res://src/Main.tscn")

