class_name Run extends State


@export var idle_state: State
@export var jump_state: State
@export var fall_state: State


func process_input(event: InputEvent) -> State:
	if get_jump() and parent.is_on_floor():
		return jump_state
	
	return null


func process_physics(delta) -> State:
	apply_gravity(delta)
	
	parent.velocity.x = parent.run_speed * get_movement_input()
	
	if get_movement_input() == 0.0:
		return idle_state
	
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	
	return null
