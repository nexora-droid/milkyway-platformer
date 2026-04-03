extends PathFollow2D

const speed = 30
var direction := 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta * direction
	if progress >= get_parent().curve.get_baked_length():
		progress = get_parent().curve.get_baked_length()
		direction = -1
	elif progress <= 0:
		progress = 0
		direction = 1
