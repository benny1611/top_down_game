extends "res://src/Entity.gd"

func player_entered(body):
	#print(body.is_on_platform())
	if body.has_method("die") and not body.is_on_platform() and not body.is_jumping():
		$TrapSound.play()
		body.die(null, "")
