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
         vim.fn["UltiSnips#Anon"](args.body)
      end,
   },
   mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
         i = cmp.mapping.abort(),
         c = cmp.mapping.close(),
      }),
      -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
   },
   sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'ultisnips' },
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


local cmdline_sources = cmp.config.sources({
}, {
   { name = 'cmdline' },
}, {
   { name = 'path' },
})

cmp.setup.cmdline(':', {
   mapping = {
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
      ['/'] = cmp.mapping(function(fallback)
         line = vim.fn.getcmdline()
         i = vim.fn.getcmdpos()
         print(line)
         -- Determine if it's a substitution or global expression
         -- In this case, double slash is normal bacause it means the previously searched thing
         is_search = line:find('%%?[sg]') ~= nil or line:find("'<,'>[sg]") ~= nil
         if #line == i - 1 and line:endswith('/') and not is_search then
            cmp.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }, function()
               vim.defer_fn(cmp.complete, 1)
            end)
         else
            fallback()
         end
      end, { 'i', 'c' }),
   },
   sources = cmdline_sources,
})
