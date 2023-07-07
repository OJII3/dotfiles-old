local status, toggleterm = pcall(require, "toggleterm.terminal")
if not status then
	return
end

local Terminal = toggleterm.Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function Lazygit_toggle()
	lazygit:toggle()
end
