extends KinematicBody2D

var speed = 200


func _physics_process(delta):
#передвижение
	var velocity = Vector2()
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_raw_strength("ui_right") - Input.get_action_raw_strength("ui_left")
	input_vector.y = Input.get_action_raw_strength("ui_down") - Input.get_action_raw_strength("ui_up")
	if Input.is_action_pressed("run"):
		speed = 400
	else:
		speed = 200
	if input_vector:
		velocity = input_vector * speed
	else:
		velocity = input_vector
	velocity = velocity.normalized() * speed
	move_and_slide(velocity)
#анимация
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite.play("walk_right")
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite.play("walk_left")
	elif Input.is_action_pressed("ui_up"):
		$AnimatedSprite.play("walk_up")
	elif Input.is_action_pressed("ui_down"):
		$AnimatedSprite.play("walk_down")
	else:
		$AnimatedSprite.play("stay")
