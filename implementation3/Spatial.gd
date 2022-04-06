extends Spatial

var Rbd = preload("res://Rbd.tscn")
var Kbd = preload("res://Kbd.tscn")

onready var rb = $Rbd
onready var mass = $Rbd.get_mass()
onready var ray = $Player/Head/Camera/RayCast

var tarpos: Vector3

func _physics_process(dt):
	if Input.is_action_pressed("pickup") && \
	ray.get_collider() != null && \
	ray.get_collider().is_in_group("obj"):
		tarpos = $Player/Head/Position3D.global_transform.origin
		pickup(tarpos)
	elif Input.is_action_just_released("pickup"):
		drop()

func pickup(tarpos):
	rb.picked = true
	rb.prevpos = rb.global_transform.origin
	rb.global_transform.origin = tarpos

func drop():
	rb.picked = false
	rb.global_transform.origin = rb.prevpos
	rb.linear_velocity = Vector3()
