extends Camera3D


func _ready() -> void:
	CameraManager.player_camera = self
