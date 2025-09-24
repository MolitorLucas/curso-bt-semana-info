extends BT_ActionNode


func execute(actor: Node, blackboard: Blackboard) -> int:
	if (actor is not Node2D):
		return NodeState.FAILURE
	var actor2d = actor as Node2D
	var target = actor2d.get_global_mouse_position()
	if(target.distance_to(actor2d.global_position) <= 50):
		return NodeState.SUCCESS
	var speed = blackboard.get_value("CharacterSpeed")
	var delta = actor2d.get_physics_process_delta_time()
	actor2d.global_position = actor2d.global_position.move_toward(target, speed * delta)
	return NodeState.RUNNING;
