extends Spatial

var Rbd = preload("res://Rbd.tscn")
var Kbd = preload("res://Kbd.tscn")
onready var tarpos = $Player/Head/Camera/Position3D.global_transform.origin

func _physics_process(_dt):
	var col = $Player/Head/Camera/RayCast.get_collider()
	if col != null && col.is_in_group("obj"):
		if Input.is_action_pressed("pickup"):
			if get_node_or_null("Rbd") != null:
				$Rbd.queue_free()
			if get_node_or_null("Kbd") == null:
				var kin = Kbd.instance()
				add_child(kin)
				tarpos = $Player/Head/Camera/Position3D.global_transform.origin
				$Kbd.global_transform.origin = tarpos
			tarpos = $Player/Head/Camera/Position3D.global_transform.origin
			var vel = $Kbd.to_local(tarpos)
			$Kbd.move_and_slide(vel * 100, Vector3.UP)
		elif Input.is_action_just_released("pickup"):
			if get_node_or_null("Kbd") != null:
				$Kbd.queue_free()
			if get_node_or_null("Rbd") == null:
				var rin = Rbd.instance()
				add_child(rin)
				tarpos = $Player/Head/Camera/Position3D.global_transform.origin
				$Rbd.global_transform.origin = tarpos
