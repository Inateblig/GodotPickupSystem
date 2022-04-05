extends Spatial

var Rbd = preload("res://Rbd.tscn")
var Kbd = preload("res://Kbd.tscn")
var kin
var rin
var kinrot = Vector3()
var rinrot = Vector3()
onready var tarpos = $Player/Head/Camera/Position3D.global_transform.origin

func _physics_process(_dt):
	if Input.is_action_pressed("pickup"):
		if get_node_or_null("Rbd") != null:
			rinrot = $Rbd.rotation
			rin.queue_free()
		if get_node_or_null("Kbd") == null:
			kin = Kbd.instance()
			add_child(kin)
			$Kbd.rotation = rinrot
			tarpos = $Player/Head/Camera/Position3D.global_transform.origin
			$Kbd.global_transform.origin = tarpos
		tarpos = $Player/Head/Camera/Position3D.global_transform.origin
		var vel = $Kbd.to_local(tarpos)
		$Kbd.move_and_slide(vel * 100, rinrot)
	elif Input.is_action_just_released("pickup"):
		if get_node_or_null("Kbd") != null:
			kinrot = $Kbd.rotation
			kin.queue_free()
		if get_node_or_null("Rbd") == null:
			rin = Rbd.instance()
			add_child(rin)
			tarpos = $Player/Head/Camera/Position3D.global_transform.origin
			$Rbd.rotation = kinrot
			$Rbd.global_transform.origin = tarpos
