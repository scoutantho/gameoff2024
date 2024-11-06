extends Node2D

#todo replace with an enum and a colorPicker or something like that, saw it on a YT video
static var colors = ["","",""] 
var playerHasDied = false
var isDisplayOverlayEnable: bool = true

signal isCreatePlateformeEnabling
var isCreatePlateformeEnable : bool : 
	set(value): 
		if value:
			isCreatePlateformeEnabling.emit() #emit signal, pulled back in the DrawableLine script in order to activate or deactivate it (in the futur probably we will think about adding in the tree or removing it from the tree
		isCreatePlateformeEnable = value
	set(value): 
		if value:
			isCreatePlateformeEnabling.emit() #emit signal, pulled back in the DrawableLine script in order to activate or deactivate it (in the futur probably we will think about adding in the tree or removing it from the tree
		isCreateSquareEnable = value


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	isCreatePlateformeEnable = false
	isCreateSquareEnable = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func print_name_and_value_of_variable(string):
	var script_var_array = get_script().get_script_property_list()
	for i in script_var_array:
		if i["name"] == string:
			print(i["name"] + " is " + str(get(string)))
			break



	
