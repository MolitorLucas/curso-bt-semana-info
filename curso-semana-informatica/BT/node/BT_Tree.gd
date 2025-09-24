extends Node

# Behavior Tree class
class_name BT_Tree

const NodeState = preload("res://BT/constants/NodeState.gd").NodeState
const BT_Node = preload("res://BT/node/BT_Node.gd")
const Blackboard = preload("res://BT/Blackboard.gd")

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