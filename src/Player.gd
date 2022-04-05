extends KinematicBody

export var mouse_sens = 0.005
export var paused = true
export var speed = 0.1
export var GRAVITY_ACC = 1.0
export var JUMP_FORCE = 10.0
var vel: Vector3
var gravity: float

func _input(event):
	if event is InputEventKey && event.scancode == KEY_ESCAPE && event.is_pressed():
		paused = !paused
	if event is InputEventMouseMotion && !paused:
		self.rotate_y((-event.relative.x) * mouse_sens)
		$Head.rotate_x((-event.relative.y) * mouse_sens)
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _physics_process(dt):
	vel = get_force(dt) * speed / dt
	vel = move_and_slide(vel, Vector3.UP)


func get_force(_dt) -> Vector3:
	var z: float = (
		Input.get_action_strength("d") - Input.get_action_strength("e")
	)
	var x: float = (
		Input.get_action_strength("f") - Input.get_action_strength("s")
	)
	var y: float
	if is_on_floor():
		y = 0
	else:
		y = -GRAVITY_ACC
	if Input.is_action_pressed("jump"):
		y = GRAVITY_ACC
	return transform.basis.xform(Vector3(x, 0, z).normalized() + Vector3.UP * y)
