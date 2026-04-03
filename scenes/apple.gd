extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
var played := false
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		System.apples += 1
		print("apples:", System.apples)
		audio_stream_player.play(0.1)
		if played == false:
			animated_sprite_2d.play("pickup")
			played = true
		await animated_sprite_2d.animation_finished
		self.queue_free()
		
