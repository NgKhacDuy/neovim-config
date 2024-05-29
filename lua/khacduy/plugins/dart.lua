local status, dart = pcall(require, "flutter-tools")
if not status then
	return
end
dart.setup({
	ui = {
		border = "rounded",
		notification_style = "native",
	},
	closing_tags = {
		highlight = "ErrorMsg",
		prefix = "//",
		enabled = true,
	},
	widget_guides = {
		enabled = true,
	},
	root_patterns = { ".git", "pubspec.yaml" },
	lsp = {
		color = { -- show the derived colours for dart variables
			enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
			background = false, -- highlight the background
			background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
			foreground = false, -- highlight the foreground
			virtual_text = true, -- show the highlight using virtual text
			virtual_text_str = "■", -- the virtual text character to highlight
		},
		--- OR you can specify a function to deactivate or change or control how the config is created
		settings = {
			showTodos = true,
			completeFunctionCalls = true,
			renameFilesWithClasses = "prompt", -- "always"
			enableSnippets = true,
			updateImportsOnRename = true,
		},
		-- see the link below for details on each option:
		-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
	},
})
