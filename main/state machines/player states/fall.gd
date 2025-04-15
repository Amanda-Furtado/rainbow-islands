class_name Fall extends State

@export var idle_state: State
@export var run_state: State

func enter():
	super()
	gravity_scale = 1.5


func exit():
	gravity_scale = 1.0


func process_physics(delta: float) -> State:
	apply_gravity(delta)

	parent.velocity.x = get_movement_input() * parent.run_speed
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if get_movement_input() != 0:
			return run_state
		return idle_state
	return null
