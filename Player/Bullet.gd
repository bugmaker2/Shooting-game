extends RigidBody2D



func _on_Timer_timeout():
	queue_free()

func _on_Area2D_body_entered(body):
	if "Enemy" in body.name:
		queue_free()
