extends Node

func _ready():
	get_node("AnimationPlayer/CanvasLayer/Sprite").visible = false



func _on_Wolf_body_entered(body):
	queue_free()


func _on_screen_entered():
	if get_node("AnimationPlayer"):
		get_node("AnimationPlayer").play("show_text")
		get_node("AnimationPlayer").connect("animation_finished", self, "del_anim_player")
	
func del_anim_player(value: String):
	get_node("AnimationPlayer").queue_free()
	
