extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	var test_time = load("res://TIME.tscn").instance()
	add_child(test_time)
	var test_dialogue = load("res://MESSAGE.tscn").instance()
	test_dialogue.say("Date Time", "There's a print function, you dingus")
	add_child(test_dialogue)
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
