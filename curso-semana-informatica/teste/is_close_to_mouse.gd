extends BT_ConditionNode

func check_condition(actor: Node, blackboard: Blackboard) -> bool:
	if actor is not Node2D:
		return false
	var actor2d = actor as Node2D
	var mousePosition = actor2d.get_global_mouse_position()
	var distance = actor2d.global_position.distance_to(mousePosition)
	return distance <= blackboard.get_value("DistanceThreshold")
