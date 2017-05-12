
local function loopgen(maxes)

	local function newiter(max)
		local i = 0 -- range is [0..max-1]
		return function(check)
			if check then
				return i>=max
			end
			i=i%max+1
			return i -- range is [1..max]
		end
	end
	local genline = {}
	for _i, max in ipairs(maxes) do
		genline[_i] = newiter(max)
	end
	return genline
end

return loopgen
