local vim = vim

local M = {}

M.colors = {
    light = {
        bg = '#6d8240',
        bg_alt = '#61743a',
        bg_dim = '#566836',
        fg = '#071005',
        fg_bright = '#eff2d6',
        fg_soft = '#263514',
        comment = '#516429',
        green = '#223712',
        green_bright = '#314d1d',
        amber = '#533d16',
        amber_bright = '#6a4b19',
        red = '#5e231d',
        red_bright = '#7a3026',
        blue = '#173f3b',
        blue_bright = '#215650',
        purple = '#3e2846',
        cyan = '#164739',
        selection = '#87965d',
        cursor = '#071005',
        none = 'NONE'
    },
    dark = {
        bg = '#6d8240',
        bg_alt = '#61743a',
        bg_dim = '#566836',
        fg = '#071005',
        fg_bright = '#eff2d6',
        fg_soft = '#263514',
        comment = '#516429',
        green = '#223712',
        green_bright = '#314d1d',
        amber = '#533d16',
        amber_bright = '#6a4b19',
        red = '#5e231d',
        red_bright = '#7a3026',
        blue = '#173f3b',
        blue_bright = '#215650',
        purple = '#3e2846',
        cyan = '#164739',
        selection = '#87965d',
        cursor = '#071005',
        none = 'NONE'
    }
}

function M.get_colors()
    local background = vim.o.background or 'dark'
    return M.colors[background] or M.colors.dark
end

function M.get_highlights()
    local c = M.get_colors()

    return {
        Normal = {fg = c.fg, bg = c.bg},
        NormalNC = {fg = c.fg_soft, bg = c.bg},
        NormalFloat = {fg = c.fg, bg = c.bg_alt},
        FloatBorder = {fg = c.comment, bg = c.bg_alt},
        NonText = {fg = c.comment},
        EndOfBuffer = {fg = c.bg},
        Visual = {fg = c.fg, bg = c.selection},
        Search = {fg = c.bg, bg = c.amber_bright, bold = true},
        IncSearch = {fg = c.bg, bg = c.green_bright, bold = true},
        CurSearch = {fg = c.bg, bg = c.green_bright, bold = true},
        StatusLine = {fg = c.fg, bg = c.bg_alt},
        StatusLineNC = {fg = c.comment, bg = c.bg_dim},
        SignColumn = {fg = c.fg, bg = c.bg},
        WinSeparator = {fg = c.bg_alt, bg = c.bg},
        VertSplit = {fg = c.bg_alt, bg = c.bg},
        LineNr = {fg = c.comment, bg = c.bg},
        CursorLine = {bg = c.bg_alt},
        CursorLineNr = {fg = c.green_bright, bg = c.bg_alt, bold = true},
        CursorColumn = {bg = c.bg_alt},
        ColorColumn = {bg = c.bg_alt},
        Folded = {fg = c.comment, bg = c.bg_alt},
        FoldColumn = {fg = c.comment, bg = c.bg},
        MatchParen = {fg = c.amber_bright, bg = c.selection, bold = true},
        Conceal = {fg = c.comment},
        Directory = {fg = c.green_bright},
        MoreMsg = {fg = c.green_bright},
        ModeMsg = {fg = c.green_bright},
        Question = {fg = c.green_bright},
        Title = {fg = c.green_bright, bold = true},
        TabLine = {fg = c.comment, bg = c.bg_alt},
        TabLineSel = {fg = c.fg, bg = c.bg},
        TabLineFill = {bg = c.bg_alt},
        Pmenu = {fg = c.fg, bg = c.bg_alt},
        PmenuSel = {fg = c.bg, bg = c.green_bright},
        PmenuSbar = {bg = c.bg_alt},
        PmenuThumb = {bg = c.comment},
        WildMenu = {fg = c.bg, bg = c.green_bright},

        Comment = {fg = c.comment, italic = true},
        Constant = {fg = c.amber},
        String = {fg = c.green_bright},
        Character = {fg = c.green_bright},
        Number = {fg = c.amber},
        Boolean = {fg = c.amber_bright},
        Float = {fg = c.amber},
        Identifier = {fg = c.blue_bright},
        Function = {fg = c.green_bright},
        Statement = {fg = c.amber_bright, bold = true},
        Conditional = {fg = c.amber_bright, bold = true},
        Repeat = {fg = c.amber_bright, bold = true},
        Label = {fg = c.amber_bright},
        Operator = {fg = c.fg},
        Keyword = {fg = c.green_bright, bold = true},
        Exception = {fg = c.red_bright, bold = true},
        PreProc = {fg = c.cyan},
        Include = {fg = c.cyan},
        Define = {fg = c.cyan},
        Macro = {fg = c.cyan},
        Type = {fg = c.blue, bold = true},
        StorageClass = {fg = c.blue},
        Structure = {fg = c.blue},
        Typedef = {fg = c.blue},
        Special = {fg = c.purple},
        SpecialChar = {fg = c.purple},
        Tag = {fg = c.green},
        Delimiter = {fg = c.fg_soft},
        SpecialComment = {fg = c.comment, italic = true},
        Todo = {fg = c.bg, bg = c.amber_bright, bold = true},

        DiffAdd = {fg = c.green_bright, bg = c.bg_alt},
        DiffChange = {fg = c.amber, bg = c.bg_alt},
        DiffDelete = {fg = c.red, bg = c.bg_alt},
        DiffText = {fg = c.amber_bright, bg = c.selection, bold = true},
        Added = {fg = c.green_bright},
        Changed = {fg = c.amber},
        Removed = {fg = c.red},

        DiagnosticError = {fg = c.red_bright},
        DiagnosticWarn = {fg = c.amber_bright},
        DiagnosticInfo = {fg = c.blue_bright},
        DiagnosticHint = {fg = c.green_bright},
        DiagnosticUnderlineError = {undercurl = true, sp = c.red_bright},
        DiagnosticUnderlineWarn = {undercurl = true, sp = c.amber_bright},
        DiagnosticUnderlineInfo = {undercurl = true, sp = c.blue_bright},
        DiagnosticUnderlineHint = {undercurl = true, sp = c.green_bright},

        GitSignsAdd = {fg = c.green_bright},
        GitSignsChange = {fg = c.amber},
        GitSignsDelete = {fg = c.red},

        TelescopeNormal = {fg = c.fg, bg = c.bg},
        TelescopeBorder = {fg = c.comment, bg = c.bg},
        TelescopePromptNormal = {fg = c.fg, bg = c.bg_alt},
        TelescopePromptBorder = {fg = c.comment, bg = c.bg_alt},
        TelescopePromptTitle = {fg = c.bg, bg = c.green_bright},
        TelescopePreviewTitle = {fg = c.bg, bg = c.blue},
        TelescopeResultsTitle = {fg = c.bg, bg = c.amber},
        TelescopeSelection = {fg = c.fg, bg = c.selection},
        TelescopeMatching = {fg = c.green_bright, bold = true},

        ['@comment'] = {fg = c.comment, italic = true},
        ['@string'] = {fg = c.green_bright},
        ['@number'] = {fg = c.amber},
        ['@boolean'] = {fg = c.amber_bright},
        ['@function'] = {fg = c.green_bright},
        ['@function.call'] = {fg = c.green_bright},
        ['@method'] = {fg = c.green_bright},
        ['@keyword'] = {fg = c.amber_bright, bold = true},
        ['@keyword.function'] = {fg = c.amber_bright, bold = true},
        ['@operator'] = {fg = c.fg},
        ['@type'] = {fg = c.blue, bold = true},
        ['@variable'] = {fg = c.fg},
        ['@variable.builtin'] = {fg = c.purple},
        ['@property'] = {fg = c.blue_bright},
        ['@field'] = {fg = c.blue_bright},
        ['@constructor'] = {fg = c.cyan},
        ['@punctuation.delimiter'] = {fg = c.fg_soft},
        ['@punctuation.bracket'] = {fg = c.fg_soft}
    }
