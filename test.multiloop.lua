
local loop = require "multiloop"
local maxes = {1, 2, 3, 4, 5}

local g = loop(maxes)
for i=1,#g do
	local f = g[i]
	print("i="..i)
	print("before", "current", "curent is max")
	print("------", "-------", "-------------")
	for n=1,10 do
		print(f(true) and "max!" or "ok", f(), f(true) and "max!" or "ok")
	end
end
