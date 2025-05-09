extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_event.connect(bora)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func bora(viewport, event, shape_idx):
	#is pergunta se event é um tipo de uma classe ou HERDA o tipo de uma classe
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("viado")
		queue_free()
