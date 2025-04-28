local navic = require('nvim-navic')

navic.setup({
   lsp = {
      auto_attach = true,
   },
   highlight = true,
   depth_limit = 0,
})

require('lualine').setup({
   options = {
      section_separators = '',
      component_separators = '',
      disabled_filetypes = {
         -- statusline = {
         --    "dap-repl",
         --    "dapui_breakpoints",
         --    "dapui_console",
         --    "dapui_scopes",
         --    "dapui_watches",
         --    "dapui_stacks",
         -- },
         winbar = {
            "dap-repl",
            -- "dapui_breakpoints",
            -- "dapui_console",
            -- "dapui_scopes",
            -- "dapui_watches",
            -- "dapui_stacks",
         },
      },
   },
   tabline = {
      lualine_a = {{
         'buffers',
         -- show_filename_only = false,
         mode = 4,
         max_length = vim.o.columns,
         filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha',
            fugitive = 'Fugitive',
            ['harpoon-menu'] = 'Harpoon',
         },
      }},
   },
   inactive_winbar = {
     lualine_a = {},
     lualine_b = {{'filename', path = 1}},
     lualine_c = {},
     lualine_x = {},
     lualine_y = {},
     lualine_z = {}
   },
   winbar = {
      lualine_a = {},
      lualine_b = {{'filename', path = 1}},
      lualine_c = {
         'navic',
         color_correction = nil,
         navic_opts = nil,
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   },
   sections = {
      -- %= is some centering magic
      lualine_c = {'%=', {
         'filename',
         path = 1,
      }},
   },
   extensions = {
      'quickfix',
      'man',
      'fzf',
      'fugitive',
      'nvim-tree',
   },
})
local navic = require('nvim-navic')

navic.setup({
   lsp = {
      auto_attach = true,
   },
   highlight = true,
   depth_limit = 0,
})

require('lualine').setup({
   options = {
      section_separators = '',
      component_separators = '',
      disabled_filetypes = {
         -- statusline = {
         --    "dap-repl",
         --    "dapui_breakpoints",
         --    "dapui_console",
         --    "dapui_scopes",
         --    "dapui_watches",
         --    "dapui_stacks",
         -- },
         winbar = {
            "dap-repl",
            -- "dapui_breakpoints",
            -- "dapui_console",
            -- "dapui_scopes",
            -- "dapui_watches",
            -- "dapui_stacks",
         },
      },
   },
   tabline = {
      lualine_a = {{
         'buffers',
         -- show_filename_only = false,
         mode = 4,
         max_length = vim.o.columns,
         filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha',
            fugitive = 'Fugitive',
            ['harpoon-menu'] = 'Harpoon',
         },
      }},
   },
   inactive_winbar = {
     lualine_a = {},
     lualine_b = {{'filename', path = 1}},
     lualine_c = {},
     lualine_x = {},
     lualine_y = {},
     lualine_z = {}
   },
   winbar = {
      lualine_a = {},
      lualine_b = {{'filename', path = 1}},
      lualine_c = {
         'navic',
         color_correction = nil,
         navic_opts = nil,
      },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
   },
   sections = {
      -- %= is some centering magic
      lualine_c = {'%=', {
         'filename',
         path = 1,
      }},
   },
   extensions = {
      'quickfix',
      'man',
      'fzf',
      'fugitive',
      'nvim-tree',
   },
})
