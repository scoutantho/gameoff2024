extends Area2D

@export var powerUpWhoCantDraw : Globals.powerUp

func _on_area_entered(area:Area2D) -> void:
	match powerUpWhoCantDraw:
		Globals.powerUp.bush:
			if area.is_in_group("bush"):
				area.call("remove_bush")
		Globals.powerUp.lava:
			if area.is_in_group("lava"):
				area.queue_free()
		Globals.powerUp.water:
			if area.is_in_group("water"):
				area.queue_free()
	pass # Replace with function body.


func _on_body_entered(body:Node2D) -> void:
	match powerUpWhoCantDraw:
		Globals.powerUp.bush:
			if body.is_in_group("bush"):
				body.call("remove_bush")
		Globals.powerUp.lava:
			if body.is_in_group("lava"):
				body.queue_free()
		Globals.powerUp.water:
			if body.is_in_group("water"):
				body.queue_free()
	pass # Replace with function body.

func _ready() -> void:
	print("powerUpWhoCantDraw:", powerUpWhoCantDraw)
	var packedColorArray: PackedColorArray
	match powerUpWhoCantDraw:
		Globals.powerUp.bush:
			packedColorArray = Refs.gradient_yellow
		Globals.powerUp.lava:
			packedColorArray = Refs.gradient_red
		Globals.powerUp.water:
			packedColorArray = Refs.gradient_blue
	addSpriteWithRadialGradient(packedColorArray)
	print("lol")
			
	# texture.gradient.set_color(1, colorTo)
	# texture.gradient = texture.gradient.interpolate_colors(colorFrom, colorTo)

func addSpriteWithRadialGradient(packedColor: PackedColorArray) -> void:
	var texture = GradientTexture2D.new()
	texture.gradient = Gradient.new()
	texture.fill = texture.FILL_RADIAL
	texture.fill_from = Vector2(0.5, 0.5)
	texture.fill_to = Vector2(0.83, 0)
	var sprite = Sprite2D.new()
	sprite.texture = texture
	sprite.texture.gradient.set_color(0, packedColor[0])
	sprite.texture.gradient.set_color(1, packedColor[1])
	sprite.texture = sprite.texture
	self.add_child(sprite)