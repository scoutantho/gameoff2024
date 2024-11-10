extends Area2D

#we want card 1 to 3 for each colors and for the story ? 

@export var card_name: Globals.cardNames
var waterEnabled: bool = false
var lavaEnabled: bool = false
var historyEnabled: bool = false

func _on_body_entered(body:Node2D) -> void:
	print("i am card : ", Globals.cardNames.find_key(card_name))
	if body.is_in_group("Player"):
		#add the card to the player inventory
		body.cardHolds.append(card_name)
		#remove the card from the scene
		enablingWaterPowerUp(body)
		queue_free()
	pass # Replace with function body.

func enablingWaterPowerUp(player) -> void:
	 #check if player has the 3 cards of blue color
	 #if yes, enable the water power up
	 #if no, do nothing
	if !waterEnabled && player.cardHolds.has(Globals.cardNames.color_blue1) && player.cardHolds.has(Globals.cardNames.color_blue2) && player.cardHolds.has(Globals.cardNames.color_blue3):
		GameManager.powerUpAvailable.append(Globals.powerUp.water)
		waterEnabled = true
		# todo ? gie the player a color to add at the begining of the game?
		print("water power up enabled")
	elif !lavaEnabled && player.cardHolds.has(Globals.cardNames.color_red1) && player.cardHolds.has(Globals.cardNames.color_red2) && player.cardHolds.has(Globals.cardNames.color_red3):
		GameManager.powerUpAvailable.append(Globals.powerUp.lava)
		lavaEnabled = true
		# todo ? gie the player a color to add at the begining of the game?
		print("lava power up enabled")
	elif !historyEnabled && player.cardHolds.has(Globals.cardNames.story1) && player.cardHolds.has(Globals.cardNames.story2) && player.cardHolds.has(Globals.cardNames.story3):
		# todo handle the story thing -> how to get new powers ?
		historyEnabled = true
		print("history power up enabled")
