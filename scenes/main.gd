extends Node

@export var serpent_scene : PackedScene

#game variables
var score : int
var game_started : bool = false

#grid variables
var cells : int = 20
var cell_size : int = 50

#snake variables
var old_data : Array
var serpent_data : Array
var serpent : Array

#movement variables
var start_pos = Vector2 (9,9)
var up = Vector2(0, -1)
var down = Vector2(0, 1)
var left = Vector2(-1, 0)
var right = Vector2(1, 0)
var move_direction : Vector2
var can_move

#Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	
func new_game():
	score = 0
	$hud.get_node("ScoreLabel").text = "SCORE: " + str(score)
	move_direction = up
	can_move = true
	generate_serpent()
	
func generate_serpent():
	old_data.clear()
	serpent_data.clear()
	serpent.clear()
	#starting with the start_pos, create tail segments vertically down
	for i in range(3):
		add_segment(start_pos + Vector2(0, i))
		
func add_segment(pos):
	serpent_data.append(pos)
	var SerpentSegment = serpent_scene.instantiate()
	SerpentSegment.position = (pos * cell_size) + Vector2 (0, cell_size)
	add_child(SerpentSegment)
	serpent.append(SerpentSegment)

#Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta):
	pass
