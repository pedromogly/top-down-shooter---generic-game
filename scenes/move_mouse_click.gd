extends Polygon2D

var moving = false
var mouse_location:Vector2
var speed = 300.0

func _process(delta: float) -> void:

	if Input.is_action_just_pressed("shoot"):
		mouse_location = get_global_mouse_position()
		moving = true
	
	if moving:
		go_to_click_position(delta)

func go_to_click_position(delta):
	var direction = mouse_location - global_position
	var distance = direction.length()
	
	var angleToCursor = direction.angle()
	rotation = lerp_angle(rotation,angleToCursor,0.05)
	
	if distance <= 0.1:
		global_position = mouse_location
		moving = false
		return
	global_position += direction.normalized() * speed * delta
