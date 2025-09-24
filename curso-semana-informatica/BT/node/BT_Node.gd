class_name BT_Node extends Node

var is_active: bool = false
var _current_state: int = NodeState.IDLE

func get_current_state() -> int:
	return _current_state

func set_current_state(value: int) -> void:
	is_active = value != NodeState.RUNNING
	_current_state = value

func tick(_actor: Node, _blackboard: Blackboard) -> int:
	return NodeState.IDLE
