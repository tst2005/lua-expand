
I want to expand ...

## Sample 1

```lua
input = {
	{"a", {"b1", "b2"}, "c"},
}
```

expanded to

```lua
output = {
	{"a", "b1", "c"},
	{"a", "b2", "c"},
}
```

## Sample 2

```lua
input = {
	{"a", {"b1", "b2"}, {"c1", "c2"}, "d"},
}
```

expanded to

```lua
output = {
	{"a", "b1", "c1", "d"},
	{"a", "b1", "c2", "d"},
	{"a", "b2", "c1", "d"},
	{"a", "b2", "c2", "d"},
}
```
## Sample 3

```lua
input = {
	{ "a", {"b1", "b2"}, {"c1", "c2"}, "d"},
	{ {"x1", "x2"}, "y", {"z1", "z2"}},
}
```

expanded to 

```lua
output = {
	{"a", "b1", "c1", "d", },
	{"a", "b1", "c2", "d", },
	{"a", "b2", "c1", "d", },
	{"a", "b2", "c2", "d", },
	{"x1", "y", "z1", },
	{"x1", "y", "z2", },
	{"x2", "y", "z1", },
	{"x2", "y", "z2", },
}
```
