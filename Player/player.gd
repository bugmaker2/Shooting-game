extends KinematicBody2D

const SPEEDSTEP = 2
const TURNINGRATE = 2
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

func killed():
	get_tree().reload_current_scene()

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		killed()
