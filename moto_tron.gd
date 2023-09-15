extends CharacterBody2D

signal turn()
signal updatePoints(position)
signal playerDead()
@export var SPEED = 500
var state = ""

func _physics_process(delta):
	#print(state)
	#print(global_position)
	if state != "":
		emit_signal("updatePoints",global_position)
	if Input.is_action_just_pressed("p1_left"):
		if state != "right":
			$AnimationPlayer.play("left")
			velocity = Vector2(-1, 0) * SPEED 
			print("left")
			emit_signal("turn")
		
	if Input.is_action_just_pressed("p1_right"):
		if state != "left":
			$AnimationPlayer.play("right")
			velocity = Vector2(1, 0) * SPEED
			state = "right" 
			print("right")
			emit_signal("turn")
			#emit_signal("turn",global_position)
		
	if Input.is_action_just_pressed("p1_up"):
		if state != "down":
			$AnimationPlayer.play("up")
			velocity = Vector2(0, -1) * SPEED 
			state = "up"
			emit_signal("turn")
			print("up")
			#emit_signal("turn",global_position)
			
	if Input.is_action_just_pressed("p1_down"):
		if state != "up":
			$AnimationPlayer.play("down")
			velocity = Vector2(0, 1) * SPEED 
			state = "down"
			emit_signal("turn")
			print("down")
			
	if Input.is_action_just_pressed("pause"):
		velocity=Vector2(0,0)
			#emit_signal("turn",global_position)
	emit_signal("updatePoints",global_position)
	move_and_slide()


#func _on_hitbox_area_entered(area):
#	dead()
	
func dead():
	print("colision detected")
	velocity=Vector2(0,0)
	emit_signal("playerDead")
