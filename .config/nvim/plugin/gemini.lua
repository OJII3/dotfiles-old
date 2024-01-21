local status, gemini = pcall(require, "ai")
if not status then
	return
end

gemini.setup({
	api_key = SECRET_GEMINI_API_KEY,
	locale = "en",
	alternate_locale = "ja",
	prompts = {},
})
