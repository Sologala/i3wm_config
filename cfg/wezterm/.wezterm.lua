local wezterm = require 'wezterm'
local act = wezterm.action
return {
    -- use_ime = false,
    initial_rows = 40,
    initial_cols = 150,
    window_decorations = "RESIZE",
    window_close_confirmation = 'NeverPrompt',
    window_padding = {
        left = 0,
        right = 0,
        top = 0,
        bottom = 0,
    },
    hide_tab_bar_if_only_one_tab = true,
    adjust_window_size_when_changing_font_size = false,
    window_frame = {
        inactive_titlebar_bg = '#353535',
        active_titlebar_bg = '#2b2042',
        inactive_titlebar_fg = '#cccccc',
        active_titlebar_fg = '#ffffff',
        inactive_titlebar_border_bottom = '#2b2042',
        active_titlebar_border_bottom = '#2b2042',
        button_fg = '#cccccc',
        button_bg = '#2b2042',
        button_hover_fg = '#ffffff',
        button_hover_bg = '#3b3052',
    },
    font = wezterm.font_with_fallback({
        "JetBrains Mono",
        { family = "Microsoft YaHei" }
    })
}
