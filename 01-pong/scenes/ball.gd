extends CharacterBody2D

@export var speed: float = 400.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision = move_and_collide(Vector2.UP * speed * delta)
	if collision:
		print("I collided with ", collision.get_collider().name)
		speed *= -1
	pass


func start(direction: int) -> void:
	pass
