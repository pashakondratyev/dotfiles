require("lualine").setup({
	options = {
		theme = "gruvbox-material",
		component_separators = "",
		section_separators = "",
	},
	sections = {
		lualine_c = {
			{
				"filetype",
				icon_only = true,
			},
			{
				"filename",
				file_status = false,
				path = 1,
			},
		},
	},
})
