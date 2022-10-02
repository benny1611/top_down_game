extends Node2D

onready var cutscene = get_node("Cutscene/CutscenePlayer")
onready var dialogueBox = get_node("Polygon2D/RichTextLabel")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Player").visible = false
	get_node("Player/AnimatedSprite").visible = false
	get_node("Player/Fog").visible = false
	cutscene.play("move_to_right")
	cutscene.connect("animation_finished", self, "ready_for_level")
	get_node("Player").movement = false

func ready_for_level(value: String):
	get_node("Player/AnimatedSprite").visible = true
	get_node("Player/Fog").visible = true
	get_node("Player").visible = true
	get_node("Player/Camera2D").current = true
	get_node("Player").movement = true
	cutscene.queue_free()
	
