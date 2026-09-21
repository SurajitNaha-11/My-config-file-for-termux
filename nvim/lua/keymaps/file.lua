-- Leader
vim.g.mapleader = " "

-- File Management
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
    desc = "Find file",
})

vim.keymap.set("n", "<leader>fn", "<cmd>enew<CR>", {
    desc = "New file",
})

vim.keymap.set("n", "<leader>fe", "<cmd>Ex<CR>", {
    desc = "File explorer",
})

vim.keymap.set("n", "<leader>fo", "<cmd>cd %:p:h<CR>", {
    desc = "Open file directory",
})
