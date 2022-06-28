
local Module = {}

function Module.map(mode, new, old, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, new, old, options)
end

return Module
