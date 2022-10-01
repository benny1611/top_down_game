extends AnimatedSprite                    ## Log 3  

var topEdge = Vector2(0,0)
var bottomEdge = Vector2(0,170) 
var direction = Vector2.LEFT

var speed = 20                   
onready var imageWidth = 34 * 2

func _process(delta):

	position += transform.x * speed * delta
	
	if (position.y < 0 && position.y + imageWidth < topEdge.y):              
		position.y = bottomEdge.y + imageWidth
		position.rotated(90.0)
		
	elif (position.y > 0 && position.y - imageWidth > bottomEdge.y):            
		position.y = topEdge.y - imageWidth
		position.rotated(90.0)



func _on_body_entered(body):
	body.on_platform(speed)


func _on_body_exited(body):
	body.off_platform()
