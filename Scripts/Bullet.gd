extends Node2D

var dir = Vector2(1, 0)

export var bullet_speed = 1

func _process(delta):
	self.position += dir.rotated(self.rotation) * delta * bullet_speed
	
	if ($RayCast2D.is_colliding()):
		var collid = $RayCast2D.get_collider().get_parent()
		if (collid.type == "PLAYER"):
			position += Vector2(2000,2000)
			
			if(collid.health > 0):
				collid.health -= 1
			collid.advance_status()
			
func screen_exited():
	get_parent().remove_child(self)
	queue_free()
