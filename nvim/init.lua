-- • overrides |loadfile()|
-- • adds the Lua loader using the byte-compilation cache
-- • adds the libs loader
-- • removes the default Nvim loader
vim.loader.enable()

-- setup editor options
require("config")

-- lazy (plugin manager) bootstrap
require("config.lazy")
