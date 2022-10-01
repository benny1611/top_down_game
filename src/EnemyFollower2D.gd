extends PathFollow2D
export var run_speed = 20
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_offset(get_offset() + run_speed * delta)
