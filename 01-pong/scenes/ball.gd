extends CharacterBody2D

@export var default_speed: float = 400.0
var speed: float = 0.0
var direction: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_physics_process(false)
	start(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:		
	var collision = move_and_collide(direction * speed * delta)
	if collision:
		#print("I collided with ", collision.get_collider().name)
		if collision.get_collider().is_in_group("boundaries"):
			print("hit a boundary")
			direction = direction.bounce(collision.get_normal())
			speed 
		else:
			print("hit a paddle")
			direction = direction.bounce(collision.get_normal())
		
		speed += default_speed * 0.05

func start(start_direction: int) -> void:
	var random_deg: float = randf_range(-15.0, 15.0)
	direction = Vector2(1 * start_direction, 0).rotated(deg_to_rad(random_deg))
	speed = default_speed
	enable(true)
	
	
func enable(new_status: bool) -> void:
	set_physics_process(new_status)
