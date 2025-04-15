-- Bootstrap packer if it's not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Plugin list
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer manages itself

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use { 'neovim/nvim-lspconfig', commit = "v1.8.0" }

  -- Theme
  use 'folke/tokyonight.nvim'

   -- Packer can manage itself
   use 'wbthomason/packer.nvim'
   use 'tpope/vim-commentary'
   use 'nvim-lua/plenary.nvim'
   use 'wincent/ferret'
   use 'tpope/vim-repeat'
   -- use 'tpope/vim-surround'
   use 'kylechui/nvim-surround'
   use 'tpope/vim-projectionist'
   use 'tpope/vim-eunuch'
   use 'tpope/vim-abolish'
   use 'tpope/vim-dispatch'
   -- Pairs of handy pairs mappings
   -- Good for moving lines and such
   use 'tpope/vim-unimpaired'

   use 'tpope/vim-fugitive'
   -- Figutive extension for GitHub
   use 'tpope/vim-rhubarb'
   use 'moll/vim-bbye'
   use 'ThePrimeagen/harpoon'
   use 'ThePrimeagen/git-worktree.nvim'

   use 'junegunn/vim-easy-align'

   use 'andymass/vim-matchup'

   -- Copy text from anywhere
   use 'ojroques/nvim-osc52'

   use 'AndrewRadev/sideways.vim'
   use 'tommcdo/vim-exchange'
   use 'farmergreg/vim-lastplace'
   use 'neovim/nvim-lspconfig'
   use 'lspcontainers/lspcontainers.nvim'
   use 'nvimdev/lspsaga.nvim'
   use 'hrsh7th/cmp-nvim-lsp'
   use 'hrsh7th/cmp-buffer'
   use 'hrsh7th/cmp-path'
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/nvim-cmp'
   use 'hrsh7th/cmp-nvim-lsp-signature-help'

   -- use 'vim-airline/vim-airline'
   use 'nvim-lualine/lualine.nvim'
   use 'SmiteshP/nvim-navic'

   use 'navarasu/onedark.nvim'

   use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

   use 'mrshmllow/open-handlers.nvim'

   use 'mfussenegger/nvim-dap'
   use 'theHamsta/nvim-dap-virtual-text'
   use 'rcarriga/nvim-dap-ui'
   use 'stevearc/dressing.nvim'

   use 'lukas-reineke/indent-blankline.nvim'

   use { "mfussenegger/nvim-dap", requires = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "Weissle/persistent-breakpoints.nvim",
   } }

   use 'm00qek/baleia.nvim'

   use({
      'stevearc/oil.nvim',
      config = function()
         require('oil').setup({
            -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
            -- Set to false if you still want to use netrw.
               default_file_explorer = true,
            -- Id is automatically added at the beginning, and name at the end
            -- See :help oil-columns
            columns = {
               "icon",
               -- "permissions",
               -- "size",
               -- "mtime",
            },
            -- Buffer-local options to use for oil buffers
            buf_options = {
               buflisted = false,
               bufhidden = "hide",
            },
            -- Window-local options to use for oil buffers
            win_options = {
               wrap = false,
               signcolumn = "no",
               cursorcolumn = false,
               foldcolumn = "0",
               spell = false,
               list = false,
               conceallevel = 3,
               concealcursor = "nvic",
            },
            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = false,
            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = false,
            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            -- (:help prompt_save_on_select_new_entry)
            prompt_save_on_select_new_entry = true,
            -- Oil will automatically delete hidden buffers after this delay
            -- You can set the delay to false to disable cleanup entirely
            -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
            cleanup_delay_ms = 2000,
            lsp_file_methods = {
               -- Time to wait for LSP file operations to complete before skipping
               timeout_ms = 1000,
               -- Set to true to autosave buffers that are updated with LSP willRenameFiles
               -- Set to "unmodified" to only save unmodified buffers
               autosave_changes = false,
            },
            -- Constrain the cursor to the editable parts of the oil buffer
            -- Set to `false` to disable, or "name" to keep it on the file names
            constrain_cursor = "editable",
            -- Set to true to watch the filesystem for changes and reload oil
            experimental_watch_for_changes = false,
            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
               ["g?"] = "actions.show_help",
               ["<CR>"] = "actions.select",
               ["<C-s>"] = "actions.select_vsplit",
               ["<C-h>"] = "actions.select_split",
               ["<C-t>"] = "actions.select_tab",
               ["<C-p>"] = "actions.preview",
               ["<C-c>"] = "actions.close",
               ["<C-l>"] = "actions.refresh",
               ["-"] = "actions.parent",
               ["_"] = "actions.open_cwd",
               ["`"] = "actions.cd",
               ["~"] = "actions.tcd",
               ["gs"] = "actions.change_sort",
               ["gx"] = "actions.open_external",
               ["g."] = "actions.toggle_hidden",
               ["g\\"] = "actions.toggle_trash",
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = true,
            view_options = {
               -- Show files and directories that start with "."
               show_hidden = false,
               -- This function defines what is considered a "hidden" file
               is_hidden_file = function(name, _)
                  return vim.startswith(name, ".")
               end,
               -- This function defines what will never be shown, even when `show_hidden` is set
               is_always_hidden = function(_, _)
                  return false
               end,
               -- Sort file names in a more intuitive order for humans. Is less performant,
               -- so you may want to set to false if you work with large directories.
               natural_order = true,
               sort = {
                  -- sort order can be "asc" or "desc"
                  -- see :help oil-columns to see which columns are sortable
                  { "type", "asc" },
                  { "name", "asc" },
               },
            },
            -- Extra arguments to pass to SCP when moving/copying files over SSH
            extra_scp_args = {},
            -- EXPERIMENTAL support for performing file operations with git
            git = {
               -- Return true to automatically git add/mv/rm files
               add = function(_)
                  return false
               end,
               mv = function(_, _)
                  return false
               end,
               rm = function(_)
                  return false
               end,
            },
            -- Configuration for the floating window in oil.open_float
            float = {
               -- Padding around the floating window
               padding = 2,
               max_width = 0,
               max_height = 0,
               border = "rounded",
               win_options = {
                  winblend = 0,
               },
               -- This is the config that will be passed to nvim_open_win.
               -- Change values here to customize the layout
               override = function(conf)
                  return conf
               end,
            },
            -- Configuration for the actions floating preview window
            preview = {
               -- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
               -- min_width and max_width can be a single value or a list of mixed integer/float types.
               -- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
               max_width = 0.9,
               -- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
               min_width = { 40, 0.4 },
               -- optionally define an integer/float for the exact width of the preview window
               width = nil,
               -- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
               -- min_height and max_height can be a single value or a list of mixed integer/float types.
               -- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
               max_height = 0.9,
               -- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
               min_height = { 5, 0.1 },
               -- optionally define an integer/float for the exact height of the preview window
               height = nil,
               border = "rounded",
               win_options = {
                  winblend = 0,
               },
               -- Whether the preview window is automatically updated when the cursor is moved
               update_on_cursor_moved = true,
            },
            -- Configuration for the floating progress window
            progress = {
               max_width = 0.9,
               min_width = { 40, 0.4 },
               width = nil,
               max_height = { 10, 0.9 },
               min_height = { 5, 0.1 },
               height = nil,
               border = "rounded",
               minimized_border = "none",
               win_options = {
                  winblend = 0,
               },
            },
            -- Configuration for the floating SSH window
            ssh = {
               border = "rounded",
            },
            -- Configuration for the floating keymaps help window
            keymaps_help = {
               border = "rounded",
            },
         })
      end,
   })

   use 'sindrets/diffview.nvim'

  if packer_bootstrap then
    require('packer').sync()
  end
