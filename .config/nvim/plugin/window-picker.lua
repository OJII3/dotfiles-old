local status, window_picker = pcall(require, "window-picker")
if not status then
	return
end

window_picker.setup({
	filter_rules = {
		include_current_win = false,
		auto_select_one = true,
	},
})

