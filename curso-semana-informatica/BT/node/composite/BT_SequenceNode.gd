extends BT_Node

# Sequence Node for Behavior Tree
class_name BT_SequenceNode

const BT_Node = preload("res://BT/node/BT_Node.gd")

func tick(actor: Node, blackboard: Resource) -> int:
	for child in get_children():
		if child is BT_Node:
			child.set_current_state(child.tick(actor, blackboard))
			if child.get_current_state() == NodeState.FAILURE:
				return NodeState.FAILURE
			if child.get_current_state() == NodeState.RUNNING:
				return NodeState.RUNNING
	return NodeState.SUCCESS