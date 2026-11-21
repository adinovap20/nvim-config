-- Enable configured language servers
vim.lsp.enable('lua_ls')
vim.lsp.enable('zig_ls')
vim.lsp.enable('html_ls')
vim.lsp.enable('css_ls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('c_ls')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end

    -- Buffer-local keymaps for LSP features
    local opts = { buffer = ev.buf }

    -- Navigation & Inspection
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, vim.tbl_extend('force', opts, { desc = 'Go to definition' }))
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, vim.tbl_extend('force', opts, { desc = 'Find references' }))
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, vim.tbl_extend('force', opts, { desc = 'Go to implementation' }))
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, vim.tbl_extend('force', opts, { desc = 'Show hover documentation' }))

    -- Refactoring & Actions
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, vim.tbl_extend('force', opts, { desc = 'Rename symbol' }))
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, vim.tbl_extend('force', opts, { desc = 'Code action' }))

    -- Diagnostics Navigation
    vim.keymap.set('n', '[d', function()
        vim.diagnostic.jump({count=1, float=true})
    end, vim.tbl_extend('force', opts, { desc = 'Previous diagnostic' }))
    vim.keymap.set('n', ']d', function()
        vim.diagnostic.jump({count=-1, float=true})
    end, vim.tbl_extend('force', opts, { desc = 'Next diagnostic' }))
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, vim.tbl_extend('force', opts, { desc = 'Show line diagnostic popup' }))
  end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { "*.zig", "*.zon", "*.cpp", "*.c", "*.h", "*.hpp" },
  callback = function(_)
    vim.lsp.buf.format()
  end
})

-- Configure native popup menu behaviour
vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'popup'}
vim.o.pummaxwidth = 35

vim.diagnostic.config({
  virtual_text = false, -- Turn off standard inline text if it feels cluttered
  virtual_lines = {
    current_line = true, -- Only show full error lines on the current cursor line (keeps code clean)
    -- Set to `true` instead of a table if you want errors displayed on ALL lines simultaneously
  },
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})
