extends Spatial

func _init():
	add_to_group("obj")

func set_kndb(_vel, bd: Object, knbdscript):
	self.replace_by(bd)
	self.set_script(knbdscript)

func set_rgdb(bd, rgbdscript):
	self.replace_by(bd)
	self.set_script(rgbdscript)

func pick_up(vel: Vector3, knbd: Object):
	if knbd.is_inside_tree():
#		print("insidetree")
#		if (vel - self.global_transform.origin).length_squared() >= 0.1:
#			vel = knbd.move_and_slide(vel * 10, Vector3.UP)
		vel = knbd.move_and_slide(vel * 10, Vector3.UP)
	else:
		print("outside")
