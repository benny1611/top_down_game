extends Node

func _ready():
	pass # Replace with function body.


func _on_Wolf_body_entered(body):
	body.canJump = true
	queue_free()
