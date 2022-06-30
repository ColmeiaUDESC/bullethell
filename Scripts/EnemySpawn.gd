extends Node2D

var enemy_scene = [load("res://Scenes/Enemies/Straight-Shot-Enemy.tscn")]


func _ready():
	$Timer.set_wait_time(1)
	$Timer.start()

func timeout():
		var enemy = enemy_scene[0].instance()
		randomize()
		enemy.position.x = rand_range(100, 1000)
		enemy.position.y = -50
		add_child(enemy)


