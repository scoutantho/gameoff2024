extends Node
@export_group("ColorPalette")
@export var color_blue : Color = Color("#00303b")
@export var color_red : Color = Color("#ff7777")
@export var color_whitish : Color = Color("#f1f2da")
@export var color_yellow : Color = Color("#ffce96")

@export_group("Gradients")
@export var gradient_blue : PackedColorArray = PackedColorArray([color_whitish, color_blue])
@export var gradient_red : PackedColorArray = PackedColorArray([color_whitish, color_red])
@export var gradient_yellow : PackedColorArray = PackedColorArray([color_whitish, color_yellow])
