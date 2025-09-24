
class_name Blackboard extends Resource
@export var data: Dictionary = {}

func _get(key: StringName) -> Variant:
	return get_value(key)

func _set(key: StringName, value: Variant) -> bool:
	set_value(key, value)
	return true

func set_value(key: StringName, value: Variant) -> void:
	if data.has(key):
		data[key] = value
	else:
		data[key] = value

func get_value(key: StringName) -> Variant:
	if data.has(key):
		return data[key]
	return ""

func has_key(key: StringName) -> bool:
	return data.has(key)

func remove_key(key: StringName) -> void:
	data.erase(key)