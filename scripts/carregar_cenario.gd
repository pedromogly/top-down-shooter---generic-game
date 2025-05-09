extends Node2D

var a = Vector2(3,4)
var b = Vector2(4,3)

func _process(delta: float) -> void:
	#print(a.length())
	
	if Input.is_action_just_pressed("ui_accept"):
		carregar_cena_async()
		
func carregar_cena_async():
	var path = "res://scenes/arena.tscn"
	var carregamento_id = ResourceLoader.load_threaded_request(path)

	while ResourceLoader.load_threaded_get_status(path) != ResourceLoader.THREAD_LOAD_LOADED:
		await get_tree().process_frame

	var cena = ResourceLoader.load_threaded_get(path)
	get_tree().root.add_child(cena.instantiate())
	queue_free()
