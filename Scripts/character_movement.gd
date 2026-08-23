extends CharacterBody3D


var gravity = -9.8
var move_speed = 5
var look_sensitivity = 0.005

var current_opponent = 0


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	move_and_slide()


func _input(event):
	# camera control with the mouse
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * look_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * look_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
	# interact button
	if event.is_action_pressed("interact") and current_opponent != 0:
		EventBus.opponent_interacted.emit()


func _on_detection_area_entered(area: Area3D) -> void:
	# display the text
	get_node("Camera3D/InteractLabel").visible = true
	# get opponent number
	var parent = area.get_parent()
	if parent == null:
		pass
	if parent is Opponent:
		current_opponent = parent.number


func _on_detection_area_area_exited(area: Area3D) -> void:
	get_node("Camera3D/InteractLabel").visible = false
	current_opponent = 0
