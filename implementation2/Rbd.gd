extends RigidBody

var force: Vector3

func _integrate_forces(state):
	state.add_central_force(force)
