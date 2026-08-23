extends CharacterBody3D


var gravity = -9.8
var move_speed = 5
var look_sensitivity = 0.005


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	var input = Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var dir = transform.basis * Vector3(input.x, 0, input.y)
	velocity.x = dir.x * move_speed
	velocity.z = dir.z * move_speed
	
	move_and_slide()


func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * look_sensitivity)
		$Camera3D.rotate_x(-event.relative.y * look_sensitivity)
		$Camera3D.rotation.x = clampf($Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))
