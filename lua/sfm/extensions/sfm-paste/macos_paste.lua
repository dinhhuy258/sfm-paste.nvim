local Paste = require("sfm.extensions.sfm-paste.paste")

local MacOSPaste = {}

function MacOSPaste:_get_clipboard()
	local command_response = io.popen("pbpaste")
	if command_response == nil then
		return nil
	end

	local command_outputs = {}
	for output in command_response:lines() do
		table.insert(command_outputs, output)
	end

	if vim.tbl_isempty(command_outputs) then
		return nil
	end

	return command_outputs
end

function MacOSPaste.new()
	local self = setmetatable(Paste.new(), { __index = MacOSPaste })

	return self
end

function MacOSPaste:paste()
  Paste.paste(self)
end

return MacOSPaste
