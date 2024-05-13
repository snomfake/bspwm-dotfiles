if vim.g.vscode then
    -- VSCode extension
    vim.cmd("set ignorecase")
    vim.cmd("set smartcase")
    vim.cmd("set iskeyword+=-")
    vim.cmd("let mapleader = ' '")
    vim.cmd("nnoremap db vb\"_d")
    vim.cmd("nnoremap <c-a> ggVG")
    vim.cmd("nnoremap <esc> :nohl<cr>")
    vim.cmd("nnoremap <tab> :bnext<cr>")
    vim.cmd("nnoremap <leader>ks :call VSCodeNotify('workbench.action.openGlobalKeybindings')<cr>")
    vim.cmd("nnoremap <leader>w :call VSCodeNotify('workbench.action.closeActiveEditor')<cr>")
    vim.cmd("nnoremap <leader>d :call VSCodeNotify('editor.action.revealDefinition')<cr>")
    vim.cmd("nnoremap <leader>g :call VSCodeNotify('workbench.view.scm')<cr>")
else
    -- ordinary Neovim
    require("basic")
end
