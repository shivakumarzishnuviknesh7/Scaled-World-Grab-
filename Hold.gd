extends RayCast3D

@export var key: String = "ui_accept"  # Key action to initiate grabbing
@export var min_scale: Vector3 = Vector3(0.2, 0.2, 0.2)  # Minimum scale for the object when it's farthest
@export var max_scale: Vector3 = Vector3(2, 2, 2)  # Maximum scale for the object when it's nearest
@export var max_distance: float = 10.0  # Distance at which the object reaches its minimum scale
@export var min_distance: float = 1.0  # Distance at which the object reaches its maximum scale
@export var floor_y: float = 0.0  # Y position of the floor
@export var max_horizontal_distance: float = 5.0  # Maximum horizontal distance from the hold point

var obj: Node3D = null  # Variable to hold the object currently grabbed
var original_scale: Vector3 = Vector3.ONE  # Variable to store the original scale of the object
var hold_point: Node3D  # Node to hold the grabbed object

func _ready():
	hold_point = get_node("../Hold")  # Assuming 'Hold' is a sibling node where you want to hold the grabbed object

func _process(delta):
	if Input.is_action_pressed(key):  # Check if the action is pressed
		if obj == null:
			grab_object()
		if obj != null:
			hold_object()
	else:  # Key is released
		release_object()

func grab_object():
	var collider = get_collider()
	if collider != null and collider.is_in_group("grab"):
		obj = collider  # Assign the collider to obj if it belongs to the "grab" group
		#original_scale = obj.scale  # Store the original scale of the object

func hold_object():
	var new_position = hold_point.global_transform.origin

	# Calculate horizontal distance and restrict it
	var horizontal_distance = Vector2(obj.global_transform.origin.x, obj.global_transform.origin.z).distance_to(Vector2(hold_point.global_transform.origin.x, hold_point.global_transform.origin.z))
	if horizontal_distance > max_horizontal_distance:
		var direction = (obj.global_transform.origin - hold_point.global_transform.origin).normalized()
		new_position += direction * max_horizontal_distance

	# Ensure the object stays near the floor
	new_position.y = floor_y

	obj.global_transform.origin = new_position

	if obj is RigidBody3D:
		obj.linear_velocity = Vector3.ZERO  # Stop rigid body movement while holding
	
	# Adjust the scale based on the distance
	var distance = obj.global_transform.origin.distance_to(hold_point.global_transform.origin)
	var t = clamp((distance - min_distance) / (max_distance - min_distance), 1,1)
	obj.scale = original_scale.lerp(min_scale, t).lerp(min_scale, 1 - t)

func release_object():
	if obj != null:
		obj.scale = original_scale  # Restore the original scale of the object
		if obj is RigidBody3D:
			obj.linear_velocity = Vector3.ZERO  # Ensure the object stops moving when released
		obj = null  # Clear obj after releasing the object
