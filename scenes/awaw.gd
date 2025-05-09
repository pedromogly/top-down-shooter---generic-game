extends NavigationRegion2D

@onready var inimigo: PackedScene = preload("res://prefabs/macaco.tscn")
var go = true

func _ready() -> void:
	spawn_bruh()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func spawn_bruh():
	while go:
		await get_tree().create_timer(1.0).timeout
		var randomX = randf_range(0,1900)
		var randomY = randf_range(0,1000)
		
		var inimigoInstance = inimigo.instantiate()
		get_tree().current_scene.add_child(inimigoInstance)
		inimigoInstance.global_position = Vector2(randomX,randomY)
		
func stop_respawn():
	go = false
