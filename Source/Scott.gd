extends Node2D

var destination:Vector2 = Vector2.ZERO
export var speed_x := 90.0
export var speed_y := 40.0
onready var animationPlayer = $AnimationPlayer
onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	destination = global_position

func _process(delta):
	if (destination - global_position).length() > 1:
		var direction = (destination - global_position).normalized()
		
		global_position += Vector2(direction.x * speed_x, direction.y * speed_y)  * delta
		sprite.flip_h = direction.x < 0
		animationPlayer.play("Walk")
		print(str(global_position.y))
	else:
		sprite.flip_h = false
		animationPlayer.play("Idle")

func move_to(pos: Vector2):
	destination = pos + Vector2(3, 15)
	print(str(global_position))
	print(str(destination))
