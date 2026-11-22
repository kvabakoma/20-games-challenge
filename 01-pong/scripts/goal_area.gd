extends Area2D

@export var player: int

signal goal_scored(goal_owner: int)

func _on_body_entered(body: Node2D) -> void:
	goal_scored.emit(player)
