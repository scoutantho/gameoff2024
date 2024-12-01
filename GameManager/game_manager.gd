extends Node2D

#todo replace with an enum and a colorPicker or something like that, saw it on a YT video
var isDisplayOverlayEnable: bool = true
var actualPowerUp : Globals.powerUp = -1
@export var powerUpAvailable : Array = []

signal powerIsChanging
signal powerIsAdded
signal gameIsFinished

var cheatEnable = false
signal noClipEnabling
var no_clip_enable = false
var isAllcolorEnableCheatCode: bool : 
	set(value): 
		if value:
			cheatEnable = true
			AddPowerUp(Globals.powerUp.bush)
			AddPowerUp(Globals.powerUp.water)
			AddPowerUp(Globals.powerUp.lava)
		else:
			cheatEnable = false
			# AddPowerUp(Globals.powerUp.bush)
		isAllcolorEnableCheatCode = value

signal isCheatPlateformEnabling
var isCheatPlateformEnable : bool : 
	set(value): 
		if value:
			isCheatPlateformEnabling.emit() #emit signal, pulled back in the DrawableLine script in order to activate or deactivate it (in the futur probably we will think about adding in the tree or removing it from the tree
		isCheatPlateformEnable = value


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isCheatPlateformEnable = false
	Console.add_command("EnableAll", console_no_clip)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#todo having a canvas telling you wich power up you have actually selected
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("change_power"):
		#if acutalPowerUp +1 is in the powerUpAvailable array, we can change the power up to the next one
		#otherwise we change to the first one
		#todo add a sound when changing power up
		#todo add a canvas telling you wich power up you have actually selected
		if(powerUpAvailable.size() == 0):
			return
		var indexPowerUpactual = powerUpAvailable.find(actualPowerUp)
		if powerUpAvailable.size() >= indexPowerUpactual + 1 + 1: #+1 because we want to check if the next one is in the array (and size is +1 than index, size start at 1 and index at 0)
			actualPowerUp = powerUpAvailable[indexPowerUpactual + 1]
		else:
			actualPowerUp = powerUpAvailable[0]
		print("actual power up is : ", Globals.powerUp.find_key(actualPowerUp))
		powerIsChanging.emit()


func print_name_and_value_of_variable(string):
	var script_var_array = get_script().get_script_property_list()
	for i in script_var_array:
		if i["name"] == string:
			print(i["name"] + " is " + str(get(string)))
			break

func console_no_clip(): #convert to signal ? 
	# no_clip_enable = !no_clip_enable
	# noClipEnabling.emit()
	# print("no clip is now : ", no_clip_enable)
	isAllcolorEnableCheatCode = !isAllcolorEnableCheatCode
	cheatEnable = true
	pass

func resetWhenDied() -> void:
	actualPowerUp = -1
	powerUpAvailable = []

func AddPowerUp(powerUp: Globals.powerUp) -> void:
	if powerUpAvailable.find(powerUp) == -1:
		powerUpAvailable.append(powerUp)
		print("power up added : ", Globals.powerUp.find_key(powerUp))
		powerIsAdded.emit(powerUp)
	if powerUpAvailable.size() == 1:
		actualPowerUp = powerUp
		powerIsChanging.emit()
	pass

func _gameIsFinished(player) -> void:
	gameIsFinished.emit(player)
	pass
	
