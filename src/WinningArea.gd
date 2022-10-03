extends Area2D

func _ready():
	pass # Replace with function body.


func _on_WinningArea_body_entered(body):
	body.won()
