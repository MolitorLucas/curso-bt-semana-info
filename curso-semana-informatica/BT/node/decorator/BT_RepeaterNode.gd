class_name BT_RepeaterNode extends BT_Node

@export var repeat_count: int = 1
var child_node: BT_Node = null

func _ready() -> void:
	child_node = get_child(0) if get_child_count() > 0 else null

func tick(actor: Node, blackboard: Blackboard) -> int:
	if child_node == null:
		return NodeState.FAILURE
	if repeat_count < 0:
		return NodeState.FAILURE

	var count = 0
	while count < repeat_count:
		child_node.set_current_state(child_node.tick(actor, blackboard))
		if child_node.get_current_state() == NodeState.SUCCESS:
			return NodeState.SUCCESS
		count += 1
	if child_node.get_current_state() == NodeState.RUNNING:
		return NodeState.RUNNING
	return NodeState.FAILURE
