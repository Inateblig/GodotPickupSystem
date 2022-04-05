extends Spatial

#func _physics_process(_dt):
#	if Input.is_action_pressed("pickup"):
#		print("pickup")
#		pick_up($Object.to_local($Player/Head/Camera/Position3D.global_transform.origin))
#
#func pick_up(vel: Vector3):
#	vel = $Object.move_and_slide(vel * 10, Vector3.UP)

var knbd = KinematicBody.new()
var rgbd = RigidBody.new()

var set_knbd_hase = false
var set_rgbd_hase = false

var knbdscript = preload("res://Knbd.gd")
var rgdbscript = preload("res://Rgbd.gd")

onready var object = $Object

func _physics_process(_dt):

	if Input.is_action_pressed("pickup"):
		var tarpos = $Player/Head/Camera/Position3D.global_transform.origin
		var objpos = object.global_transform.origin
		var vel = object.to_local(tarpos)
		object.move_and_slide(vel * 100, Vector3.UP)
		if !set_knbd_hase:
			if object == null:
				object = get_node("@@2")
			print(object)
			set_knbd_hase = true
			set_rgbd_hase = false
			object.set_kndb(vel, knbd, rgbd, knbdscript)
		object.pick_up(vel, knbd)
		print(object.global_transform.origin)
		print(object)
#	elif Input.is_action_just_released("pickup"):
#		print("dropped")
#		if !set_rgbd_hase:
#			set_knbd_hase = false
#			set_rgbd_hase = true
#			object.set_rgdb(knbd, rgbd, rgdbscript)


