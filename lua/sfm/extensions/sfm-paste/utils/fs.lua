local api = require("sfm.api")

local M = {}

--- create a file
---@param fpath string
---@return boolean
function M.touch(fpath)
	local dir = api.path.dirname(fpath)
	if not api.path.exists(dir) then
		-- create dir
		if not M.mkdir(dir) then
			return false
		end
	end

	local mode = 420
	local fd = vim.loop.fs_open(fpath, "w", mode)
	if not fd then
		return false
	end

	vim.loop.fs_close(fd)

	return true
end

--- create a directory
---@param fpath string
---@return boolean
function M.mkdir(fpath)
	local mode = 493
	local success = vim.loop.fs_mkdir(fpath, mode)

	if not success then
		local dirs = api.path.split(fpath)
		local processed = ""

		for _, dir in ipairs(dirs) do
			if dir ~= "" then
				local joined = api.path.join({ processed, dir })
				if processed == "" and api.path.path_separator == "\\" then
					joined = dir
				end

				if api.path.exists(joined) then
					if api.path.isfile(joined) then
						return false
					elseif api.path.isdir(joined) then
						processed = joined
					end
				else
					if vim.loop.fs_mkdir(joined, mode) then
						processed = joined
					else
						return false
					end
				end
			end
		end
	end

	return true
end

return M
