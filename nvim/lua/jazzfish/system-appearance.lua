local vim = vim

local M = {}

local fallback_background = "light"
local timer

local function is_mac()
    return vim.fn.has("macunix") == 1
end

local function read_background()
    if not is_mac() or vim.fn.executable("defaults") ~= 1 then
        return nil
    end

    local output = vim.fn.system({"defaults", "read", "-g", "AppleInterfaceStyle"})
    if vim.v.shell_error == 0 and output:match("Dark") then
        return "dark"
    end

    return "light"
end

function M.current()
    return read_background()
end

function M.sync()
    local background = read_background() or fallback_background
    if vim.o.background ~= background then
        vim.o.background = background
    end

    return background
end

function M.setup()
    if not is_mac() then
        vim.o.background = fallback_background
        return
    end

    M.sync()

    local group = vim.api.nvim_create_augroup("JazzfishSystemAppearance",
                                              {clear = true})
    vim.api.nvim_create_autocmd({"FocusGained", "VimResume"}, {
        group = group,
        callback = M.sync
    })

    if timer then
        timer:stop()
        if not timer:is_closing() then timer:close() end
    end

    local uv = vim.uv or vim.loop
    timer = uv.new_timer()
    timer:start(1000, 3000, vim.schedule_wrap(M.sync))

    vim.api.nvim_create_autocmd("VimLeavePre", {
        group = group,
        once = true,
        callback = function()
            if not timer then return end
            timer:stop()
            if not timer:is_closing() then timer:close() end
            timer = nil
        end
    })
end

return M
