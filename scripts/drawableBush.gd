extends Node2D

@export var _scale : float = 1
var bushInstance
var waterInstance
var lavaInstance
@export var isDrawableSpace : bool = true
@export var max_scaleUp : float = 5
@export var max_scaleDown : float = 0.1


func _input(event: InputEvent) -> void:
	if GameManager.actualPowerUp == Globals.powerUp.bush:
		if bushInstance == null:
			if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
				var mousePosition := get_global_mouse_position()
				var scene = preload("res://scenes/bush.tscn")
				bushInstance = scene.instantiate()
				bushInstance.scale = Vector2(_scale, _scale)
				print(mousePosition)
				bushInstance.collision_mask	= 0
				bushInstance.position = mousePosition #if we want to have a rigid body, we might want to activate and deactivate floatability ? 
				add_child(bushInstance)
				return
		if(bushInstance != null):
			if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_RIGHT:
				bushInstance.call("remove_bush")
				#				 var audio_player = bushInstance.get_node("Audio/remove") as AudioStreamPlayer
				# if audio_player:
				# 	audio_player.play()
				# 	audio_player.connect("_on_remove_sound_finished", _on_remove_sound_finished)
				# else:
				# 	bushInstance.queue_free()
				# 	bushInstance = null				
			if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
				_scale -= 0.1
				_scale = max(max_scaleDown, _scale)
				bushInstance.scale = Vector2(_scale, _scale)
			if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_WHEEL_UP:
				_scale += 0.1
				_scale = min(max_scaleUp, _scale)
				bushInstance.scale = Vector2(_scale, _scale)
			if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
				if isDrawableSpace:
					var mousePosition := get_global_mouse_position()
					bushInstance.position = mousePosition
					bushInstance.set_collision_mask(pow(2,1-1) + pow(2,5-1)) #player + #water -> https://docs.godotengine.org/en/latest/tutorials/physics/physics_introduction.html#code-example
					bushInstance = null
				else :
					print("not drawable space")
					#play not possible sound and animation
	if GameManager.actualPowerUp == Globals.powerUp.lava:
		if bushInstance != null:
			bushInstance = null
	# if GameManager.actualPowerUp == Globals.powerUp.water: -> handle in process because i want a while on the input mouse button
	# 	if bushInstance != null:
	# 		bushInstance = null
	# 	if waterInstance == null:
	# 		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
	# 			print("i want to draw some water")
	# 			var mousePosition := get_global_mouse_position()
	# 			var scene = preload("res://scenes/water.tscn")
	# 			waterInstance = scene.instantiate()
	# 			print(mousePosition)
	# 			waterInstance.position = mousePosition
	# 			add_child(waterInstance)
	# 			waterInstance = null
	# 			return
			

func _process(_delta):
	if bushInstance != null :
		var mousePosition := get_global_mouse_position()
		bushInstance.position = mousePosition
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && GameManager.actualPowerUp == Globals.powerUp.water:
		# print("i want to draw some water")
		var mousePosition := get_global_mouse_position()
		var scene = preload("res://scenes/water.tscn")
		waterInstance = scene.instantiate()
		# print(mousePosition)
		waterInstance.position = mousePosition
		add_child(waterInstance)
		waterInstance = null
		return
	pass
