extends KinematicBody

export(int,0,60) var move_speed = 8 #pixels per second in 60 fps
export(float,0,1) var rotate_speed = 1 #how fast to lerp between rotation targets
var move_vec = Vector3(0,0,0) #vector that is applied to the KinematicBody
var look_vec = Vector3(0,0,0) #vector that stores where the player should face between frames

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
	
	#look_vec = rotation
	#print("1:",look_vec)
	#var lookat = Vector3 ( translation + move_vec )
	look_vec = Vector3 ( lerp(look_vec.x,translation.x+(move_vec.x*move_speed),rotate_speed) , translation.y , lerp(look_vec.z,translation.z+(move_vec.z*move_speed),rotate_speed) )
	look_at(look_vec,Vector3(0,1,0))
	
	#print(rotation)
	
	move_and_collide(move_vec * move_speed * delta)
	#print("2:",look_vec)
