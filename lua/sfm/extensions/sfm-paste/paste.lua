local api = require("sfm.api")
local input = require("sfm.extensions.sfm-paste.utils.input")
local fs = require("sfm.extensions.sfm-paste.utils.fs")

local Paste = {}

function Paste.new()
	local self = setmetatable({}, { __index = Paste })

	return self
end

function Paste:_get_clipboard()
	-- this function should be implemented in the derived classes
end

function Paste:paste()
	local clipboard_content = self:_get_clipboard()
	if clipboard_content ~= nil then
		local entry = api.entry.current()
		if (not entry.is_dir or not entry.is_open) and not entry.is_root then
			entry = entry.parent
		end

		input.prompt("Create file ", api.path.add_trailing(entry.path), "file", function(fpath)
			input.clear()
			if fpath == nil or fpath == "" then
				return
			end

			if api.path.exists(fpath) then
				api.log.warn(fpath .. " already exists")

				return
			end

			-- create a file
			local ok = fs.touch(fpath)
			if not ok then
				api.log.error("Creation of file " .. fpath .. " failed due to an error.")

				return
			end

			-- write data to file
			vim.fn.writefile(clipboard_content, fpath)
		end)
	end
end

return Paste
