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
		self.scale = Vector2(actualScale.x, actualScale.y * 2)
		isAlreadyGrowing = true

	pass # Replace with function body.
