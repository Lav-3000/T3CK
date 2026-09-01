#MIT License
#
#Copyright (c) 2026 Lav3000
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.

extends Resource
class_name T3CK


var _dict: Dictionary[String, String]


func add_kv(key: String, value: String) -> void:
	_dict[key] = value


func get_kv(key: String, default := "") -> String:
	if has_kv(key):
		return _dict[key]
	return default

func get_keys() -> PackedStringArray:
	return _dict.keys()

func has_kv(key: String) -> bool:
	return _dict.has(key)


func save_to(path: String) -> Error:
	var file = FileAccess.open(path, FileAccess.WRITE)
	var err := file.get_error()
	if err == OK:
		for i in _dict:
			file.store_pascal_string(i)
			file.store_pascal_string(_dict[i])
		file.close()
	return err


static func get_from(path: String) -> T3CK:
	var inst := T3CK.new()
	var file = FileAccess.open(path, FileAccess.READ)
	var err := file.get_error()
	if err != OK:
		return null
	while file.get_position() < file.get_length():
		inst.add_kv(file.get_pascal_string(), file.get_pascal_string())
	file.close()
	return inst
