extends PathFollow2D
@onready var saw_sprite: AnimatedSprite2D = $Saw/SawSprite
const speed = 150
var direction := 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta * direction
	if progress >= get_parent().curve.get_baked_length():
		progress = get_parent().curve.get_baked_length()
		direction = -1
		saw_sprite.flip_h = true
	elif progress <= 0:
		progress = 0
		direction = 1
		saw_sprite.flip_h = false
	
