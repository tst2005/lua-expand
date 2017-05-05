
-- pass a list of item and got a list of iterator
local function generate(line)
	local tot = 1 -- total
	local function iter(P, cur)
		return function(gen)
			local cycle=tot/cur/#P
			--print("tot", tot, "cur", cur, "#P", #P)
			--print("cycle=", cycle)
			return math.floor((gen-1)/cycle) % #P +1
		end
	end
	local genline = {}
	for i, p in ipairs(line) do
		if #p == 0 then error("empty element?!") end
		-- for each steap tot is the current sub-total
		genline[i] = iter(p, tot)
		tot=tot*#p
	end
	local function get_gen_line_n(n)
		local r = {}
		for i, v in ipairs(genline) do
			r[i] = line[i][v(n)]
		end
		return r
	end
	return tot, get_gen_line_n
end

local line = {
	{"a1", "a2"},
	{"b1", "b2", "b3"},
	{"c1", "c2", "c3", "c4", "c5"},
}

local tprint = require"tprint"
tprint.list_sep=", "

local cfg = {}
function cfg.updater(t, lvl, cfg)
	if type(t) == "table" and lvl == 1 then
		cfg.inline = true
	else
		cfg.inline = false
	end
	return cfg
end
print(tprint(line, cfg))
print("----")

local tot,getgenline = generate(line)
for i=1,tot do
	print(i, require"tprint"(getgenline(i)))
end

