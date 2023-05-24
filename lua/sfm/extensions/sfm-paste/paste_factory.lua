local api = require("sfm.api")

local MacOSPaste = require("sfm.extensions.sfm-paste.macos_paste")

local PasteFactory = {}

--- Get the current OS of user
--- Reference: https://github.com/ekickx/clipboard-image.nvim/blob/main/lua/clipboard-image/utils.lua
---@return string
local function _get_os()
	if vim.fn.has("win32") == 1 then
		return "Windows"
	end

	local this_os = tostring(io.popen("uname"):read())
	if this_os == "Linux" and vim.fn.readfile("/proc/version")[1]:lower():match("microsoft") then
		this_os = "Wsl"
	end

	return this_os
end

function PasteFactory.get_paste()
	local os = _get_os()
	if os == "Darwin" then
		return MacOSPaste.new()
	end

	api.log.error("OS is not supported.")

	return nil
end

return PasteFactory
