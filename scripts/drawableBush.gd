extends Node2D

@export var _scale : float = 1
var bushInstance
@export var isDrawableSpace : bool = true
@export var max_scaleUp : float = 5
@export var max_scaleDown : float = 0.1


func _input(event: InputEvent) -> void:
	if bushInstance == null:
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			print("i want to draw something")
			var mousePosition := get_global_mouse_position()
			var scene = preload("res://scenes/bush.tscn")
			bushInstance = scene.instantiate()
			bushInstance.scale = Vector2(_scale, _scale)
			print(mousePosition)
			bushInstance.position = mousePosition
			add_child(bushInstance)
			return
	if(bushInstance != null):
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_RIGHT:
			bushInstance = null
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			_scale -= 0.1
			_scale = max(max_scaleDown, _scale)
			print(_scale)
			bushInstance.scale = Vector2(_scale, _scale)
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_WHEEL_UP:
			_scale += 0.1
			_scale = min(max_scaleUp, _scale)
			print(_scale)
			bushInstance.scale = Vector2(_scale, _scale)
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
			if isDrawableSpace:
				var mousePosition := get_global_mouse_position()
				bushInstance.position = mousePosition
				bushInstance = null
			else :
				print("not drawable space")
				#play not possible sound and animation
		

func _process(_delta):
	if bushInstance != null :
		var mousePosition := get_global_mouse_position()
		bushInstance.position = mousePosition
	pass

		
