extends Node


var Graph2D = preload("res://Scenes/Graph2D.tscn")
var Graph2DSearch = preload("res://Code/Graph2DSearch.gd")

var data = [
	3, 3, 3, 3, 3, 3, 3, 3,
	3, 2, 2, 2, 3, 2, 3, 3,
	0, 2, 3, 2, 2, 2, 2, 3,
	3, 2, 3, 3, 2, 3, 2, 3,
	3, 2, 2, 3, 2, 3, 2, 3,
	3, 3, 2, 2, 2, 3, 2, 3,
	3, 3, 2, 3, 2, 2, 3, 3,
	3, 3, 2, 2, 3, 2, 2, 1,
	3, 2, 2, 2, 2, 2, 2, 3,
	3, 3, 3, 3, 3, 3, 3, 3
	]

var graph2D
var searcher

func _ready():
	graph2D = Graph2D.instance()
	graph2D.init(Vector2(8,10), data)
	add_child(graph2D)
	searcher = Graph2DSearch.new(graph2D)
	searcher.initAmplitud()

var timeCntr = 0.0
var timeInterval = 0.1

func _process(delta):
	if Input.is_action_just_pressed("next"):
		searcher.nextAmplitud()
	elif Input.is_action_pressed("auto_next"):
		timeCntr += delta
		if timeCntr > timeInterval:
			searcher.nextAmplitud()
			timeCntr = 0.0