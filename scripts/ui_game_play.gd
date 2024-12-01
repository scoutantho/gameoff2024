extends Control

@onready var waterPowerRect = $GridContainer/waterPower
@onready var lavaPowerRect = $GridContainer/lavaPower
@onready var bushPowerRect = $GridContainer/bushPower

func _ready() -> void:
	GameManager.connect("powerIsChanging", updatePowerUp)
	GameManager.connect("powerIsAdded", addingPowerUp)
	lavaPowerRect.visible = false
	waterPowerRect.visible = false
	bushPowerRect.visible = false
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
	match powerUp:
		Globals.powerUp.water:
			waterPowerRect.visible = true
		Globals.powerUp.lava:
			lavaPowerRect.visible = true
		Globals.powerUp.bush:
			bushPowerRect.visible = true
		_:
			print("no power up selected")
	pass