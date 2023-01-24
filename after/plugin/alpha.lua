-- originally authored by @AdamWhittingham

local alpha = require("alpha")
local plenary_path = require("plenary.path")
local dashboard = require("alpha.themes.dashboard")
local cdir = vim.fn.getcwd()
local if_nil = vim.F.if_nil

local nvim_web_devicons = {
	enabled = true,
	highlight = true,
}

local function get_extension(fn)
	local match = fn:match("^.+(%..+)$")
	local ext = ""
	if match ~= nil then
		ext = match:sub(2)
	end
	return ext
end

local function icon(fn)
	local nwd = require("nvim-web-devicons")
	local ext = get_extension(fn)
	return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
	short_fn = short_fn or fn
	local ico_txt
	local fb_hl = {}

	if nvim_web_devicons.enabled then
		local ico, hl = icon(fn)
		local hl_option_type = type(nvim_web_devicons.highlight)
		if hl_option_type == "boolean" then
			if hl and nvim_web_devicons.highlight then
				table.insert(fb_hl, { hl, 0, 3 })
			end
		end
		if hl_option_type == "string" then
			table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 3 })
		end
		ico_txt = ico .. "  "
	else
		ico_txt = ""
	end
	local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <CR>")
	local fn_start = short_fn:match(".*[/\\]")
	if fn_start ~= nil then
		table.insert(fb_hl, { "Comment", #ico_txt - 2, #fn_start + #ico_txt })
	end
	file_button_el.opts.hl = fb_hl
	return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
	ignore = function(path, ext)
		return (string.find(path, "COMMIT_EDITMSG")) or (vim.tbl_contains(default_mru_ignore, ext))
	end,
}

--- @param start number
--- @param cwd string optional
--- @param items_number number optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
	opts = opts or mru_opts
	items_number = if_nil(items_number, 15)

	local oldfiles = {}
	for _, v in pairs(vim.v.oldfiles) do
		if #oldfiles == items_number then
			break
		end
		local cwd_cond
		if not cwd then
			cwd_cond = true
		else
			cwd_cond = vim.startswith(v, cwd)
		end
		local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
		if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
			oldfiles[#oldfiles + 1] = v
		end
	end
	local target_width = 35

	local tbl = {}
	for i, fn in ipairs(oldfiles) do
		local short_fn
		if cwd then
			short_fn = vim.fn.fnamemodify(fn, ":.")
		else
			short_fn = vim.fn.fnamemodify(fn, ":~")
		end

		if #short_fn > target_width then
			short_fn = plenary_path.new(short_fn):shorten(1, { -2, -1 })
			if #short_fn > target_width then
				short_fn = plenary_path.new(short_fn):shorten(1, { -1 })
			end
		end

		local shortcut = tostring(i + start - 1)

		local file_button_el = file_button(fn, shortcut, short_fn)
		tbl[i] = file_button_el
	end
	return {
		type = "group",
		val = tbl,
		opts = {},
	}
end

local default_header = {
	type = "text",
	val = {
		-- [[███    ██ ███████  ██████  ██    ██ ██ ███    ███]],
		-- [[████   ██ ██      ██    ██ ██    ██ ██ ████  ████]],
		-- [[██ ██  ██ █████   ██    ██ ██    ██ ██ ██ ████ ██]],
		-- [[██  ██ ██ ██      ██    ██  ██  ██  ██ ██  ██  ██]],
		-- [[██   ████ ███████  ██████    ████   ██ ██      ██]],

		-- [[                               __                ]],
		-- [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
		-- [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
		-- [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
		-- [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
		-- [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
    
      [[                                              ___  ]],
      [[                                           ,o88888 ]],
      [[                                        ,o8888888' ]],
      [[                  ,:o:o:oooo.        ,8O88Pd8888"  ]],
      [[              ,.::.::o:ooooOoOoO. ,oO8O8Pd888'"    ]],
      [[            ,.:.::o:ooOoOoOO8O8OOo.8OOPd8O8O"      ]],
      [[           , ..:.::o:ooOoOOOO8OOOOo.FdO8O8"        ]],
      [[          , ..:.::o:ooOoOO8O888O8O,COCOO"          ]],
      [[         , . ..:.::o:ooOoOOOO8OOOOCOCO"            ]],
      [[          . ..:.::o:ooOoOoOO8O8OCCCC"o             ]],
      [[             . ..:.::o:ooooOoCoCCC"o:o             ]],
      [[             . ..:.::o:o:,cooooCo"oo:o:            ]],
      [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
      [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
      [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
      [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
      [[     ...:.'.:.::::"'    . . . . .'                 ]],
      [[    .. . ....:."' `   .  . . ''                    ]],
      [[  . . . ...."'                                     ]],
      [[  .. . ."'                                         ]],
      [[ .                                                 ]],
      [[                                                   ]],

	},
	opts = {
		position = "center",
		hl = "Type",
		-- wrap = "overflow";
	},
}

local section_mru = {
	type = "group",
	val = {
		{
			type = "text",
			val = "📸 Recent files",
			opts = {
				hl = "SpecialComment",
				shrink_margin = false,
				position = "center",
			},
		},
		{ type = "padding", val = 1 },
		{
			type = "group",
			val = function()
				return { mru(0, cdir) }
			end,
			opts = { shrink_margin = false },
		},
	},
}

local buttons = {
	type = "group",
	val = {
		{ type = "text", val = "🛠️Quick links", opts = { hl = "SpecialComment", position = "center" } },
		{ type = "padding", val = 1 },
		dashboard.button("a", "🎬  New file", "<cmd>ene<CR>"),
        dashboard.button("r", "💾  Recent ", "<cmd>Telescope oldfiles <CR>"),
        dashboard.button("ff", "🛰️  Find file", "<cmd>Telescope find_files<CR>"),
        dashboard.button("fg", "🐾  Live grep", "<cmd>Telescope live_grep<CR>"),

        dashboard.button("co", "🎨  Colorschemes", "<cmd> lua require'telescope.builtin'.colorscheme{} <CR>"),
		dashboard.button("q", "🚒  Quit", "<cmd>qa<CR>"),
	},
	position = "center",
}

local projects = {
    type = "group",
    val = {
        { type = "text", val = "🗂️ Projects", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        dashboard.button("pr", "🛸  Projects", "<cmd>e /Users/natesbiglaptop/IdeaProjects <CR>"),
        dashboard.button("ty", "🫐  Typescirpt", "<cmd>e /Users/natesbiglaptop/IdeaProjects/TypeScriptyPlayground <CR>"),
        dashboard.button("re", "⚛️   Typescirpt React", "<cmd>e /Users/natesbiglaptop/IdeaProjects/ReactPlayground/ts-app <CR>"),
        dashboard.button("cn", "⚙️   Configuration", "<cmd>e ~/.config/nvim/ <CR>"),

    },
    position = "center",
}

local config = {
	layout = {
		{ type = "padding", val = 2 },
		default_header,
        { type = "padding", val = 2 },
        projects,
		{ type = "padding", val = 2 },
		buttons,
        { type = "padding", val = 2 },
        section_mru,
	},
	opts = {
		margin = 5,
		setup = function()
			vim.cmd([[
            autocmd alpha_temp DirChanged * lua require('alpha').redraw()
            ]])
		end,
	},
}

alpha.setup(config)
