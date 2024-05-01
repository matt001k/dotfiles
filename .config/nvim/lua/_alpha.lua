local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
    "                                                     ",
    "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
    "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
    "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
    "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
    "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
    "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
    "                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" ,  ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "󰍉  > Find file",  ":Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   ,  ":Telescope oldfiles<CR>"),
    dashboard.button( "n", "  > File Tree" , ":lua Telescope_Filetree()<CR>"),
    dashboard.button( "s", "  > Settings" ,  ":e $MYVIMRC | pwd<CR>"),
    dashboard.button( "t", "  > Terminal" ,  ":ToggleTerm size=20 dir=%:p:h direction=float<CR>"),
    dashboard.button( "q", "  > Quit NVIM",  ":qa!<CR>"),
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

vim.api.nvim_create_autocmd("VimEnter", {
    pattern = { "*" },
    once = true,
    command = vim.cmd("Alpha"),
})
