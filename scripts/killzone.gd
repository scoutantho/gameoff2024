extends Area2D



func _on_body_entered(_body:Node2D) -> void:
	if Globals.player_hasDied:
		return
	Globals.player_hasDied = true
	print("you die!")
	_body.set_physics_process(false)
	_body.set_collision_layer(0)
	_body.set_collision_mask(0)
	$Timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
	Globals.player_hasDied = false
	GameManager.resetWhenDied()
