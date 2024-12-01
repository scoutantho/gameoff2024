extends Area2D



func _on_body_entered(_body:Node2D) -> void:
	print("body entered")
	if _body.is_in_group("Player"):
		var player = _body
		print("you win!")
		player.set_physics_process(false)
		player.set_collision_layer(0)
		player.set_collision_mask(0)
		GameManager._gameIsFinished(player)
		#
	pass # Replace with function body.
