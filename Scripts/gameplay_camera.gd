extends Camera3D


func _ready() -> void:
	CameraManager.gameplay_camera = self
