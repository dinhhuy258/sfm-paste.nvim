local event = require("sfm.event")
local PasteFactory = require("sfm.extensions.sfm-paste.paste_factory")
local config = require("sfm.extensions.sfm-paste.config")

local paste = PasteFactory.get_paste()
local M = {}

function M.setup(sfm_explorer, opts)
	config.setup(opts)

	sfm_explorer:subscribe(event.ExplorerOpened, function(payload)
		local bufnr = payload["bufnr"]
		local options = { noremap = true, silent = true, nowait = true, buffer = bufnr }

		if type(config.opts.mappings.paste) == "table" then
			for _, key in pairs(config.opts.mappings.paste) do
				vim.keymap.set("n", key, function()
					if paste ~= nil then
						paste:paste()
					end
				end, options)
			end
		else
			vim.keymap.set("n", config.opts.mappings.paste, function()
				if paste ~= nil then
					paste:paste()
				end
			end, options)
		end
	end)
end

return M
