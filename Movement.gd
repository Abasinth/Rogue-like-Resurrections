extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 150
export var friction = 0.85
export var acceleration = 25
var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement()

func movement():
	var input = Vector2()
	input.x = Input.get_axis("ui_left", "ui_right")
	input.y = Input.get_axis("ui_up", "ui_down")
	velocity += input * acceleration
	velocity *= friction
	velocity = velocity.clamped(speed)
	#print(input.x)
	velocity = move_and_slide(velocity)
