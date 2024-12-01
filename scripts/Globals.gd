extends Node
class_name Globals

enum powerUp {	bush, lava, water}
enum cardNames {
	color_red1 = 0,
	color_red2 = 1,
	color_red3 = 2,
	color_blue1 = 3,
	color_blue2 = 4,
	color_blue3 = 5,
	story1 = 6,
	story2 = 7,
	story3 = 8,
}
static var player_hasDied : bool = false
static var player_canInteract : bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
