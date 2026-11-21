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
			direction = direction.bounce(collision.get_normal())
		else:
			var collider_body = collider.get_node("CollisionShape2D")
			var collider_height: float = collider_body.shape.size.y * absf(collider_body.global_scale.y)
			var hit_offset: float = (global_position.y - collider_body.global_position.y) / (collider_height * 0.5)
			hit_offset = clampf(hit_offset, -1.0, 1.0)
			var bounce_angle: float = hit_offset * max_bounce_angle * signf(collision.get_normal().x)
			direction = collision.get_normal().rotated(deg_to_rad(bounce_angle)).normalized()
			 
		speed += default_speed * 0.05

func start(start_direction: int) -> void:
	var random_deg: float = randf_range(-15.0, 15.0)
	direction = Vector2(1 * start_direction, 0).rotated(deg_to_rad(random_deg))
	speed = default_speed
	enable(true)
	
	
func enable(new_status: bool) -> void:
	set_physics_process(new_status)
