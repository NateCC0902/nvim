local opts = {
  highlight_hovered_item = true,
  show_guides = true,
  auto_preview = false,
  position = 'right',
  relative_width = true,
  width = 25,
  auto_close = false,
  show_numbers = false,
  show_relative_numbers = false,
  show_symbol_details = true,
  preview_bg_highlight = 'Pmenu',
  autofold_depth = nil,
  auto_unfold_hover = true,
  fold_markers = { '', '' },
  wrap = false,
  keymaps = { -- These keymaps can be a string or a table for multiple keys
    close = {"<Esc>", "q"},
    goto_location = "<Cr>",
    focus_location = "o",
    hover_symbol = "<S-space>",
    toggle_preview = "K",
    rename_symbol = "r",
    code_actions = "a",
    fold = {"za", "h"},
    unfold = {"zs","l"},
    fold_all = "W",
    unfold_all = "E",
    fold_reset = "R",
  },
  lsp_blacklist = {},
  symbol_blacklist = {},
 symbols = {
	File = {hl = "@text.uri" },
	Module = {hl = "@namespace" },
	Namespace = {hl = "@namespace" },
	Package = {hl = "@namespace" },
	Class = {hl = "@type" },
	Method = {hl = "@method" },
	Property = {hl = "@method" },
	Field = {hl = "@field" },
	Constructor = {hl = "@constructor" },
	Enum = {hl = "@type" },
	Interface = {hl = "@type" },
	Function = {hl = "@function" },
	Variable = {hl = "@constant" },
	Constant = {hl = "@constant" },
	String = {hl = "@string" },
	Number = {hl = "@number" },
	Boolean = {hl = "@boolean" },
	Array = {hl = "@constant" },
	Object = {hl = "@type" },
	Key = {hl = "@type" },
	Null = {hl = "@type" },
	EnumMember = {hl = "@field" },
	Struct = {hl = "@type" },
	Event = {hl = "@type" },
	Operator = {hl = "@operator" },
	TypeParameter = {hl = "@parameter" },
},}

require("symbols-outline").setup(opts)

