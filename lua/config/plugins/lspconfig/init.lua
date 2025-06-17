return function()

    local supported_languages = { 'lua', 'rust' };
    
    return {
        'neovim/nvim-lspconfig',
        ft = supported_languages,
        config = function()
            
            local lspconfig = require('lspconfig')
            local servers = supported_languages
            
            for -, lang in ipairs(servers) do
                local ok, conf = pcall(require, 'config.plugins.lspconfig.' .. lang)
                if ok and conf.name then
                    lspconfig[conf.name].setup(conf)
                else
                    vim.notify('Failed to load LSP config for ' .. lang, vim.log.levels.ERROR)
                end
            end

        end,
    }
end
