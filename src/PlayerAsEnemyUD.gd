extends Node

onready var follow = get_parent().get_node("PathFollow2D")
onready var anim = get_parent().get_node("PathFollow2D/Area2D/AnimatedSprite")
var is_going_up = true
var flip = false
var speed = 70

func _ready():
	anim.play("up")
	set_process(true)
	
func _process(delta):
	if follow.unit_offset == 1 && is_going_up:
		is_going_up = false
		anim.play("down")
	elif follow.unit_offset == 0 && !is_going_up:
		is_going_up = true
		anim.play("up")
	if is_going_up:
		follow.set_offset(follow.get_offset() + speed * delta)
	else:
		follow.set_offset(follow.get_offset() - speed * delta)

func _on_body_entered(body):
	if body.has_method("die"):
		$EnemySound.play()
		body.die(null, "")
