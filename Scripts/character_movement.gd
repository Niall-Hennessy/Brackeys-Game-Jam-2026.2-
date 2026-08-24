extends CharacterBody3D


var gravity = -9.8
var move_speed = 8
var sprint_speed = 18
var look_sensitivity = 0.005

var current_interactable:Node3D


func _physics_process(delta: float) -> void:
	var speed = sprint_speed if Input.is_action_pressed("sprint") else move_speed
	velocity.y += gravity * delta
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var dir = transform.basis * Vector3(input.x, 0, input.y).normalized()
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed
	
	move_and_slide()


func _input(event):
	# camera control with the mouse
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * look_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * look_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
	# interact button
	if event.is_action_pressed("interact") and current_interactable != null:
		print(current_interactable.name)
		current_interactable.interaction(current_interactable.get_parent())
		# passing the parent allows you to run all the possible interactions in one function


func _on_detection_area_entered(area: Area3D) -> void:
	# get whatever's in the interaction range
	var component = area.get_parent()
	if component == null:
		pass
	
	current_interactable = component
	
	# display the text once you know what you're looking at
	get_node("Camera3D/InteractLabel").visible = true


func _on_detection_area_area_exited(area: Area3D) -> void:
	get_node("Camera3D/InteractLabel").visible = false
	current_interactable = null
