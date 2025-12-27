local ok, renderer = pcall(require, "render-markdown")
if not ok then
	return
end

renderer.setup({})
