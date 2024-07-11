extends RayCast3D

var obj = null
var key = KEY_E
var last = Vector3.ZERO
var original_scale = Vector3.ONE
@onready var point = $"../Hold"

func _process(delta):
	if Input.is_key_pressed(key):
		if obj == null:
			var collider = get_collider()
			if collider != null:
				if collider.is_in_group("grab"):
					obj = collider
					original_scale = obj.scale
					obj.scale = original_scale * 0.2
		
		if obj != null:
			last = obj.global_transform.origin
			obj.global_transform.origin = point.global_transform.origin
			if obj is RigidBody3D:
				obj.linear_velocity = Vector3.ZERO
	else:
		if obj != null:
			if obj is RigidBody3D:
				print("rigid")
				var velocity = obj.global_transform.origin - last
				obj.linear_velocity = velocity * 15
			obj.scale = original_scale
		obj = null
