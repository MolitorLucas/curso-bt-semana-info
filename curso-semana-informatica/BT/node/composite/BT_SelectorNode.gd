class_name BT_SelectorNode extends BT_Node

const BT_Node = preload("res://BT/node/BT_Node.gd")

func tick(actor: Node, blackboard: Resource) -> int:
	for child in get_children():
		if child is BT_Node:
			child.set_current_state(child.tick(actor, blackboard))
			if child.get_current_state() == NodeState.SUCCESS:
				return NodeState.SUCCESS
			if child.get_current_state() == NodeState.RUNNING:
				return NodeState.RUNNING
	return NodeState.FAILURE