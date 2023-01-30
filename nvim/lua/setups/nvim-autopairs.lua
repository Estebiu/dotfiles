require("nvim-autopairs").setup{
	ignored_next_char = "[%w%.]", -- will ignore alphanumeric and `.` symbol
	enable_check_bracket_line = false,
	fast_wrap = {
	end_key = "e"
	},
}
