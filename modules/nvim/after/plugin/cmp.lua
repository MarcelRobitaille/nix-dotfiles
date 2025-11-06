function string:contains(sub)
    return self:find(sub, 1, true) ~= nil
end

function string:startswith(start)
    return self:sub(1, #start) == start
end

function string:endswith(ending)
    return ending == "" or self:sub(-#ending) == ending
end

local cmp = require'cmp'
-- local lspkind = require'lspkind'

cmp.setup({
   preselect = cmp.PreselectMode.None,
   snippet = {
      expand = function(args)
         -- Only complete up to the first < or (. I find it annoying to have the snippets style tabbing through
         -- different items. Often, I just want the class name to call something static with ::, not the constructor,
         -- or I want to pass a function, not call it!
         vim.snippet.expand(args.body:gsub("[<(].*", ''))
      end,
   },
   mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),

      -- `cmp.SelectBehavior.Select` necessary to not confirm when selecting (happens sporatically, like if item
      -- contains parenthesis)
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),

      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<C-e>'] = cmp.mapping({
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
      }),
   },
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'path' },
      { name = 'calc' },
   }, {
      { name = 'buffer' },
   }),
   -- formatting = {
   --    format = lspkind.cmp_format(),
   -- }
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
   sources = {
      { name = 'buffer' },
   }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
   mapping = {
      ['<C-y>'] = cmp.mapping(cmp.mapping.confirm({ select = true }), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), { 'i', 'c' }),
   },
   sources = cmp.config.sources({
      { name = 'cmdline' },
   }, {
      { name = 'path' },
   }),
})
