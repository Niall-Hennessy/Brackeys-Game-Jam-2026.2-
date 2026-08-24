extends CharacterBody3D


var gravity = -9.8
var move_speed = 8
var sprint_speed = 18
var look_sensitivity = 0.005

var current_opponent = 0
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
		if current_interactable.get_node_or_null("OpponentComponent") != null:
			var opponent_number = current_interactable.get_node("OpponentComponent").number
			EventBus.opponent_interacted.emit(opponent_number)
		elif current_interactable.get_node_or_null("InteractableComponent") != null:
			EventBus.object_interacted.emit()





func _on_detection_area_entered(area: Area3D) -> void:
	# get opponent number
	var parent = area.get_parent()
	if parent == null:
		pass
	
	current_interactable = parent
		
	# display the text once you know what you're looking at
	get_node("Camera3D/InteractLabel").visible = true


@warning_ignore("unused_parameter")
func _on_detection_area_area_exited(area: Area3D) -> void:
	get_node("Camera3D/InteractLabel").visible = false
	current_interactable = null
