extends Node

class_name BT_Tree

var active: bool = true
@export var blackboard: Blackboard
var current_state: int = NodeState.IDLE

func tick(actor: Node) -> int:
	var response = NodeState.RUNNING
	for child in get_children():
		if child is BT_Node:
			child.set_current_state(child.tick(actor, blackboard))
	current_state = response
	return response
