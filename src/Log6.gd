extends Sprite                    

var leftEdge = Vector2(0,0)
var rightEdge = Vector2(0,50)
var direction = Vector2.RIGHT

var speed = 60                  
onready var imageWidth = texture.get_width() * 2   

func _ready():
	pass 



func _process(delta):

	position += transform.x * speed * delta

	if (position.y < 0 && position.y + imageWidth < leftEdge.y):               
		position.y = rightEdge.y + imageWidth
		
	elif (position.y > 0 && position.y - imageWidth > rightEdge.y):            
		position.y = leftEdge.y - imageWidth

func _on_body_entered(body):
	body.on_platform(speed)


func _on_body_exited(body):
	body.off_platform()
