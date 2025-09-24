@abstract
class_name BT_ActionNode extends BT_Node


var _is_active: bool = false
var _last_result: int = NodeState.IDLE
signal task_completed(result)

func pre_execute(_actor: Node, _blackboard: Blackboard) -> void:
	if(_last_result != NodeState.RUNNING):
		_is_active = true
		var thread = Thread.new()
		thread.start(func(): task_completed.emit(execute(_actor, _blackboard)))

@abstract
func execute(_actor: Node, _blackboard: Blackboard) -> NodeState

func _ready() -> void:
	connect("task_completed", Callable(self, "_on_task_completed"))

func _on_task_completed(result) -> void:
	_last_result = result

func tick(_actor: Node, _blackboard: Resource) -> int:
	pre_execute(_actor, _blackboard)
	if not _is_active:
		return NodeState.IDLE
	return _last_result
