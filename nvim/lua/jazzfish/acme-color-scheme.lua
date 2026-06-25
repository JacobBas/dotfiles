local vim = vim

local M = {}

M.colors = {
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

function M.get_colors()
    return M.colors
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
        Search = {fg = c.fg, bg = c.bg_dim, bold = true},
        IncSearch = {fg = c.bg, bg = c.amber_bright, bold = true},
        CurSearch = {fg = c.bg, bg = c.amber_bright, bold = true},
        StatusLine = {fg = c.fg, bg = c.bg_alt},
        StatusLineNC = {fg = c.comment, bg = c.bg_dim},
        SignColumn = {fg = c.fg, bg = c.bg},
        WinSeparator = {fg = c.comment, bg = c.bg},
        VertSplit = {fg = c.comment, bg = c.bg},
        LineNr = {fg = c.comment, bg = c.bg},
        CursorLine = {bg = c.bg_alt},
        CursorLineNr = {fg = c.accent, bg = c.bg_alt, bold = true},
        CursorColumn = {bg = c.bg_alt},
        ColorColumn = {bg = c.bg_alt},
        Folded = {fg = c.comment, bg = c.bg_alt},
        FoldColumn = {fg = c.comment, bg = c.bg},
        MatchParen = {fg = c.fg, bg = c.selection, bold = true},
        Conceal = {fg = c.comment},
        Directory = {fg = c.accent, bold = true},
        MoreMsg = {fg = c.green},
        ModeMsg = {fg = c.accent},
        Question = {fg = c.green},
        Title = {fg = c.accent, bold = true},
        TabLine = {fg = c.comment, bg = c.bg_alt},
        TabLineSel = {fg = c.fg, bg = c.bg},
        TabLineFill = {bg = c.bg_alt},

        Pmenu = {fg = c.fg, bg = c.bg_alt},
        PmenuSel = {fg = c.bg, bg = c.accent},
        PmenuSbar = {bg = c.bg_alt},
        PmenuThumb = {bg = c.comment},
        WildMenu = {fg = c.bg, bg = c.accent},

        Comment = {fg = c.comment, italic = true},
        Constant = {fg = c.amber},
        String = {fg = c.accent},
        Character = {fg = c.accent},
        Number = {fg = c.amber},
        Boolean = {fg = c.amber_bright, bold = true},
        Float = {fg = c.amber},
        Identifier = {fg = c.fg},
        Function = {fg = c.accent, bold = true},
        Statement = {fg = c.green, bold = true},
        Conditional = {fg = c.green, bold = true},
        Repeat = {fg = c.green, bold = true},
        Label = {fg = c.green},
        Operator = {fg = c.fg},
        Keyword = {fg = c.green, bold = true},
        Exception = {fg = c.red, bold = true},
        PreProc = {fg = c.red},
        Include = {fg = c.red},
        Define = {fg = c.red},
        Macro = {fg = c.red},
        Type = {fg = c.purple, bold = true},
        StorageClass = {fg = c.purple},
        Structure = {fg = c.purple},
        Typedef = {fg = c.purple},
        Special = {fg = c.cyan},
        SpecialChar = {fg = c.cyan},
        Tag = {fg = c.accent},
        Delimiter = {fg = c.fg_soft},
        SpecialComment = {fg = c.comment, italic = true},
        Todo = {fg = c.bg, bg = c.amber_bright, bold = true},

        DiffAdd = {fg = c.green, bg = c.bg_alt},
        DiffChange = {fg = c.amber, bg = c.bg_alt},
        DiffDelete = {fg = c.red, bg = c.bg_alt},
        DiffText = {fg = c.amber_bright, bg = c.selection, bold = true},
        Added = {fg = c.green},
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

        GitSignsAdd = {fg = c.green},
        GitSignsChange = {fg = c.amber},
        GitSignsDelete = {fg = c.red},

        TelescopeNormal = {fg = c.fg, bg = c.bg},
        TelescopeBorder = {fg = c.comment, bg = c.bg},
        TelescopePromptNormal = {fg = c.fg, bg = c.bg_alt},
        TelescopePromptBorder = {fg = c.comment, bg = c.bg_alt},
        TelescopePromptTitle = {fg = c.bg, bg = c.accent},
        TelescopePreviewTitle = {fg = c.bg, bg = c.green},
        TelescopeResultsTitle = {fg = c.bg, bg = c.amber},
        TelescopeSelection = {fg = c.fg, bg = c.selection},
        TelescopeMatching = {fg = c.accent, bold = true},

        ['@comment'] = {fg = c.comment, italic = true},
        ['@string'] = {fg = c.accent},
        ['@number'] = {fg = c.amber},
        ['@boolean'] = {fg = c.amber_bright, bold = true},
        ['@function'] = {fg = c.accent, bold = true},
        ['@function.call'] = {fg = c.accent},
        ['@method'] = {fg = c.accent},
        ['@keyword'] = {fg = c.green, bold = true},
        ['@keyword.function'] = {fg = c.green, bold = true},
        ['@operator'] = {fg = c.fg},
        ['@type'] = {fg = c.purple, bold = true},
        ['@variable'] = {fg = c.fg},
        ['@variable.builtin'] = {fg = c.red},
        ['@property'] = {fg = c.cyan},
        ['@field'] = {fg = c.cyan},
        ['@constructor'] = {fg = c.purple},
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
    vim.g.terminal_color_13 = c.purple_bright
    vim.g.terminal_color_14 = c.cyan_bright
    vim.g.terminal_color_15 = c.fg
end

function M.setup(opts)
    if opts then
        M.colors = vim.tbl_deep_extend("force", M.colors, opts.colors or {})
    end

    if vim.o.background ~= 'light' then vim.o.background = 'light' end

    vim.cmd('highlight clear')
    if vim.fn.exists('syntax_on') then vim.cmd('syntax reset') end

    vim.g.colors_name = 'acme'

    local highlights = M.get_highlights()
    for group, settings in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, settings)
    end

    local c = M.get_colors()
    set_terminal_colors(c)

    local function active_lualine_section()
        return {
            a = {fg = c.bg, bg = c.accent, gui = 'bold'},
            b = {fg = c.fg, bg = c.bg_alt},
            c = {fg = c.fg_soft, bg = c.bg}
        }
    end

    require('lualine').setup {
        options = {
            theme = {
                normal = active_lualine_section(),
                insert = active_lualine_section(),
                visual = active_lualine_section(),
                replace = active_lualine_section(),
                command = active_lualine_section(),
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
