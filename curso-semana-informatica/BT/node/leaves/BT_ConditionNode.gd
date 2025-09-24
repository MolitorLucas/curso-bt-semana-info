@abstract
class_name BT_ConditionNode extends BT_Node

@abstract
func check_condition(_actor: Node, _blackboard: Resource) -> bool

func tick(_actor: Node, _blackboard: Resource) -> int:
	return NodeState.SUCCESS if check_condition(_actor, _blackboard) else NodeState.FAILURE
