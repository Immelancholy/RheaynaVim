-- mini.base16 colorscheme configuration
return {
	"mini.base16",
	auto_enable = true,
	after = function(plugin)
		local json_path = os.getenv("HOME") .. "/.config/stylix/palette.json"
		local json_file = io.open(json_path, "r")
		local palette
		if not json_file then
			palette = {
				base00 = "#24283b",
				base01 = "#1f2335",
				base02 = "#292e42",
				base03 = "#565f89",
				base04 = "#a9b1d6",
				base05 = "#c0caf5",
				base06 = "#c0caf5",
				base07 = "#c0caf5",
				base08 = "#f7768e",
				base09 = "#ff9e64",
				base0A = "#e0af68",
				base0B = "#9ece6a",
				base0C = "#1abc9c",
				base0D = "#41a6b5",
				base0E = "#bb9af7",
				base0F = "#ff007c",
			}
		else
			local json_colors = vim.fn.json_decode(json_file:read("*a"))
			json_file:close()
			palette = vim.tbl_map(function(v)
				return "#" .. v
			end, json_colors)
		end
		require("mini.base16").setup({ palette = palette })
	end,
}
