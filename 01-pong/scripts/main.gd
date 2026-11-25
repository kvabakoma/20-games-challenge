extends Node2D

enum State {READY, PLAY, PAUSED, SCORED, GAME_OVER}

@export var max_score: int = 3

var state: State = State.READY
var player1_score: int = 0
var player2_score: int = 0

@onready var goal_area1: Area2D = $GoalArea1
@onready var goal_area2: Area2D = $GoalArea2
@onready var paddle1: CharacterBody2D = $Paddle1
@onready var paddle2: CharacterBody2D = $Paddle2
@onready var ball: CharacterBody2D = $Ball


func _ready() -> void:
	goal_area1.goal_scored.connect(_on_goal_scored)
	goal_area2.goal_scored.connect(_on_goal_scored)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("restart"):
		_reset_positions()


func _physics_process(_delta: float) -> void:
	pass


func _on_goal_scored(goal_owner: int) -> void:
	print("the ball entered player %s's goal" % goal_owner)
	_reset_positions()
	pass
	

func _reset_positions() -> void:
	paddle1.reset_position()
	paddle2.reset_position()
	ball.reset_position()

# state management
# 	game start with click?
# 	handle goals
# 	handle game over
# 	handle replay
