extends CharacterBody2D

@export var movement_speed: float = 200.0
@export var player_id: int = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player_id not in [1, 2]:
		printerr("player_id not assigned")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	velocity.y = 0.0
	if Input.is_action_pressed("player%s_up" % player_id):
		velocity.y = -movement_speed
	elif Input.is_action_pressed("player%s_down" % player_id):
		velocity.y = movement_speed
	move_and_slide()
