-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Plugin list with Lazy.nvim
require("lazy").setup({
  -- Telescope and its dependencies
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Treesitter setup
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- LSP configuration
  { "neovim/nvim-lspconfig" },

  -- Theme
  { "folke/tokyonight.nvim" },

  -- Commenting and other utilities
  { "tpope/vim-commentary" },
  { "nvim-lua/plenary.nvim" },
  { "wincent/ferret" },
  { "tpope/vim-repeat" },
  { "kylechui/nvim-surround" },
  { "tpope/vim-projectionist" },
  { "tpope/vim-eunuch" },
  { "tpope/vim-abolish" },
  { "tpope/vim-dispatch" },
  { "tpope/vim-unimpaired" },

  -- Git-related plugins
  { "tpope/vim-fugitive" },
  { "tpope/vim-rhubarb" },
  { "moll/vim-bbye" },
  { "ThePrimeagen/harpoon" },
  { "ThePrimeagen/git-worktree.nvim" },

  -- Alignment and matching utilities
  { "junegunn/vim-easy-align" },
  { "andymass/vim-matchup" },

  -- OSC52 for copy-paste
  { "ojroques/nvim-osc52" },

  -- Sideways and exchange
  { "AndrewRadev/sideways.vim" },
  { "tommcdo/vim-exchange" },
  { "farmergreg/vim-lastplace" },

  -- LSP configurations
  { "neovim/nvim-lspconfig" },
  { "lspcontainers/lspcontainers.nvim" },
  { "nvimdev/lspsaga.nvim" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },

  -- Status line and navigation
  { "nvim-lualine/lualine.nvim" },
  { "SmiteshP/nvim-navic" },

  -- Colorschemes
  { "navarasu/onedark.nvim" },

  -- Debugging and virtual text
  { "mfussenegger/nvim-dap" },
  { "theHamsta/nvim-dap-virtual-text" },
  { "rcarriga/nvim-dap-ui" },

  -- Miscellaneous plugins
  { "stevearc/dressing.nvim" },
  { "lukas-reineke/indent-blankline.nvim" },

  -- DAP extensions
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "Weissle/persistent-breakpoints.nvim",
    },
  },

  -- File explorer
  { "m00qek/baleia.nvim" },

  -- File management with oil.nvim
  { "stevearc/oil.nvim" },

  -- Diff viewer
  { "sindrets/diffview.nvim" },
})

require("oil").setup({})

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