end

local function set_terminal_colors(c)
    vim.g.terminal_color_0 = c.bg
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.amber
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.purple
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.fg
    vim.g.terminal_color_8 = c.comment
    vim.g.terminal_color_9 = c.red_bright
    vim.g.terminal_color_10 = c.green_bright
    vim.g.terminal_color_11 = c.amber_bright
    vim.g.terminal_color_12 = c.blue_bright
    vim.g.terminal_color_13 = c.purple
    vim.g.terminal_color_14 = c.cyan
    vim.g.terminal_color_15 = c.fg_bright
end

function M.setup(opts)
    if opts then
        M.colors = vim.tbl_deep_extend("force", M.colors, opts.colors or {})
    end

    vim.cmd('highlight clear')
    if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end

    vim.g.colors_name = 'retro-green'

    local highlights = M.get_highlights()
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end

    local c = M.get_colors()
    set_terminal_colors(c)

    require('lualine').setup {
        options = {
            theme = {
                normal = {
                    a = {fg = c.bg, bg = c.green_bright, gui = 'bold'},
                    b = {fg = c.fg, bg = c.bg_alt},
                    c = {fg = c.fg_soft, bg = c.bg}
                },
                insert = {
                    a = {fg = c.bg, bg = c.blue_bright, gui = 'bold'},
                    b = {fg = c.fg, bg = c.bg_alt},
                    c = {fg = c.fg_soft, bg = c.bg}
                },
                visual = {
                    a = {fg = c.bg, bg = c.amber_bright, gui = 'bold'},
                    b = {fg = c.fg, bg = c.bg_alt},
                    c = {fg = c.fg_soft, bg = c.bg}
                },
                replace = {
                    a = {fg = c.bg, bg = c.red_bright, gui = 'bold'},
                    b = {fg = c.fg, bg = c.bg_alt},
                    c = {fg = c.fg_soft, bg = c.bg}
                },
                command = {
                    a = {fg = c.bg, bg = c.purple, gui = 'bold'},
                    b = {fg = c.fg, bg = c.bg_alt},
                    c = {fg = c.fg_soft, bg = c.bg}
                },
                inactive = {
                    a = {fg = c.comment, bg = c.bg_dim},
                    b = {fg = c.comment, bg = c.bg_dim},
                    c = {fg = c.comment, bg = c.bg}
                }
            }
        }
    }
end

return M
