-- 
-- Plugin management
--

-- Every plugin will be stored in its own directory, and every directory will
-- contain a single init.lua file, that will contain the config options for 
-- that specific modile. This file will simply find these and load them, but
-- each plugin will be neatly contained in its own folder

local plugins = {}
local plugin_basepath = vim.fn.stdpath("config") .. "/lua/config/plugins"


-- Load plugins from folders
local function load_plugins()

    local handle, err = vim.loop.fs_scandir(plugin_basepath)
    if not handle then
        error("Failed to scan plugins directory: " .. err)
    end

    while true do

        local name, file_type = vim.loop.fs_scandir_next(handle)
        if not name then break end
    
        if file_type == "directory" and name ~= "init.lua" then
            
            local ok, plugin_loader_or_err = pcall(loadfile, plugin_basepath .. "/" .. name .. "/init.lua")

            if not ok or plugin_loader_or_err == nil then
                vim.notify("Failed to load plugin file for " .. name .. ": " .. tostring(plugin_loader_or_err), vim.log.levels.ERROR)
            else
                -- vim.notify("Loadfile result for " .. name .. ": " .. tostring(plugin_loader_or_err), vim.log.levels.INFO, {silent = true})
                if type(plugin_loader_or_err) == "function" then
                    local ok2, plugin_spec = pcall(plugin_loader_or_err)
                    if ok2 and type(plugin_spec) == "table" then
                        table.insert(plugins, plugin_spec)
                    else
                        vim.notify("Failed to run plugin loader function: " .. tostring(plugin_spec), vim.log.levels.ERROR)
                    end
                else
                    vim.notify("Plugin loader is not a function. Type: " .. type(plugin_loader_or_err), vim.log.levels.ERROR)
                end
            end

        end
    end
end

load_plugins()
return plugins
