@abstract
class_name BT_ActionNode extends BT_Node


var _is_active: bool = false
var _last_result: int = NodeState.IDLE
var _current_task: Thread
signal task_completed(result)

@abstract
func execute(_actor: Node, _blackboard: Blackboard) -> NodeState

func _ready() -> void:
	connect("task_completed", Callable(self, "_on_task_completed"))

func _on_task_completed(result) -> void:
	_last_result = result

func tick(_actor: Node, _blackboard: Resource) -> int:
	if(_last_result != NodeState.RUNNING):
		_is_active = true
		_current_task = Thread.new()
		_current_task.start(execute.bind(_actor, _blackboard))
	return _last_result
