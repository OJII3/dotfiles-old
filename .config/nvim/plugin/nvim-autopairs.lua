local status, nvim_auto_pairs = pcall(require, "nvim-autopairs")
if not status then
	return
end

nvim_auto_pairs.setup({
	map_c_h = true,
	map_c_w = true,
})