end)

vim.opt.winbar = ' '
vim.opt.laststatus = 3

vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Open new splits on the right, not the left
vim.opt.splitright = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars = { space = '·', tab = '│ ' }

vim.opt.inccommand = "split"

vim.opt.scrolloff = 10

vim.cmd.colorscheme("onedark")

vim.cmd('let mapleader = " "')

vim.opt.directory = os.getenv("HOME") .. "/.config/nvim/swap"
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')

vim.keymap.set('n', '<C-J>', '<C-W><C-J>', { remap = false })
vim.keymap.set('n', '<C-K>', '<C-W><C-K>', { remap = false })
vim.keymap.set('n', '<C-L>', '<C-W><C-L>', { remap = false })
vim.keymap.set('n', '<C-H>', '<C-W><C-H>', { remap = false })

vim.keymap.set('c', '<C-p>', '<Up>')
vim.keymap.set('c', '<C-n>', '<Down>')

-- Quickly move through quickfix list
vim.keymap.set('n', '<C-p>', '<cmd>cp<CR>zz')
vim.keymap.set('n', '<C-n>', '<cmd>cn<CR>zz')

vim.keymap.set('n', ',e', ':e <C-R>=expand("%:p:h") . "/" <CR>', { remap = false })

for i=1,999 do
   vim.keymap.set('n', i .. "b", ":b".. i .. "<CR>", { remap = false })
