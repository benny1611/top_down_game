extends RichTextLabel

var dialogue = ["You wake in a foreign world…",
"You stand up, confused, you continue, hurried foot.",
"You’ve meet the hag of hags,",
"Drunk her water, and forgot that which you’ve left behind…",
"Again you waketh, you searching soul,",
"In a forest, demented labyrinth to solve."]

var page = 0

var size = dialogue.size()

func _ready():
	set_bbcode(dialogue[page])
	set_visible_characters(0)
	set_process_input(true)
	
func _input(event):
	if event is InputEventKey and event.pressed:
		if get_visible_characters() > get_total_character_count():
			if page < dialogue.size() - 1:
				page += 1
				set_bbcode(dialogue[page])
				set_visible_characters(0)
		elif page == dialogue.size() -1:
			queue_free()
		else:
			set_visible_characters(get_total_character_count())


func _on_timeout():
	set_visible_characters(get_visible_characters() + 1)
