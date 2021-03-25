extends StaticBody2D
const BULLET = preload("res://Player/Bullet.tscn")
const BULLETSPEED = 2000

func _physics_process(delta):
	if Input.is_action_just_pressed("LMB"):
		fire()
		
func fire():
	var bullet_instance = BULLET.instance()
	bullet_instance.position = get_global_position()
	bullet_instance.rotation_degrees = 0
	bullet_instance.apply_impulse(Vector2(),Vector2(BULLETSPEED,0).rotated(6.28))
	get_tree().get_root().call_deferred("add_child",bullet_instance)
