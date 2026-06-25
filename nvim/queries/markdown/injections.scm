; Work around Neovim 0.12.x ranged markdown parses with nvim-treesitter.
; nvim-treesitter's markdown query currently routes fenced-code languages
; through #set-lang-from-info-string!, whose Lua directive receives a capture
; list on 0.12.x and can crash when a caller parses a range.  Use Neovim's
; native @injection.language capture instead.
(fenced_code_block
  (info_string
    (language) @injection.language)
  (code_fence_content) @injection.content)

((html_block) @injection.content
  (#set! injection.language "html")
  (#set! injection.combined)
  (#set! injection.include-children))

((minus_metadata) @injection.content
  (#set! injection.language "yaml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

((plus_metadata) @injection.content
  (#set! injection.language "toml")
  (#offset! @injection.content 1 0 -1 0)
  (#set! injection.include-children))

([
  (inline)
  (pipe_table_cell)
] @injection.content
  (#set! injection.language "markdown_inline"))
