extends CanvasLayer

signal restart

func _on_restart_button_pressed() -> void:
	emit_signal("restart")

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
