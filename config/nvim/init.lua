if vim.g.vscode then
    -- VSCode extension
    vim.opt.ignorecase = true
    vim.opt.smartcase = true
    vim.opt.iskeyword:append("-")

    vim.g.mapleader = "<space>"

    vim.keymap.set("n", "db", "vb\"_d")
    vim.keymap.set("n", "<c-a>", "ggVG")
    vim.keymap.set("n", "<esc>", ":nohl")
    vim.keymap.set("n", "<tab>", ":bnext")

    vim.cmd("nnoremap <c-w> :call VSCodeNotify('workbench.action.closeActiveEditor')<cr>")
    vim.cmd("nnoremap <leader>ks :call VSCodeNotify('workbench.action.openGlobalKeybindings')<cr>")
    vim.cmd("nnoremap <leader>d :call VSCodeNotify('editor.action.revealDefinition')<cr>")
    vim.cmd("nnoremap <leader>g :call VSCodeNotify('workbench.view.scm')<cr>")
else
    -- ordinary Neovim
    require("basic")
end
