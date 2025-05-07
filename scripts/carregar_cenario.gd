extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		carregar_cena_async()
		
func carregar_cena_async():
	var path = "res://scenes/arena.tscn"
	var carregamento_id = ResourceLoader.load_threaded_request(path)
	print(carregamento_id)
	while ResourceLoader.load_threaded_get_status(path) != ResourceLoader.THREAD_LOAD_LOADED:
		await get_tree().process_frame
	print(carregamento_id)
	var cena = ResourceLoader.load_threaded_get(path)
	get_tree().root.add_child(cena.instantiate())
	queue_free()
