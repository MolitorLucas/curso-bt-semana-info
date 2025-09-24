@abstract
class_name BT_ActionNode extends BT_Node

var _last_result: int = NodeState.IDLE
signal task_completed

@abstract
func execute(_actor: Node, _blackboard: Blackboard) -> int

func _ready() -> void:
	connect("task_completed", Callable(self, "_on_task_completed"))

func _on_task_completed() -> void:
	_last_result = NodeState.IDLE

func tick(_actor: Node, _blackboard: Resource) -> int:
	execute(_actor,_blackboard)
	return _last_result
