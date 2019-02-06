extends KinematicBody

export(int,0,60) var move_speed = 8 #pixels per second in 60 fps
export(float,0,1) var rotate_speed = 1 #how fast to lerp between rotation targets
export(float,0,5) var step_height = .5 #how high to step up before moving horizontally.
var move_vec = Vector3(0,0,0) #vector that is applied to the KinematicBody
var look_vec = Vector3(0,0,0) #vector that stores where the player should face between frames
var moving = false #if the player is moving this frame. for animation and such

var animControl

func _ready():
	print("Move using WASD")
	var animControl = get_node("Cubefriend/AnimationPlayer")
	print(animControl)
	pass

func _process(delta):
	
	## MOVEMENT
	
	moving = false
	
	if Input.is_key_pressed(KEY_W):
		move_vec.z = 1
		moving = true
	elif Input.is_key_pressed(KEY_S):
		move_vec.z = -1
		moving = true
	else:
		move_vec.z = 0
	if Input.is_key_pressed(KEY_A):
		move_vec.x = 1
		moving = true
	elif Input.is_key_pressed(KEY_D):
		move_vec.x = -1
		moving = true
	else:
		move_vec.x = 0
	
	look_vec = Vector3 ( lerp(look_vec.x,translation.x+(move_vec.x*move_speed),rotate_speed) , translation.y , lerp(look_vec.z,translation.z+(move_vec.z*move_speed),rotate_speed) )
	if (look_vec != translation): look_at(look_vec,Vector3(0,1,0))
	
	if (moving == true):
		move_and_collide(Vector3 (0 , step_height , 0))
		move_and_collide(move_vec * move_speed * delta)
		move_and_collide(Vector3 (0 , -(step_height*2) , 0))
	
	## ANIMATION
	
	print(animControl)
	
	if (animControl != null):
		if moving:
			animControl.current_animation = "cubefriend_walk-loop"
		elif Input.is_key_pressed(KEY_E):
			animControl.current_animation = "cubefriend_interact"
		else:
			animControl.current_animation = "cubefriend_idle-loop"
	
	pass