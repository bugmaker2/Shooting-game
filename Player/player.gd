extends KinematicBody2D

const SPEEDSTEP = 3
const TURNINGRATE = 2
const BULLET = preload("res://Player/Bullet.tscn")
const BULLETSPEED = 2000
var motion = Vector2(0,0)
var angle = 0
func _physics_process(delta):
	if Input.is_action_pressed("up"):
		motion.x += SPEEDSTEP*sin(angle)
		motion.y += SPEEDSTEP*cos(angle)
	if Input.is_action_pressed("right"):
		angle-=deg2rad(TURNINGRATE)
		$Sprite.rotation_degrees+=TURNINGRATE
	if Input.is_action_pressed("left"):
		angle+=deg2rad(TURNINGRATE)
		$Sprite.rotation_degrees-=TURNINGRATE
	motion = move_and_slide(motion)


	if Input.is_action_just_pressed("LMB"):
		fire()
		
func fire():
	var bullet_instance = BULLET.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = $Sprite.rotation_degrees
	bullet_instance.apply_impulse(Vector2(),Vector2(BULLETSPEED,0).rotated(deg2rad($Sprite.rotation_degrees-90)))
	get_tree().get_root().call_deferred("add_child",bullet_instance)

func killed():
	get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		killed()
