extends Area2D

@onready var tilemap = %TileMap
@onready var collsionSHapeDrawableSurface = $DrawableCollision
@onready var player = get_tree().get_first_node_in_group("Player")
var astar_grid: AStarGrid2D

func _ready() -> void:
	astar_grid = AStarGrid2D.new()
	astar_grid.region =  Rect2i(0, 0, 32, 32)
	astar_grid.cell_size = Vector2(16,16) # //tilemap.cell_size
	# astar_grid.grid = tilemap
	astar_grid.update()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.pressed && event.button_index == MOUSE_BUTTON_LEFT:
		print("i want to draw something")
		var mousePosition := get_global_mouse_position()
		var scene = preload("res://Scenes/bush.tscn")
		var instance = scene.instantiate()
		print(mousePosition)
		instance.position = mousePosition
		add_child(instance)
		
