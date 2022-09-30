class_name Player
extends KinematicBody2D

signal player_killed
signal won
export (int) var speed = 100

var velocity := Vector2.ZERO
var treasures := 0
var extents : Vector2
var dead := false
var isLookingRight = true

onready var animated_sprite = get_node("AnimatedSprite")

func _ready():
	Global.player = self
	animated_sprite.play("idle")

func get_extents():
	return $CollisionShape2D.shape.extents

func get_input():
	velocity = Vector2()
	if Input.is_action_just_pressed("ui_right"):
		if not isLookingRight:
			isLookingRight = true
			animated_sprite.flip_h = false
		animated_sprite.play("begin_running")
		velocity.x += 1
	elif Input.is_action_pressed("ui_right"):
		animated_sprite.play("actually_running")
		velocity.x += 1
	elif Input.is_action_just_released("ui_right"):
		animated_sprite.play("idle")
	if Input.is_action_just_pressed("ui_left"):
		if isLookingRight:
			isLookingRight = false
			animated_sprite.flip_h = true
		animated_sprite.play("begin_running")
		velocity.x -= 1
	elif Input.is_action_pressed("ui_left"):
		animated_sprite.play("actually_running")
		velocity.x -= 1
	elif Input.is_action_just_released("ui_left"):
		animated_sprite.play("idle")
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	velocity = velocity.normalized() * speed


func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)


func die(obj, signal_str):
	if not dead:
		dead = true
		set_physics_process(false)
		print("player killed")
		if obj != null:
			yield(obj, signal_str)
		emit_signal("player_killed")


# must be called during idle period
func disable():
	visible = false
	$CollisionShape2D.disabled = true


func enable():
	dead = false
	visible = true
	set_physics_process(true)
	$CollisionShape2D.disabled = false


func count_treasures():
	treasures = 0
	for level in Global.treasures:
		treasures += Global.treasures[level].size()
	Global.emit_signal("update_treasure")


func add_treasure():
	treasures += 1
	Global.emit_signal("update_treasure")
	if treasures >= Global.ALL_TREASURES:
		emit_signal("won")


func update_camera_limits(rect : Rect2):
	$Camera2D.limit_top = rect.position.y
	$Camera2D.limit_left = rect.position.x
	$Camera2D.limit_bottom = rect.end.y
	$Camera2D.limit_right = rect.end.x
