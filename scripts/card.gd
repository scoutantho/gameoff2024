extends Area2D

#we want card 1 to 3 for each colors and for the story ? 

@export var card_name: Globals.cardNames

@onready var sprite: AnimatedSprite2D = $cardSprite

func _ready() -> void:
	match card_name:
		Globals.cardNames.color_blue1, Globals.cardNames.color_blue2, Globals.cardNames.color_blue3:
			sprite.animation = "colorBlue"
		Globals.cardNames.color_red1, Globals.cardNames.color_red2, Globals.cardNames.color_red3:
			sprite.animation = "colorRed"
		Globals.cardNames.story1, Globals.cardNames.story2, Globals.cardNames.story3:
			sprite.animation = "colorStory"

func _on_body_entered(body:Node2D) -> void:
	if body.is_in_group("Player"):
		print("i am card added : ", Globals.cardNames.find_key(card_name))
		pickupCard(body)
	pass # Replace with function body.

func pickupCard(player) -> void:
	$audio.play()
	#add the card to the player inventory
	player.cardHolds.append(card_name)
	#remove the card from the scene
	changingPowerUp(player)
	hide()

func changingPowerUp(player) -> void:
	 #check if player has the 3 cards of blue color
	 #if yes, enable the water power up
	 #if no, do nothing
	if GameManager.powerUpAvailable.find(Globals.powerUp.water) == -1 && player.cardHolds.has(Globals.cardNames.color_blue1) && player.cardHolds.has(Globals.cardNames.color_blue2) && player.cardHolds.has(Globals.cardNames.color_blue3):
		GameManager.AddPowerUp(Globals.powerUp.water)
		# todo ? gie the player a color to add at the begining of the game?
		print("water power up enabled")
	elif GameManager.powerUpAvailable.find(Globals.powerUp.bush) == -1 && player.cardHolds.has(Globals.cardNames.color_red1) && player.cardHolds.has(Globals.cardNames.color_red2) && player.cardHolds.has(Globals.cardNames.color_red3):
		GameManager.AddPowerUp(Globals.powerUp.bush)
		# todo ? gie the player a color to add at the begining of the game?
		print("bush power up enabled")
	elif player.cardHolds.has(Globals.cardNames.story1) && player.cardHolds.has(Globals.cardNames.story2) && player.cardHolds.has(Globals.cardNames.story3):
		# todo handle the story thing -> how to get new powers ?
		# historyEnabled = true
		print("history power up enabled")


func _on_audio_finished() -> void:
	queue_free()
	pass # Replace with function body.
