extends Node2D

@export var isDrawableSpace : bool = true
@export var isDrawingLocked : bool = false
@onready var coll = $CollisionShape2D

#todo: instantiate a line 2d, instead of using the actual one in order to keep the visual of it 
func displayOverlayDebugging():
	if(GameManager.isDisplayOverlayEnable):
		DebugOverlay.add_stat("Line2d Count ", $Line2D, "get_point_count", true)		
		DebugOverlay.add_stat("", "", "", false)
		DebugOverlay.add_stat("Self Global Position ", self, "global_position", false)
		DebugOverlay.add_stat("Mouse Global Position ", self, "get_global_mouse_position", true)
		# DebugOverlay.add_stat("position0", $Line2D, "get_point_position", true, [0])
		# DebugOverlay.add_stat("position1", $Line2D, "get_point_position", true, [1])
	
func _ready():
	if GameManager.isCheatPlateformEnable:
		InitLine2D()
		pass
	GameManager.connect("isCheatPlateformEnabling", InitLine2D)	
	pass
	
func InitLine2D() -> void :
	$Line2D.default_color= Refs.color_blue
	displayOverlayDebugging()
	pass
	
func _input(event: InputEvent) -> void:
	if GameManager.isCheatPlateformEnable:
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT && isDrawableSpace && not isDrawingLocked:
			print("i want to draw something")
			var mousePosition := get_global_mouse_position()		
			$Line2D.add_point(mousePosition - self.global_position) 
			if $Line2D.get_point_count()-1 == 2:
				isDrawingLocked = true
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_RIGHT:
			$Line2D.clear_points()
			isDrawingLocked = false
		if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_MIDDLE:
			draw_my_cubes()

func lineFunction():	
	if isDrawableSpace and not isDrawingLocked:
		if $Line2D.get_point_count() == 0:
			$Line2D.add_point(Vector2(0,0))
			$Line2D.set_point_position(0, get_global_mouse_position() - self.global_position) #follow mouse
		else:
			$Line2D.set_point_position($Line2D.get_point_count()-1, get_global_mouse_position() - self.global_position) #follow mouse


func draw_my_cubes():
	# var scene = preload("res://scenes/cube.tscn")
	# var instance = scene.instance()
	# instance.position = $Line2D.get_point_position(0)
	# add_child(instance)
	var new_coll = coll.duplicate()
	var new_shape = coll.shape.duplicate()
	new_coll.shape = new_shape
	new_coll.shape.a = $Line2D.get_point_position(0)
	new_coll.shape.b = $Line2D.get_point_position(1)
	add_child(new_coll, true)
	$Line2D.clear_points()
	isDrawingLocked = false
	

func _process(_delta):
	if GameManager.isCheatPlateformEnable:
		lineFunction()
