extends CharacterBody2D
class_name Player

@export var bullet_scene:PackedScene
var can_shoot: bool = true
var shoot_cooldown:float = 0.2

var move_speed := 300.0
var move_direction := Vector2.ZERO

func _physics_process(delta: float) -> void:
	move_direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = move_direction * move_speed
	
	var mouse_direction = get_global_mouse_position() - global_position
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot(mouse_direction)
	
	move_and_slide()

func shoot(direction):
	can_shoot = false
	
	var bullet_instance = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet_instance)
	bullet_instance.global_position = global_position
	bullet_instance.set_direction(direction)
	
	#contador instanciado com o await
	await get_tree().create_timer(shoot_cooldown).timeout
	can_shoot = true
