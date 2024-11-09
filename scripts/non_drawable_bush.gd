extends Area2D

@export var powerUpWhoCantDraw : Globals.powerUp

func _on_area_entered(area:Area2D) -> void:
	print("hello there : ", area.name)
	match powerUpWhoCantDraw:
		Globals.powerUp.bush:
			if area.is_in_group("bush"):
				area.queue_free()
		Globals.powerUp.lava:
			if area.is_in_group("lava"):
				area.queue_free()
		Globals.powerUp.water:
			if area.is_in_group("water"):
				area.queue_free()
	pass # Replace with function body.
