local Paste = {}

function Paste.new()
  local self = setmetatable({}, { __index = Paste })

  return self
end

function Paste:_get_clipboard()
  -- this function should be implemented in the derived classes
end

function Paste:paste()
  vim.notify(vim.inspect(self:_get_clipboard()))
end

return Paste
