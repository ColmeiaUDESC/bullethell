extends Node2D

var dir = Vector2(0, 1)

export var bullet_speed = 1

func _process(delta):
	self.position -= dir * delta * bullet_speed
	
	if ($RayCast2D.is_colliding()):
		var collid_p = $RayCast2D.get_collider().get_parent()
		
		if (collid_p.type == "ENEMY"):
			position += Vector2(2000,2000)
			if(collid_p.health_e > 0):
				collid_p.health_e -= 1

func screen_exited():
	get_parent().remove_child(self)
	queue_free()
