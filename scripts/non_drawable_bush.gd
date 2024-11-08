extends Area2D

func _on_area_entered(area:Area2D) -> void:
	print("hello there : ", area.name)
	if(area.is_in_group("bush")):
		area.queue_free()
	pass # Replace with function body.
