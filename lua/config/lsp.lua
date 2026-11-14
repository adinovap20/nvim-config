-- Enable configured language servers
vim.lsp.enable('lua_ls')

-- Enable built-in LSP auto-completion on attach
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger=true})
        end
    end,
})

-- Configure native popup menu behaviour
vim.opt.completeopt = {'menu', 'menuone', 'noselect', 'popup'}
