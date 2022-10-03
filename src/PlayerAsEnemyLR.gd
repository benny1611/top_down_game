extends Node

onready var follow = get_parent().get_node("PathFollow2D")
onready var anim = get_parent().get_node("PathFollow2D/Area2D/AnimatedSprite")
var is_going_right = true
var flip = false
var speed = 70

func _ready():
	set_process(true)
	
func _process(delta):
	if follow && follow.unit_offset == 1 && is_going_right:
		if flip:
			flip = false
			anim.flip_h = true
		is_going_right = false
	elif follow && follow.unit_offset == 0 && !is_going_right:
		anim.flip_h = false
		is_going_right = true
		flip = true
	if follow &&  is_going_right:
		follow.set_offset(follow.get_offset() + speed * delta)
	elif follow:
		follow.set_offset(follow.get_offset() - speed * delta)


func _on_body_entered(body):
	if body.has_method("die"):
		$EnemySound.play()
		body.die(null, "")
