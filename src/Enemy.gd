class_name Enemy

extends "res://src/Entity.gd"

func _ready():
	if Global.has_enemy(name):
		queue_free()

func player_entered(_body):
	if _body.has_method("die"):
		$EnemySound.play()
		_body.die(null, "")
	#Global.add_enemy(name)
	#$EnemySound.play()
	#visible = false
	#set_deferred("monitoring", false)
	#yield($EnemySound, "finished")
	#queue_free()
