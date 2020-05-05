extends Area2D

var direction = []
var pos_array = []
var cur_dir = Vector2()

const SPEED = 5

func _ready():
	Global.Tail = self

func _process(delta):
	if (direction.size()>0):
		if position == pos_array[0]:
			cur_dir = direction[0]
			remove_from_tail()
	position += cur_dir /2 *Global.speed

func remove_from_tail():
	direction.pop_front()
	pos_array.pop_front()
	
 
 # Being called by Snke.gd (move_snake)
func add_to_tail(head_pos, dir):
	pos_array.append(head_pos)
	direction.append(dir)
#	pass


func _on_Tail_area_entered(area):
	if area.name=="Head":
		 get_tree().quit()
