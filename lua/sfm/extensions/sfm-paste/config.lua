local M = {
	opts = {},
}

local default_config = {
	mappings = {
		paste = { "<C-v>" },
	},
}

function M.setup(opts)
	M.opts = default_config

	if opts == nil then
		return
	end

	if opts.mappings ~= nil and opts.mappings.paste ~= nil then
		M.opts.mappings.paste = opts.mappings.paste
	end
end

return M
