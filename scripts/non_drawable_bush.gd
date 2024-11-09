extends Area2D

@export var powerUpWhoCantDraw : Globals.powerUp

func _on_area_entered(area:Area2D) -> void:
	print("hello area : ", area.name)
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


func _on_body_entered(body:Node2D) -> void:
	print("hello body : ", body.name)
	match powerUpWhoCantDraw:
		Globals.powerUp.bush:
			if body.is_in_group("bush"):
				body.queue_free()
		Globals.powerUp.lava:
			if body.is_in_group("lava"):
				body.queue_free()
		Globals.powerUp.water:
			if body.is_in_group("water"):
				body.queue_free()
	pass # Replace with function body.
