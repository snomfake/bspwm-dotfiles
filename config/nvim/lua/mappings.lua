vim.keymap.set("n", "db", "vb\"_d")
vim.keymap.set("n", "<c-a>", "ggVG")
vim.keymap.set("n", "<esc>", ":nohl<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<space>x", ":bw<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<tab>", ":bnext<cr>", { noremap = true, silent = true })

vim.keymap.set("n", "<c-h>", "<c-w>W")
vim.keymap.set("n", "<c-l>", "<c-w>w")

vim.keymap.set("n", "<c-p>", ":Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<a-1>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
