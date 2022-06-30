extends Node2D

var type = "PLAYER"

export (int) var health = 5

var p_bullet = load("res://Scenes/P_Bullet.tscn")

export (int) var speed = 200

var velocity = Vector2()
var p_position  = global_translate (Vector2(512,500))

func get_input():
		velocity = Vector2()
		if Input.is_action_pressed("right"):
			global_translate (Vector2(5,0))
		if Input.is_action_pressed("left"):
			global_translate (Vector2(-5,0))
		if Input.is_action_pressed("down"):
			global_translate (Vector2(0,5))
		if Input.is_action_pressed("up"):
			global_translate (Vector2(0,-5))

func _process(delta):
	
	get_input()
	if (Input.is_action_just_pressed("Shoot")):
		var b = p_bullet.instance()
		get_parent().add_child(b)
		b.position = self.position
	
func advance_status():
	get_parent().get_node("Label").text = get_parent().health_status[health]
	if (health <= 0):
		hide()
