
return {
    'neovim/nvim-lspconfig',
    ft = { 'lua', 'rust' },
    config = function()
        
        local lspconfig = require('lspconfig')
        local servers = { 'lua', 'rust' }

        for _, lang in ipairs(servers) do
            local ok, conf = pcall(require, 'config.plugins.lspconfig.' .. lang)
            if ok and conf.name then
                lspconfig[conf.name].setup(conf)
                vim.notify("Loaded lspconfig for lang (" .. lang .. ") with spec " .. vim.inspect(conf.settings), vim.log.levels.INFO)
            else
                vim.notify('Failed to load LSP config for ' .. lang, vim.log.levels.ERROR)
            end
        end

    end,
}
