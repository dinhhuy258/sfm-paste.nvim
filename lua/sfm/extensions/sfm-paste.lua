local event = require("sfm.event")
local PasteFactory = require("sfm.extensions.sfm-paste.paste_factory")

local M = {}

function M.setup(sfm_explorer, opts)
	sfm_explorer:subscribe(event.ExplorerOpened, function(payload)
		local bufnr = payload["bufnr"]
		local options = { noremap = true, silent = true, nowait = true, buffer = bufnr }
		vim.keymap.set("n", "`", function()
			local paste = PasteFactory.get_paste()
			if paste == nil then
				return
			end

			paste:paste()

			-- local comamnd_response = io.popen("pbpaste")
			--    if comamnd_response == nil then
			--      vim.notify("NULL")
			--      return
			--    end

			-- local command_outputs = {}
			-- for output in comamnd_response:lines() do
			-- 	table.insert(command_outputs, output)
			-- end

			-- print(vim.inspect(command_outputs))
		end, options)
	end)
end

return M
