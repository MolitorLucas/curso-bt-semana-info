extends BT_Node

# Inverter Node for Behavior Tree
class_name BT_InverterNode

const BT_Node = preload("res://BT/node/BT_Node.gd")

@export var child_node: BT_Node = null

func tick(actor: Node, blackboard: Resource) -> int:
	if child_node == null:
		return NodeState.FAILURE

	child_node.set_current_state(child_node.tick(actor, blackboard))
	if child_node.get_current_state() == NodeState.FAILURE:
		return NodeState.SUCCESS
	if child_node.get_current_state() == NodeState.SUCCESS:
		return NodeState.FAILURE
	return NodeState.RUNNING