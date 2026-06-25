vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.astro",
  callback = function()
    vim.bo.filetype = "astro"
  end,
})
