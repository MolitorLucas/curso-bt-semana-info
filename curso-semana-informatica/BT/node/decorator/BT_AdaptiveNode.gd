extends BT_Node

# Adaptive Node for Behavior Tree
class_name BT_AdaptiveNode

const BT_Node = preload("res://BT/node/BT_Node.gd")

func before_adaptive_action(_actor: Node, _blackboard: Resource = null) -> void:
	print("Before Adaptive method not implemented in %s" % self.name)

func after_adaptive_action(_actor: Node, _blackboard: Resource = null) -> void:
	print("After Adaptive method not implemented in %s" % self.name)

func tick(actor: Node, blackboard: Resource = null) -> int:
	if get_child_count() == 0:
		return NodeState.FAILURE
	if get_child_count() > 1:
		return NodeState.FAILURE

	var child = get_child(0)
	if child is BT_Node:
		if not child.is_active:
			before_adaptive_action(actor, blackboard)
		var child_state = child.tick(actor, blackboard)
		child.set_current_state(child_state)
		if child_state != NodeState.RUNNING:
			after_adaptive_action(actor, blackboard)
		return child_state
	return NodeState.SUCCESS