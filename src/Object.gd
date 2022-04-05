extends Spatial

var knbd = KinematicBody.new()
var rgbd = RigidBody.new()

func _init():
	add_to_group("obj")

func set_kndb(_vel, knbd, rgbd, knbdscript):
	rgbd.replace_by(knbd)
	rgbd.queue_free()
	knbd.set_script(knbdscript)

func set_rgdb(knbd, rgbd, rgbdscript):
	knbd.replace_by(rgbd)
	knbd.queue_free()
	rgbd.set_script(rgbdscript)

func pick_up(vel: Vector3, knbd: Object):
	if knbd.is_inside_tree():
#		print("insidetree")
#		if (vel - self.global_transform.origin).length_squared() >= 0.1:
#			vel = knbd.move_and_slide(vel * 10, Vector3.UP)
		vel = knbd.move_and_slide(vel * 10, Vector3.UP)
	else:
		print("outside")
