extends KinematicBody2D

const MOVESPEED = 500
const BULLETSPEED = 2000
const BULLET = preload("res://Bullet.tscn")

func _physics_process(delta):
	var motion = Vector2()
	
	if Input.is_action_pressed("up"):
		motion.y -= 1
	if Input.is_action_pressed("down"):
		motion.y += 1
	if Input.is_action_pressed("left"):
		motion.x -= 1
	if Input.is_action_pressed("right"):
		motion.x += 1
	if Input.is_action_just_pressed("LMB"):
		fire()

	motion = motion.normalized()
	motion = move_and_slide(motion * MOVESPEED)
	look_at(get_global_mouse_position())
func fire():
	var bullet_instance = BULLET.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(BULLETSPEED,0).rotated(rotation))
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func kill():
	get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		kill()
