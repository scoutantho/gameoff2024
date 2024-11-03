extends Node2D

@export var isDrawableSpace : bool = true
@export var isDrawingLocked : bool = false


func displayOverlayDebugging():
	var scene = preload("res://scenes/debug_overlay.tscn")
	var overlay = scene.instantiate()
	overlay.add_stat("Line2d Count ", $Line2D, "get_point_count", true)		
	overlay.add_stat("", "", "", false)
	overlay.add_stat("Self Global Position ", self, "global_position", false)
	overlay.add_stat("Mouse Global Position ", self, "get_global_mouse_position", true)
	add_child(overlay)
	
func _ready():
	# setting color to the actual state of the powerup we are using, take color from refs file 
	$Line2D.default_color = Refs.color_blue
	displayOverlayDebugging()
	pass

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT && isDrawableSpace && not isDrawingLocked:
		print("i want to draw something")
		var mousePosition := get_global_mouse_position()		
		$Line2D.add_point(mousePosition - self.global_position) 
		if $Line2D.get_point_count()-1 == 2:
			isDrawingLocked = true

func lineFunction():	
	if isDrawableSpace and not isDrawingLocked:
		if $Line2D.get_point_count() == 0:
			$Line2D.add_point(Vector2(0,0))
			$Line2D.set_point_position(0, get_global_mouse_position() - self.global_position) #follow mouse
		else:
			$Line2D.set_point_position($Line2D.get_point_count()-1, get_global_mouse_position() - self.global_position) #follow mouse

	
func _process(_delta):
	lineFunction()