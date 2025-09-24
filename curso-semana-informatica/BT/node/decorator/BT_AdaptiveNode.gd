@abstract
class_name BT_AdaptiveNode extends BT_Node

@abstract
func before_adaptive_action(_actor: Node, _blackboard: Resource = null) -> void

@abstract
func after_adaptive_action(_actor: Node, _blackboard: Resource = null) -> void

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
