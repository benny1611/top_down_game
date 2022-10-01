extends UIMenu

signal start_game
signal continue_game

func menu_action(action_str):
	match action_str:
		"Start":
			close_ui()
			$Menu/Layer.visible = false
			emit_signal("start_game")
		"Continue":
			close_ui()
			emit_signal("continue_game")
		"Quit":
			get_tree().quit()

func open_menu():
	var save_file = File.new()
	if not save_file.file_exists(Global.SAVE_FILE):
		$Menu/Layer/Menu/Start.text = "Find your way"
	else:
		$Menu/Layer/Menu/Start.text = "Restart"
	.open_menu()
