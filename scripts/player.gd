extends CharacterBody2D

@onready var sprite := $Sprite
@export var cardHolds : Array[Globals.cardNames] = []

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready() -> void:
	GameManager.connect("noClipEnabling", on_no_clip_enabling)	
	# DebugOverlay.add_stat("Player card holds", cardHolds, "cardHolds", false)
	pass

func on_no_clip_enabling():
	if GameManager.no_clip_enable:
		set_physics_process(false)
		self.collision_mask = 0
	else:
		set_physics_process(true)
		self.collision_mask = 2
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if direction:
		sprite.flip_h = direction < 0
