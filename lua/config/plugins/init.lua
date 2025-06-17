-- 
-- Plugin management
--

-- Every plugin will be stored in its own directory, and every directory will
-- contain a single init.lua file, that will contain the config options for 
-- that specific modile. This file will simply find these and load them, but
-- each plugin will be neatly contained in its own folder

local plugins = {}

local scan = vim.loop.fs_scandir
local plugin_basepath = vim.fn.stdpath("config") .. "/lua/config/plugins"

-- Determina whether a given path is a directory
local function is_dir(path)
    local stat = vim.loop.fs_stat(path)
    return stat and stat.type == "directory"
end

-- Load plugins from folders
local function load_plugins()

    local handle, err = scan(plugin_basepath)
    if not handle then
        error("Failed to scan plugins directory: " .. err)
    end

    while true do
        local name, file_type = vim.loop.fs_scandir_next(handle)
        if not name then break end
        if file_type == "directory" and name ~= "init.lua" then
            local ok, plugin_loader = pcall(loadfile, plugin_basepath .. "/" .. name .. "/init.lua")
            if ok and type(plugin_loader) == "function" then
                local plugin_spec = plugin_loader()
                vim.notify("Loaded plugin spec from: " .. type(plugin_spec), vim.log.levels.INFO)
                if type(plugin_spec) == "table" then
                    if plugin_spec[1] then
                        vim.list_extend(plugins, plugin_spec)
                    else
                        table.insert(plugins, plugin_spec)
                    end
                end
            else
                vim.notify("Failed to load plugin config for " .. name .. ": " .. tostring(plugin_spec), vim.log.levels.ERROR)
            end
        end
    end
end
    
load_plugins()
return plugins
