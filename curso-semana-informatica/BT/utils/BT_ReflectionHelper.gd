class_name BT_ReflectionHelper extends Node

func insert_subtree_below(root: BT_Node, new_subtree: BT_Node) -> void:
	root.add_child(new_subtree)

func insert_subtree_above(child: BT_Node, new_subtree: BT_Node) -> BT_Node:
	var root: BT_Tree = child.get_parent()
	root.remove_child(child)
	root.add_child(new_subtree)
	new_subtree.add_child(child)
	return new_subtree

func remove_subtree(root: BT_Tree, subtree_to_remove: BT_Node) -> void:
	if root.has_node(subtree_to_remove.get_path()):
		root.remove_child(subtree_to_remove)
		subtree_to_remove.queue_free()

func remove_subtree_from_node(root: BT_Node, subtree_to_remove: BT_Node) -> void:
	if root.has_node(subtree_to_remove.get_path()):
		root.remove_child(subtree_to_remove)
		subtree_to_remove.queue_free()
