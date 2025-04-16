class_name State extends Node

@onready var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

@export var animation_name: String

var animations: AnimatedSprite2D
var move_control
var parent: CharacterBody2D

var gravity_scale: float = 1.0
var time_in_air: float = 0.0

func enter() -> void:
	animations.play(animation_name)

func exit() -> void:
	pass

func process_input(event: InputEvent) -> State:
	return null

func process_frame(delta: float) -> State:
	return null

func process_physics(delta: float) -> State:
	return null

func get_movement_input() -> float:
	return move_control.get_movement_direction()

func get_jump() -> bool:
	return move_control.wants_jump()

func get_half_jump() -> bool:
	return move_control.wants_half_jump()

func apply_gravity(delta: float):
	parent.velocity.y += gravity * gravity_scale * delta

func apply_jump_gravity(delta: float):
	parent.velocity.y += parent.jump_gravity * delta

func apply_fall_gravity(delta: float):
	parent.velocity.y += parent.fall_gravity * delta
