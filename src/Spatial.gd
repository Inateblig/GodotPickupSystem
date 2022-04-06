extends Spatial

var Rbd = preload("res://Rbd.tscn")
var Kbd = preload("res://Kbd.tscn")
onready var tarpos = $Player/Head/Position3D.global_transform.origin

var pvel = Vector3()
var ptarpos = Vector3()
var a = 0
func _physics_process(_dt):
	tarpos = $Player/Head/Position3D.global_transform.origin
	var col = $Player/Head/Camera/RayCast.get_collider()
	if Input.is_action_pressed("pickup"):
		if col != null:
			if !col.is_in_group("obj"):
				drop()
			elif col.is_in_group("obj"):
				pickup(Kbd, Rbd)
		else:
			drop()

	if Input.is_action_just_released("pickup"):
		drop()
	a += 1

func pickup(_Kbd, _Rbd):
	if get_node_or_null("Rbd") != null:
		$Rbd.queue_free()
	if get_node_or_null("Kbd") == null:
		var kin = Kbd.instance()
		add_child(kin)
		$Kbd.global_transform.origin = tarpos
	var vel = $Kbd.to_local(tarpos)
	vel = lerp(pvel, vel * 100, 0.4)
	$Kbd.move_and_slide(vel, Vector3.UP)
	pvel = vel
	ptarpos = tarpos

func drop():
	if get_node_or_null("Kbd") != null:
		$Kbd.queue_free()
	if get_node_or_null("Rbd") == null:
		var rin = Rbd.instance()
		add_child(rin)
		$Rbd.global_transform.origin = ptarpos
