class_name Jump extends State

@export var idle_state: State
@export var run_state: State
@export var fall_state: State

func enter() -> void:
	super()
	parent.velocity.y = -parent.jump_height

func process_physics(delta) -> State:
	apply_gravity(delta)
	print(parent.velocity.y)
	if parent.velocity.y > 0:
		return fall_state
	
	if Input.is_action_just_released("jump") and parent.velocity.y < -parent.jump_height * 0.5:
		parent.velocity.y = -parent.jump_height * 0.5
	
	parent.velocity.x =  parent.run_speed * get_movement_input()
	
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if get_movement_input() != 0:
			return run_state
		return idle_state
	
	return null
