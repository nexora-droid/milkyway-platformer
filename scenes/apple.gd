extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		System.apples += 1
		print("apples:", System.apples)
		animated_sprite_2d.play("pickup")
		await animated_sprite_2d.animation_finished
		self.queue_free()
		
