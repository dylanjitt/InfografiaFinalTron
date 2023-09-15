extends RigidBody2D

@export var speed = 300  # Velocidad de movimiento
var direction = Vector2.ZERO

var onLeft = false
var onUp = false
var onRight = false
var onDown = false
var leftAlreadyPressed = 0
var rightAlreadyPressed = 0
var upAlreadyPressed = 0
var downAlreadyPressed = 0

func _physics_process(delta):
	#var direction = Vector2.ZERO  # Dirección de movimiento
	
	if Input.is_action_just_pressed("p1_left"):
		direction.x = -1
		direction.y=0
		onLeft=true
		onRight=false
		leftAlreadyPressed+=1
		rightAlreadyPressed=0
		upAlreadyPressed=0
		downAlreadyPressed=0
		if leftAlreadyPressed<=1:
			if onUp:
				$Sprite2D.rotate(-1.5708)
				$CollisionShape2D.rotate(-1.5708)
			if onDown:
				$Sprite2D.rotate(1.5708)
				$CollisionShape2D.rotate(1.5708)
				
	if Input.is_action_just_pressed("p1_right"):
		direction.x = 1
		direction.y=0
		onLeft=false
		onRight=true
		leftAlreadyPressed=0
		rightAlreadyPressed+=1
		upAlreadyPressed=0
		downAlreadyPressed=0
		if rightAlreadyPressed<=1:
			if onUp:
				$Sprite2D.rotate(1.5708)
				$CollisionShape2D.rotate(1.5708)
			if onDown:
				$Sprite2D.rotate(-1.5708)
				$CollisionShape2D.rotate(-1.5708)
				
	if Input.is_action_just_pressed("p1_up"):
		direction.y = -1
		direction.x=0
		onUp=true
		onDown=false
		leftAlreadyPressed=0
		rightAlreadyPressed=0
		upAlreadyPressed+=1
		downAlreadyPressed=0
		if upAlreadyPressed<=1:
			if onLeft:
				$Sprite2D.rotate(1.5708)
				$CollisionShape2D.rotate(1.5708)
			if onRight:
				$Sprite2D.rotate(-1.5708)
				$CollisionShape2D.rotate(-1.5708)
				
	if Input.is_action_just_pressed("p1_down"):
		direction.y = 1
		direction.x=0
		onUp=false
		onDown=true
		leftAlreadyPressed=0
		rightAlreadyPressed=0
		upAlreadyPressed=0
		downAlreadyPressed+=1
		if downAlreadyPressed<=1:
			if onLeft:
				$Sprite2D.rotate(-1.5708)
				$CollisionShape2D.rotate(-1.5708)
			if onRight:
				$Sprite2D.rotate(1.5708)
				$CollisionShape2D.rotate(1.5708)
	#direction = direction.normalized()  # Normaliza para evitar movimiento diagonal más rápido
	linear_velocity = direction * speed
	

