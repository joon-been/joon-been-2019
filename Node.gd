extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var title_scene

func _ready():
	title_scene = load("res://TITLE.tscn").instance()
	add_child(title_scene)
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
