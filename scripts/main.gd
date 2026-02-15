extends Node3D

var zombie1 = preload("res://scenes/zombie_1.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	spawnzomb1()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Camera3D.global_position = $player.global_position + Vector3(0, 5, 10)


func spawnzomb1():
	var zomb1instance = zombie1.instantiate()
	zomb1instance.position.x = 5
	zomb1instance.position.y = 2
	zomb1instance.position.z = -10
	add_child(zomb1instance)
