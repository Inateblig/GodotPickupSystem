extends RigidBody

var prevpos: Vector3
var picked = false

func _init():
	set_max_contacts_reported(10)

func _integrate_forces(state):
	if !picked:
		return
	print(state.get_contact_count())
	if state.get_contact_count()>0:
		global_transform.origin = prevpos

func _physics_process(_dt):
	print(picked)
