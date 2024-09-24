local wezterm = require("wezterm")
local projects = require("projects")

local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")

local config = wezterm.config_builder()

config.leader = { key = "a", mods = "CMD", timeout_milliseconds = 1000 }

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

config.color_scheme = "Tokyo Night"

config.font = wezterm.font({ family = "JetBrains Mono" })
config.font_size = 16

-- Slightly transparent and blurred background
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30
config.window_decorations = "RESIZE"

-- Tab bar

config.use_fancy_tab_bar = false
config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Bold" }),
	font_size = 11,
}

wezterm.on("update-status", function(window)
	local active_workspace = window:active_workspace()
	window:set_left_status(wezterm.format({
		{ Text = "  " },
		{ Text = wezterm.nerdfonts.oct_table .. "  " .. active_workspace },
		{ Text = " |" },
	}))
end)

-- Key map

config.keys = {
	{
		key = ",",
		mods = "SUPER",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = wezterm.home_dir,
			args = { "nvim", wezterm.config_file },
		}),
	},
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "q",
		mods = "LEADER",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "p",
		mods = "LEADER",
		-- Present in to our project picker
		action = projects.choose_project(),
	},
	{
		key = "f",
		mods = "LEADER",
		-- Present a list of existing workspaces
		action = wezterm.action.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }),
	},
	{ key = "s", mods = "LEADER", action = wezterm.action.ShowTabNavigator },
}

smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL",
		resize = "ALT",
	},
})

return config
