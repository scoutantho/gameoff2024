extends Node2D

var delete_all_line_flag = true

func displayOverlayDebugging():
	var scene = preload("res://scenes/debug_overlay.tscn")
	var overlay = scene.instantiate()
	overlay.add_stat("Line2d Count ", $Line2D, "get_point_count", true)		
	overlay.add_stat("", "", "", false)
	overlay.add_stat("Self Global Position ", self, "global_position", false)
	overlay.add_stat("Mouse Global Position ", self, "get_global_mouse_position", true)
	add_child(overlay)
	
func _ready():
	displayOverlayDebugging()
	pass
	
func lineFunction():
	if $Line2D.get_point_count() == 0: 
		$Line2D.add_point(get_global_mouse_position() - self.global_position)
# #			add new point at the center of hovered button 
#			(this line point will later be the constantly moving line when we drag) 
	# $Line2D.add_point(buttonCenter(),-1)
#			reposition/set the position of 2nd last line point to center of hovered button
	
	# $Line2D.set_point_position(1, get_global_mouse_position()  - self.global_position )
		# var astar = new AStar2D()
		# astar.AddPoint(1, new Vector2(1, 1))
		# astar.AddPoint(2, new Vector2(0, 5))
		# astar.ConnectPoints(1, 2, false)
	
func _process(_delta):
	lineFunction()