extends CharacterBody2D

@export var default_speed: float = 200.0
@export var player_id: int = 1

var start_pos: Vector2
var speed: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_pos = global_position
	speed = default_speed
	if player_id not in [1, 2]:
		printerr("player_id not assigned")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity.y = 0.0
	if Input.is_action_pressed("player%s_up" % player_id):
		velocity.y = -speed
	elif Input.is_action_pressed("player%s_down" % player_id):
		velocity.y = speed
	move_and_slide()


func reset_position() -> void:
	velocity = Vector2.ZERO
	position = start_pos


func get_hit() -> void:
	speed += default_speed * 0.05