end

-- vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files hidden=true<cr>', { remap = false })
require('telescope').setup({
   defaults = {
      layout_strategy = "vertical",
      layout_config = {
         height = 0.95,
         width = 0.95,
         vertical = { width = 0.9 },
      },
   },
   pickers = {
      find_files = {
         -- Show hidden files but hide .git
         find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      },
   },
})
vim.keymap.set('n', '<leader>f', function() require('telescope.builtin').find_files() end, { remap = false })
vim.keymap.set('n', '<leader>s', '<cmd>:Git<cr>', { remap = false })

vim.cmd('filetype plugin on')
vim.cmd('filetype indent on')
vim.cmd('set autoindent')

local function set_tab(width)
   vim.opt.tabstop = width
   vim.opt.softtabstop = width
   vim.opt.shiftwidth = width
   vim.opt.expandtab = true
end

set_tab(2)
vim.api.nvim_create_user_command('SetTab', function(stuff)
   set_tab(tonumber(stuff.args))
end, { bang = true, nargs = 1 })

-- Always open help on the right
vim.api.nvim_create_autocmd("FileType", {
   pattern = { "help" },
   command = "wincmd L",
})

-- Always open quickfix along the bottom
vim.api.nvim_create_autocmd("FileType", {
   pattern = { "qf" },
   command = "wincmd J",
})

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { remap = false, silent = true })
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', { remap = false, silent = true })
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { remap = false, silent = true })
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { remap = false, silent = true })
vim.keymap.set('n', 'gs', ':Lspsaga signature_help<CR>', { remap = false, silent = true })
-- LSP config (the mappings used in the default file don't quite work right)
-- nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
-- nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
-- nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
-- nnoremap ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
-- nnoremap [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
-- inoremap <silent> (

-- Sane buffer delete with bbye
vim.keymap.set('n', '<leader>q', ':Bdelete<CR>', { remap = false })

-- Projectionist alternative file
-- vim.keymap.set('n', '<leader>a', ':A<CR>', { remap = false })

-- Clear highlighting
vim.keymap.set('n', '<leader>\\ ', ':nohl', { remap = false })
vim.keymap.set('n', '<leader>/', ':nohl<CR>', { remap = false })


vim.keymap.set('v', '<leader>p', '"_dP', { remap = false })
vim.keymap.set('n', '<leader>y', '"+y', { remap = false })
vim.keymap.set('v', '<leader>y', '"+y', { remap = false })

-- Make Y behave like D and C (until the end of the line)
vim.keymap.set('n', 'Y', 'y$', { remap = false })

-- Empty line but don't delete it
vim.keymap.set('n', '<leader>dd', '0D', { remap = false })

function WriteOrphanedFile()
   vim.cmd("silent call mkdir(expand('%:p:h'), 'p')")
   vim.cmd('w')
end
vim.api.nvim_create_user_command('WriteOrphanedFile', WriteOrphanedFile, { bang = true })

vim.api.nvim_create_autocmd("TextYankPost", {
   pattern = { "*" },
   callback = function()
      require('vim.highlight').on_yank({ higroup = 'IncSearch', timeout = 300 })

      if vim.v.event.regname == '+' then
         require('osc52').copy_register('+')
      end
   end,
})

local alternate_file = function()
   local file = vim.api.nvim_buf_get_name(0)
   if file:ends_with('.h') or file:ends_with('H.txt') then
      local candidate, _ = file:gsub('.h$', '.cpp'):gsub('H.txt$', 'Cpp.txt')
      if 1 == vim.fn.filereadable(candidate) then
         vim.cmd('e ' .. candidate)
         return
      end
      local basename = vim.fs.basename(candidate)
      local dirname = vim.fs.dirname(candidate)
      dirname = vim.fs.dirname(dirname)
      candidate = vim.fs.joinpath(dirname, 'Source', basename)
      if 1 == vim.fn.filereadable(candidate) then
         vim.cmd('e ' .. candidate)
         return
      end
   end

   if file:ends_with('.cpp') or file:ends_with('Cpp.txt') then
      local candidate, _ = file:gsub('.cpp$', '.h'):gsub('Cpp.txt$', 'H.txt')
      if 1 == vim.fn.filereadable(candidate) then
         vim.cmd('e ' .. candidate)
         return
      end
      local basename = vim.fs.basename(candidate)
      local dirname = vim.fs.dirname(candidate)
      dirname = vim.fs.dirname(dirname)
      candidate = vim.fs.joinpath(dirname, 'Include', basename)
      if 1 == vim.fn.filereadable(candidate) then
         vim.cmd('e ' .. candidate)
         return
      end
      candidate = vim.fs.joinpath(dirname, '_Interface', basename)
      if 1 == vim.fn.filereadable(candidate) then
         vim.cmd('e ' .. candidate)
         return
      end
   end

   if file:ends_with('.py') then
      local basename = vim.fs.basename(file)
      local dirname = vim.fs.dirname(file)
       if basename:starts_with('test_') then
          local candidate = vim.fs.joinpath(dirname, basename:gsub('test_', ''))
          if 1 == vim.fn.filereadable(candidate) then
             vim.cmd('e ' .. candidate)
             return
          end
       else
          local candidate = vim.fs.joinpath(dirname, 'test_' .. basename)
          if 1 == vim.fn.filereadable(candidate) then
             vim.cmd('e ' .. candidate)
             return
          end
       end
   end

   print('Could not find alternate file for `' .. file .. '`.')
end

vim.keymap.set('n', '<leader>a', alternate_file, { remap = false })

local get_selection = function()
   if vim.fn.mode() == 'n' then
      vim.cmd('normal! gv')
   end
   local a_save = vim.fn.getreg('a')
   vim.cmd('normal! "aygv')
   local a = vim.fn.getreg('a')
   vim.fn.setreg('a', a_save)
   return a
end

local yank_buf_name = function(pattern)
   local bufname = vim.fn.expand(pattern)
   require('osc52').copy(bufname)
end
vim.api.nvim_create_user_command('YankBufName', function() yank_buf_name('%') end, { bang = true })
vim.api.nvim_create_user_command('YankBasename', function() yank_buf_name('%:t') end, { bang = true })
vim.keymap.set('n', '<leader>yb', function() yank_buf_name('%:t') end)
vim.keymap.set('n', '<leader>yf', function() yank_buf_name('%:p') end)
vim.keymap.set('n', '<leader>yr', function()
   require('osc52').copy(string.gsub(vim.fn.expand('%:p'), vim.fn.getcwd() .. '/', ''))
end)

vim.api.nvim_create_autocmd("FileType", {
   pattern = { "fugitive" },
   callback = function()
      vim.opt.spell = true
   end,
})

vim.opt.spell = false


-- Indent blank line
require('ibl').setup()

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- Try to get comments to not appear when doing o
vim.cmd([[set formatoptions-=cro]])

-- Try to stop wrapping comments
vim.cmd([[set formatoptions-=t]])

vim.opt.conceallevel = 0

vim.keymap.set("n", "ga", "<Plug>(EasyAlign)")
vim.keymap.set("v", "ga", "<Plug>(EasyAlign)")

vim.g.easy_align_delimiters = {
   -- Doxygen trailing comments
   d = {
      pattern = [[//!<]],
   },
}
