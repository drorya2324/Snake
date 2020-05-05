extends Node2D



var direction = Vector2(1,0) 
var next_tail_dir = Vector2(1,0)
var prev_dir = Vector2(1,0)

const GAP = -35

onready var tail = preload("res://Scenes/Tail.tscn")




func _ready():
	Global.Snake = self


func _process(delta):
	if Input.is_action_pressed("up"):
		direction = Vector2(0,-1) 
	if Input.is_action_pressed("down"):
		direction = Vector2(0,1) 
	if Input.is_action_pressed("left"):
		direction = Vector2(-1,0)
	if Input.is_action_pressed("right"):
		direction = Vector2(1,0) 
	move_snake()
	
	
	
func move_snake():
	var dir_change = false
	if prev_dir != direction:
		prev_dir = direction
		dir_change = true
	var head_pos = $Head.position
	$Head.position += direction  /2 * Global.speed
	if dir_change:
		for i in range(1, get_child_count()):
			get_child(i).add_to_tail(head_pos,direction)
	
	
# Being called by Game.gd (level_up)
func add_tail():
	var inst = tail.instance()
	var prev_tail = get_child(get_child_count()-1)
	if prev_tail.name != "Head":
		inst.cur_dir = prev_tail.cur_dir
		for i in range(0, prev_tail.pos_array.size()):
			inst.pos_array.append(prev_tail.pos_array[i])
			inst.direction.append(prev_tail.direction[i])
		inst.position = prev_tail.position+prev_tail.cur_dir * GAP 
	else:
		inst.cur_dir = direction
		inst.position = prev_tail.position + direction * GAP
	add_child(inst)
