extends Node

var cursor = load("res://Sprites/cursor.png")
var mouse_entered = false
onready var scott = $ExteriorLevel/YSort/Scott
onready var camera = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(cursor)

func _process(delta):
	camera.global_position.x = scott.global_position.x
	if scott.global_position.y > 200:
		scott.scale = Vector2.ONE * 0.8
	elif scott.global_position.y < 150:
		scott.scale = Vector2.ONE * 0.4
	else:
		scott.scale = Vector2.ONE * (0.8 - (200-scott.global_position.y) * 0.4 / 50)

func _on_Area2D_mouse_entered():
	mouse_entered = true

func _on_Area2D_mouse_exited():
	mouse_entered = false

func _on_Area2D_input_event(viewport, event, shape_idx):
	if mouse_entered and event is InputEventMouseButton and event.button_index == 1 and event.is_pressed():
		scott.move_to(camera.global_position - Vector2(160,120) + get_viewport().get_mouse_position())
