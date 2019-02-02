extends KinematicBody

export var move_speed = 8 #pixels per second in 60 fps
var move_vec = Vector3() #vector that is applied to the KinematicBody

func _ready():
	print("Move using WASD")
	pass

func _process(delta):
	
	if Input.is_key_pressed(KEY_W):
		move_vec.z = 1
	elif Input.is_key_pressed(KEY_S):
		move_vec.z = -1
	else:
		move_vec.z = 0
	if Input.is_key_pressed(KEY_A):
		move_vec.x = 1
	elif Input.is_key_pressed(KEY_D):
		move_vec.x = -1
	else:
		move_vec.x = 0
	
	move_and_collide(move_vec.normalized() * move_speed * delta)
	
	pass
