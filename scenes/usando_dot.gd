extends Polygon2D

@onready var inimigo = $"../Polygon2D"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse = get_global_mouse_position()
	var directionView = mouse - global_position
	var angle = directionView.angle()
	
	rotation = angle
