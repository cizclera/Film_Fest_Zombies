extends Zombies

const SPEED = 1.5
var player
var start_chase = 8.0
var stop_chase = 10.0
var attack_dist = 1.5

var is_chasing : bool = false
var is_attacking : bool = false


func _ready():
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	if player == null:
		player = get_tree().get_first_node_in_group("Player")
		return

	var distance = global_position.distance_to(player.global_position)

	if distance <= attack_dist:
		is_chasing = false
		is_attacking = true
	elif distance <= start_chase:
		is_chasing = true
		is_attacking = false
	elif distance > stop_chase:
		is_chasing = false
		is_attacking = false

	if is_attacking:
		velocity = Vector3.ZERO
		$AnimatedSprite3D.play("attack")
	elif is_chasing:
		var direction = (player.global_position - global_position).normalized()
		velocity = direction * SPEED
		$AnimatedSprite3D.play("chase")
	else:
		velocity = Vector3.ZERO
		$AnimatedSprite3D.play("idle")

	move_and_slide()
