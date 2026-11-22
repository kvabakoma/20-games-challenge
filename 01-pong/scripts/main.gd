extends Node2D

enum State {READY, PLAY, PAUSED, SCORED, GAME_OVER}

@export var max_score: int = 3

var state: State = State.READY
var player1_score: int = 0
var player2_score: int = 0

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	$GoalArea1.goal_scored.connect(_on_goal_scored)
	$GoalArea2.goal_scored.connect(_on_goal_scored)
	pass


func _physics_process(delta: float) -> void:
	pass


func _on_goal_scored(goal_owner: int) -> void:
	print("the ball entered player %s's goal" % goal_owner)
	pass

# state management
# 	game start with click?
# 	handle goals
# 	handle game over
# 	handle replay
