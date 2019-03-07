extends Node

var charlabel_path = "CanvasLayer/Control/MarginContainer/picture space container/character label container/character name"
var diallabel_path = "CanvasLayer/Control/MarginContainer/picture space container/dialogue label container/dialogue label"

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _on_next_button_pressed():
	self.queue_free()
	pass # replace with function body

func say(character,dialogue):
	get_node(charlabel_path).text = character
	get_node(diallabel_path).text = dialogue

func longsay():
	pass
