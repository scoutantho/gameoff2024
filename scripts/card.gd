extends Area2D

#we want card 1 to 3 for each colors and for the story ? 

@export var card_name: Globals.cardNames

func _on_body_entered(body:Node2D) -> void:
	print("hello body from card", body.name)
	if body.is_in_group("Player"):
		#add the card to the player inventory
		body.cardHolds.append(card_name)
		#remove the card from the scene
		queue_free()
	pass # Replace with function body.
