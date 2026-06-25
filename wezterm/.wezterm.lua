-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

local retro_green = {
    bg = '#6d8240',
    bg_alt = '#61743a',
    fg = '#071005',
    fg_bright = '#eff2d6',
    fg_dim = '#516429',
    green = '#223712',
    green_bright = '#314d1d',
    amber = '#533d16',
    amber_bright = '#6a4b19',
    red = '#5e231d',
    red_bright = '#7a3026',
    blue = '#173f3b',
    blue_bright = '#215650',
    purple = '#3e2846',
    purple_bright = '#563660',
    cyan = '#164739',
    cyan_bright = '#23664e',
    selection = '#87965d'
}

local get_retro_green_colors = function()
    return {
        foreground = retro_green.fg,
        background = retro_green.bg,
        cursor_bg = retro_green.fg,
        cursor_fg = retro_green.bg,
        cursor_border = retro_green.fg,
        selection_fg = retro_green.fg,
        selection_bg = retro_green.selection,
        scrollbar_thumb = retro_green.fg_dim,
        split = retro_green.bg_alt,
        ansi = {
            retro_green.bg,
            retro_green.red,
            retro_green.green,
            retro_green.amber,
            retro_green.blue,
            retro_green.purple,
            retro_green.cyan,
            retro_green.fg
        },
        brights = {
            retro_green.fg_dim,
            retro_green.red_bright,
            retro_green.green_bright,
            retro_green.amber_bright,
            retro_green.blue_bright,
            retro_green.purple_bright,
            retro_green.cyan_bright,
            retro_green.fg_bright
        },
        tab_bar = {
            background = retro_green.bg_alt,
            active_tab = {bg_color = retro_green.bg, fg_color = retro_green.fg},
            inactive_tab = {
                bg_color = retro_green.bg_alt,
                fg_color = retro_green.fg_dim
            },
            inactive_tab_hover = {
                bg_color = retro_green.selection,
                fg_color = retro_green.fg
            },
            new_tab = {bg_color = retro_green.bg_alt, fg_color = retro_green.green},
            new_tab_hover = {
                bg_color = retro_green.selection,
                fg_color = retro_green.green_bright,
                italic = true
            }
        }
    }
end

local acme_colors = {
    bg = '#ffffd7',
    bg_alt = '#eaffff',
    bg_dim = '#eeee9e',
    fg = '#111111',
    fg_soft = '#3f3f36',
    comment = '#6f705f',
    selection = '#eeee9e',
    red = '#8c1f04',
    red_bright = '#b83b1d',
    green = '#356f0d',
    green_bright = '#478c04',
    amber = '#7a6200',
    amber_bright = '#9a7b00',
    blue = '#0b67b3',
    blue_bright = '#1b7fcf',
    accent = '#0b67b3',
    purple = '#7b3f8c',
    purple_bright = '#9857a8',
    cyan = '#26777a',
    cyan_bright = '#2f9296'
}

local get_acme_colors = function()
    return {
        foreground = acme_colors.fg,
        background = acme_colors.bg,
        cursor_bg = acme_colors.fg,
        cursor_fg = acme_colors.bg,
        cursor_border = acme_colors.fg,
        selection_fg = acme_colors.fg,
        selection_bg = acme_colors.selection,
        scrollbar_thumb = acme_colors.comment,
        split = acme_colors.comment,
        ansi = {
            acme_colors.bg,
            acme_colors.red,
            acme_colors.green,
            acme_colors.amber,
            acme_colors.blue,
            acme_colors.purple,
            acme_colors.cyan,
            acme_colors.fg
        },
        brights = {
            acme_colors.comment,
            acme_colors.red_bright,
            acme_colors.green_bright,
            acme_colors.amber_bright,
            acme_colors.blue_bright,
            acme_colors.purple_bright,
            acme_colors.cyan_bright,
            '#ffffff'
        },
        tab_bar = {
            background = acme_colors.bg_alt,
            active_tab = {bg_color = acme_colors.accent, fg_color = acme_colors.bg},
            inactive_tab = {
                bg_color = acme_colors.bg_alt,
                fg_color = acme_colors.comment
            },
            inactive_tab_hover = {
                bg_color = acme_colors.selection,
                fg_color = acme_colors.fg
            },
            new_tab = {bg_color = acme_colors.bg_alt, fg_color = acme_colors.accent},
            new_tab_hover = {
                bg_color = acme_colors.selection,
                fg_color = acme_colors.blue_bright,
                italic = true
            }
        }
    }
end

-- This table will hold the configuration.
local config = {
    colors = get_acme_colors(),
    color_scheme = nil,
    -- colors = get_retro_green_colors(),
    -- color_scheme = 'Gruvbox dark, soft (base16)',
    -- color_scheme = 'Everforest Dark Hard (Gogh)',
    -- color_scheme = 'nordfox',
    -- color_scheme = 'Kanagawa (Gogh)',
    -- color_scheme = 'rose-pine-moon',
    -- color_scheme = 'rose-pine-dawn',
    -- wezterm ls-fonts --list-system
    -- font=wezterm.font "Miracode",
    -- font=wezterm.font "DejaVu Sans Mono for Powerline",
    -- font=wezterm.font "Anonymous Pro for Powerline",
    -- font=wezterm.font "Source Code Pro for Powerline",
    -- font=wezterm.font "Consolas",
    -- font = wezterm.font({
        -- family = 'Source Code Pro for Powerline',
        -- family = 'Anonymous Pro for Powerline',
        -- family = 'DejaVu Sans Mono for Powerline',
        -- family = 'Fira Code',
        -- weight = 'DemiLight', -- Can be 'Thin', 'ExtraLight', 'Light', 'DemiLight', 'Regular', 'Medium', 'DemiBold', 'Bold', 'ExtraBold', 'Black'
    -- }),
    -- line_height = 1.1,
    keys = {
        -- general stuff here
        {key = 'l', mods = 'ALT', action = wezterm.action.ShowLauncher}, -- like a command pallet
        -- windows and tab configurations ====================================================== 
        {
            key = 'v',
            mods = 'CTRL|SHIFT',
            action = act.SplitHorizontal {domain = 'CurrentPaneDomain'}
        }, -- 
        {
            key = 'h',
            mods = 'CTRL|SHIFT',
            action = act.SplitVertical {domain = 'CurrentPaneDomain'}
        }, --
        {
            key = 'RightArrow',
            mods = 'SUPER|SHIFT',
            action = act.ActivateTabRelative(1)
        }, --
        {
            key = 'LeftArrow',
            mods = 'SUPER|SHIFT',
            action = act.ActivateTabRelative(-1)
        }, -- 
        -- workspace configurations ============================================================
        {
            key = 'y',
            mods = 'CTRL|SHIFT',
            action = act.SwitchToWorkspace {name = 'default'}
        }, --
        {key = 'i', mods = 'CTRL|SHIFT', action = act.SwitchToWorkspace}, --
        {
            key = '9',
            mods = 'ALT',
            action = act.ShowLauncherArgs {flags = 'FUZZY|WORKSPACES'}
        } -- 
        -- example on how to spawn a custom workspace with a command
        -- {
        --     key = 'u',
        --     mods = 'CTRL|SHIFT',
        --     action = act.SwitchToWorkspace {
        --         name = 'monitoring',
        --         spawn = {args = {'top'}}
        --     }
        -- } --
    }
}

-- and finally, return the configuration to wezterm
return config
