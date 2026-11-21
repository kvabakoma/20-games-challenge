extends CharacterBody2D

@export var default_speed: float = 400.0
@export var max_bounce_angle: float = 45
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
		var collider = collision.get_collider()
		if collider.is_in_group("boundaries"):
			print("hit a boundary")
			direction = direction.bounce(collision.get_normal())
		else:
			print("hit a paddle")
			var collider_body = collider.get_node("CollisionShape2D")
			var collider_height: int = collider_body.shape.size.y
			var hit_pos_y: int = int(self.position.y - collider.position.y)
			
			# TODO
			var dir := Vector2.from_angle(deg_to_rad(45.0))
			
		speed += default_speed * 0.05

func start(start_direction: int) -> void:
	var random_deg: float = randf_range(-15.0, 15.0)
	direction = Vector2(1 * start_direction, 0).rotated(deg_to_rad(random_deg))
	speed = default_speed
	enable(true)
	
	
func enable(new_status: bool) -> void:
	set_physics_process(new_status)
