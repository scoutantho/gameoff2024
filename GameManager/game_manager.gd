extends Node2D

#todo replace with an enum and a colorPicker or something like that, saw it on a YT video
static var colors = ["","",""] 
var playerHasDied = false
var isCreatePlateformeEnabled : bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	#handle when one var is changed, trigger like the "ready" function of the one appropriate or whatever ?
	pass
