local lsp = require('lsp-zero')
lsp.preset('lsp-compe')

lsp.setup()
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = false,
  float = true,
})
lsp.set_preferences({
  suggest_lsp_servers = true,
  setup_servers_on_start = true,
  set_lsp_keymaps = true,
  configure_diagnostics = true,
  cmp_capabilities = true,
  manage_nvim_cmp = true,
  call_servers = 'local',
  sign_icons = {
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = ''
  }
})

vim.opt.completeopt = {'menu', 'menuone', 'noselect'}

local cmp = require('cmp')

local cmp_config = lsp.defaults.cmp_config({
    --window = {completion = cmp.config.window.bordered()}

    window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
      border = 'rounded',
    },
  },
    sources = {
        {name = "buffer"},
        {name = "path"},
    },
    mapping = {
        ["<tab>"] = cmp.mapping.select_next_item(),
    },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. (strings[1] or "") .. " "
      kind.menu = "    (" .. (strings[2] or "") .. ")"

      return kind
    end,
  },

})


--
--lsp.setup_nvim_cmp({
--  formatting = {
--    -- changing the order of fields so the icon is the first
--    fields = {'menu', 'abbr', 'kind'},
--
--    -- here is where the change happens
--    format = function(entry, item)
--      local menu_icon = {
--        nvim_lsp = 'λ',
--        luasnip = '⋗',
--        buffer = 'Ω',
--        path = ' ',
--        nvim_lua = 'Π',
--      }
--
--      item.menu = menu_icon[entry.source.name]
--      return item
--    end,
--  },
--})

local kind_highlights = {
 PmenuSel = { bg = "#282C34", fg = "NONE" },
  Pmenu = { fg = "#C5CDD9", bg = "#22252A" },

  CmpItemAbbrDeprecated = { fg = "#7E8294", bg = "NONE", fmt = "strikethrough" },
  CmpItemAbbrMatch = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  CmpItemAbbrMatchFuzzy = { fg = "#82AAFF", bg = "NONE", fmt = "bold" },
  CmpItemMenu = { fg = "#C792EA", bg = "NONE", fmt = "italic" },

  CmpItemKindField = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindProperty = { fg = "#EED8DA", bg = "#B5585F" },
  CmpItemKindEvent = { fg = "#EED8DA", bg = "#B5585F" },

  CmpItemKindText = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindEnum = { fg = "#C3E88D", bg = "#9FBD73" },
  CmpItemKindKeyword = { fg = "#C3E88D", bg = "#9FBD73" },

  CmpItemKindConstant = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindConstructor = { fg = "#FFE082", bg = "#D4BB6C" },
  CmpItemKindReference = { fg = "#FFE082", bg = "#D4BB6C" },

  CmpItemKindFunction = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindStruct = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindClass = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindModule = { fg = "#EADFF0", bg = "#A377BF" },
  CmpItemKindOperator = { fg = "#EADFF0", bg = "#A377BF" },

  CmpItemKindVariable = { fg = "#C5CDD9", bg = "#7E8294" },
  CmpItemKindFile = { fg = "#C5CDD9", bg = "#7E8294" },

  CmpItemKindUnit = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindSnippet = { fg = "#F5EBD9", bg = "#D4A959" },
  CmpItemKindFolder = { fg = "#F5EBD9", bg = "#D4A959" },

  CmpItemKindMethod = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindValue = { fg = "#DDE5F5", bg = "#6C8ED4" },
  CmpItemKindEnumMember = { fg = "#DDE5F5", bg = "#6C8ED4" },

  CmpItemKindInterface = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindColor = { fg = "#D8EEEB", bg = "#58B5A8" },
  CmpItemKindTypeParameter = { fg = "#D8EEEB", bg = "#58B5A8" },
}

for k, v in pairs(kind_highlights) do
  vim.cmd(string.format("hi %s guibg=%s guifg=%s", k, v.bg, v.fg) .. (v.fmt and ("gui=" .. v.fmt) or ""))
end

cmp.setup(cmp_config)
