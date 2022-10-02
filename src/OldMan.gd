extends Area2D
signal won

func _ready():
	pass # Replace with function body.


func _on_screen_entered():
	if get_node("AnimationPlayer"):
		get_node("AnimationPlayer").play("show_text")
		get_node("AnimationPlayer").connect("animation_finished", self, "del_anim_player")
	
func del_anim_player(value: String):
	get_node("AnimationPlayer").queue_free()
	emit_signal("won")
