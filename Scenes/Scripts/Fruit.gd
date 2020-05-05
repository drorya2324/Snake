extends Area2D

signal fruit_eaten

func _ready():
	Global.Fruit = self


func _on_Fruit_area_entered(area):
	if area.name == "Head":
		queue_free()
		emit_signal("fruit_eaten")
	#	Global.Game.add_fruit()
	#	Global.Snake.add_tail()
