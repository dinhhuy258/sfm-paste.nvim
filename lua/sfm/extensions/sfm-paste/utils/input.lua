local M = {}

function M.prompt(msg, default, completion, on_confirm)
	vim.ui.input({ prompt = msg, default = default, completion = completion }, function(input)
		on_confirm(input)
	end)
end

function M.clear()
	vim.api.nvim_command("normal! :")
end

return M
