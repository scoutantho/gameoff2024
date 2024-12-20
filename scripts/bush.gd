extends Area2D

@export var numberOfWater = 0
@export var isAlreadyGrowing = false

func _on_body_entered(body:Node2D) -> void:
	print(" i am a bush on the collider is : ", body.name)
	if(body.is_in_group("water")):
		print("adding one water")
		numberOfWater += 1
		body.queue_free()
	pass # Replace with function body.

func _process(_delta: float) -> void:
	if (numberOfWater >= 100 && isAlreadyGrowing == false):
		print("I SHOULD GROW")
		var actualScale = self.scale
		$Audio/grow.play()
		# is it possible to create a function that takes like fex frames to get bigger in size and change the visibility of the sprite ?
		self.scale = Vector2(actualScale.x, actualScale.y * 2)
		#get child sprite 
		$growthSprite.visible = true
		$growthSprite.scale = Vector2(1, 0.5) # force size of the sprite because it's 32/16 
		$idleSprite.visible = false
		$growthSprite.animation = "growth"
		$growthSprite.play("growth")
		# $growthSprite.animation = "idle"
		# $growthSprite.play("idle")
	
		isAlreadyGrowing = true

	pass # Replace with function body.

func _ready() -> void:
	$Audio/spawn.play()
	$idleSprite.animation = "spawn"
	print("after spawn played ")
	# $idleSprite.play("idle")	
	pass # Replace with function body.	

func _on_remove_sound_finished() -> void:
	queue_free()

func remove_bush() -> void:
	var audio_player = $Audio/remove as AudioStreamPlayer
	if audio_player:
		audio_player.play()
	else:
		queue_free()

func _on_idle_sprite_animation_finished() -> void:
	if $idleSprite.animation == "spawn":
		print("animation finished")
		$idleSprite.animation = "idle"
		$idleSprite.play("idle")
		pass # Replace with function body.
	if $growthSprite.animation == "growth" and $growthSprite.visible == true:		
		$growthSprite.animation = "idle"
		$growthSprite.play("idle")
