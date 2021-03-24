extends Node2D
const ENEMY = preload("res://Enemy.tscn")

var rng = RandomNumberGenerator.new()
func _ready():
	rng.randomize()

func _on_Timer_timeout():
	var new_enemy = ENEMY.instance()
	var x = rng.randf_range(-20.0, 1500)
	var y = rng.randf_range(-10,0)
	new_enemy.position = Vector2(x,y)
	call_deferred("add_child",new_enemy)
	#new_enemy.rotation_degrees = rotation_degrees
	#new_enemy.apply_impulse(Vector2(),Vector2(BULLETSPEED,0).rotated(rotation))
	#get_tree().get_root().call_deferred("add_child",bullet_instance)
	#RandomNumberGenerator
