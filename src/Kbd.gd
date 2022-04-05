extends KinematicBody


func move(vel: Vector3):
	move_and_slide(vel, Vector3.UP)
