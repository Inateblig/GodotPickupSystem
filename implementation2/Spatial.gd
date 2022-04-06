extends Spatial

var Rbd = preload("res://Rbd.tscn")
var Kbd = preload("res://Kbd.tscn")

onready var rb = $Rbd
onready var mass = $Rbd.get_mass()
onready var ray = $Player/Head/Camera/RayCast

var lvel: Vector3
var avel: Vector3

func _physics_process(dt):
	if Input.is_action_pressed("pickup"):
		if ray.get_collider() != null:
			if ray.get_collider().is_in_group("obj"):
				var curpos = rb.global_transform.origin
				var tarpos = $Player/Head/Position3D.global_transform.origin
				var force = tarforce(curpos, tarpos, mass, 30)
				rb.add_force(force, Vector3())
				lvel = rb.get_linear_velocity()
				avel = rb.get_angular_velocity()
			elif Input.is_action_just_released("pickup"):
				rb.mode = RigidBody.MODE_RIGID
				drop(lvel, avel)

func tarforce(cpos, tpos, m, weight):
	var tvel = (tpos - cpos) * weight
	var cvel = $Rbd.get_linear_velocity()
	var a = (tvel - cvel)
	var F = m * a
	return F

func drop(lvel, avel):
	rb.linear_velocity = lvel
	rb.angular_velocity = avel
