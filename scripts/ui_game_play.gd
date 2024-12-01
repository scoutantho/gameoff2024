extends Control

@onready var waterPowerRect = $GridContainer/waterPower
@onready var lavaPowerRect = $GridContainer/lavaPower
@onready var bushPowerRect = $GridContainer/bushPower
@onready var finishView = $finishView
@onready var replayButton = $finishView/replayButton
@onready var finishLabel = $finishView/finishLabel
@onready var labelPowerUp = $powerMessage

func _ready() -> void:
	GameManager.connect("powerIsChanging", updatePowerUp)
	GameManager.connect("powerIsAdded", addingPowerUp)
	GameManager.connect("gameIsFinished", _gameIsFinished)
	lavaPowerRect.visible = false
	waterPowerRect.visible = false
	bushPowerRect.visible = false
	finishView.visible = false
	labelPowerUp.visible = false
	lavaPowerRect.modulate = Color(1,1,1,0.5)
	waterPowerRect.modulate = Color(1,1,1,0.5)
	# updatePowerUp()
	pass
func updatePowerUp() -> void:
	print("changing power emmited, new power is : ", Globals.powerUp.find_key(GameManager.actualPowerUp))
	highLightNewPowerUp()
	pass

func highLightNewPowerUp() -> void:
	match GameManager.actualPowerUp:
		Globals.powerUp.water:
			waterPowerRect.modulate = Color(1,1,1,1)
			lavaPowerRect.modulate = Color(1,1,1,0.5)
			bushPowerRect.modulate = Color(1,1,1,0.5)
		Globals.powerUp.lava:
			waterPowerRect.modulate = Color(1,1,1,0.5)
			lavaPowerRect.modulate = Color(1,1,1,1)
			bushPowerRect.modulate = Color(1,1,1,0.5)
		Globals.powerUp.bush:
			waterPowerRect.modulate = Color(1,1,1,0.5)
			lavaPowerRect.modulate = Color(1,1,1,0.5)
			bushPowerRect.modulate = Color(1,1,1,1)
		_:
			print("no power up selected")
	pass

func addingPowerUp(powerUp: Globals.powerUp) -> void:
	print("power up added : ", Globals.powerUp.find_key(powerUp))
	# start a timer show the text for 3 seconds
	labelPowerUp.text = "You have a new power : " + Globals.powerUp.find_key(powerUp)
	labelPowerUp.visible = true

	match powerUp:
		Globals.powerUp.water:
			waterPowerRect.visible = true
			labelPowerUp.text += "\n try to water theses bushes"
		Globals.powerUp.lava:
			lavaPowerRect.visible = true
		Globals.powerUp.bush:
			bushPowerRect.visible = true
		_:
			print("no power up selected")
	$Timer.start()
	pass

func _on_timer_timeout() -> void:
	labelPowerUp.visible = false


func _on_replay_button_pressed() -> void:
	get_tree().reload_current_scene()
	GameManager.resetWhenDied()
	pass # Replace with function body.

func _gameIsFinished(player) -> void:
	print("game is finished" + str(player.cardHolds.count(Globals.cardNames.story3)))
	finishView.visible = true
	finishLabel.text = "You finished the game with " + str(player.cardHolds.count(Globals.cardNames.story3)) + " / 4 story cards"
	pass
