# T3CK
a file format i made.

T3CK stands for 'Thingy3000 Controlled Key-values', due to the fact it was made for a project I'm making called thingy3000. i later realized its useful in other contexts.

it uses pascal strings to work as key-value pairs.

copy `t3ck.gd` into any Godot project and keep the license to use it.

## Usage (in any script)

to save a t3ck:

```gdscript
var t3ck = T3CK.new()
t3ck.add_kv("key", "value")
t3ck.add_kv("key2", "value2")
t3ck.save_to("path/to/file.t3ck")
```

to load a t3ck:
```gdscript
var t3ck = T3CK.get_from("path/to/file.t3ck")
print(t3ck.get_kv("key")) #value
print(t3ck.get_kv("key2")) #value2
```
