class_name Player extends CharacterBody2D

@onready var movement_state_machine: Node = $MovementStateMachine
@onready var move_control: Node = $MoveControl
@onready var animations: AnimatedSprite2D = $Animations

## MOVIMENTO

@export var run_speed: float = 48.0

@export var jump_height: float 
@export var jump_time_to_peak: float 
@export var jump_time_to_descent: float 

@onready var jump_velocity: float = (2.0 * jump_height) / jump_time_to_peak
@onready var jump_gravity: float = (-2.0 * jump_height) / (jump_time_to_peak * jump_time_to_peak)
@onready var fall_gravity: float = (-2.0 * jump_height) / (jump_time_to_descent * jump_time_to_descent)


func _ready() -> void:
	movement_state_machine.init(self, animations, move_control)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("move_left"):
		animations.flip_h = true
	elif Input.is_action_pressed("move_right"):
		animations.flip_h = false
	
	movement_state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	movement_state_machine.process_physics(delta)

func _process(delta: float) -> void:
	movement_state_machine.process_frame(delta)
