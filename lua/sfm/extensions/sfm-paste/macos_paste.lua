local Paste = require("sfm.extensions.sfm-paste.paste")

local MacOSPaste = {}

function MacOSPaste:_has_clipboard_img()
	local handle = io.popen("pngpaste -b 2>&1")
	if handle == nil then
		return false
	end

	local result = handle:read("*a")

	handle:close()

	-- check if the output is clipboard img
	return string.sub(result, 1, 9) == "iVBORw0KG" -- magic png number in base64
end

function MacOSPaste:_get_clipboard()
	local handle = io.popen("pbpaste")
	if handle == nil then
		return nil
	end

	local result = {}
	for output in handle:lines() do
		table.insert(result, output)
	end

	handle:close()

	if vim.tbl_isempty(result) then
		return nil
	end

	return result
end

function MacOSPaste:_get_paste_img_cmd()
	return "pngpaste '%s'"
end

function MacOSPaste.new()
	local self = setmetatable(Paste.new(), { __index = MacOSPaste })

	return self
end

function MacOSPaste:paste()
	Paste.paste(self)
end

return MacOSPaste
