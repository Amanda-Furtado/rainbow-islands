class_name Idle extends State


@export var run_state: State
@export var jump_state: State
@export var fall_state: State


func enter() -> void:
	super()
	parent.velocity.x = 0


func process_input(event: InputEvent) -> State:
	if get_movement_input() != 0.0:
		return run_state
	
	if get_jump() and parent.is_on_floor():
		return jump_state
	
	return null


func process_physics(delta) -> State:
	apply_gravity(delta)
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	
	return null
