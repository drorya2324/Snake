extends Node2D

onready var fruit = preload("res://Scenes/Fruit.tscn")
var fruit_count =0

func _ready():
	Global.Game = self
	add_fruit()
	pass
	
func add_fruit():
	var inst = fruit.instance()
	inst.position = Vector2(get_random_number(900,10),get_random_number(500,10)) #(900,50),(500,50)
	# signal from Game.gd:
	inst.connect("fruit_eaten",self , "level_up")
	add_child(inst)

func level_up():
	add_fruit()
	$Snake.add_tail()
	fruit_count += 1
	if fruit_count == 2:
		speed_up()
		#Global.GUI.Update_GUI()
		
		
func speed_up():
	#Global.Snake.position += 2
	#Global.Tail.position += 2
	pass

func get_random_number(MAX,MIN):
	randomize()
	var num = randi() %MAX +MIN
	return num	
