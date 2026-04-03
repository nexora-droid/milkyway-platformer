extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		System.in_fan = true
		print("in")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		System.in_fan = false
		print("out")
